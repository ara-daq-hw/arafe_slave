#include <msp430.h>
#include <stdint.h>
#include "arafepc_pin_config.h"

/*
 * main.c
 *
 * Updates:
 * 			1: 06/17/2015 - Changed device_info[2] and [3] to 0xFD and 0xA7 respectively. This ensures 12EN control does not turn on when board is turned on
 * 			2: 06/17/2015 - Also changed read to read the device_info_buffer, not device_info
 *			3: 04/28/2016 - Added sensor 12v/5v_curr sense and FLT detect
 */

#pragma NOINIT(rx_char)
uint8_t rx_char;
// These are now stored in registers (r4/r5).
//#pragma NOINIT(rx_bits)
//uint8_t rx_bits;
//#pragma NOINIT(timer1_isr_next_step)
//uint16_t timer1_isr_next_step;
#pragma NOINIT(tx_char_pending)
uint16_t tx_char_pending;

#pragma NOINIT(ack_byte)
static uint8_t ack_byte;
// Simple, simple version of arafe_slave code. This might just work, too.
#pragma DATA_SECTION(rx_preamble, ".infoD")
const char rx_preamble[3] = "!M!";
#define rx_preamble_len 3
#define etx 0xFF
#pragma DATA_SECTION(tx_preamble, ".infoD")
const char tx_preamble[] = "!S!";
#define tx_preamble_len 3

// The INFOC segment contains the defaults.
// Byte 0/1: serial number
// Byte 2: P2OUT
// Byte 3: P3OUT
// Byte 4: ch0_sig
// Byte 5: ch1_sig
// Byte 6: ch2_sig
// Byte 7: ch3_sig
// Byte 8: ch0_trg
// Byte 9: ch1_trg
// Byte 10: ch2_trg
// Byte 11: ch3_trg
#pragma DATA_SECTION(device_info, ".infoC")
const uint8_t device_info[16]= {   0x00, 0x00,
								   0xFD, 0xFF, // [3] was 0xF7
								   0x00, 0x00,
								   0x00, 0x00,
								   0x00, 0x00,
								   0x00, 0x00,
								   0x12, 0x34,
								   0x56, 0x78 };
#pragma NOINIT(device_info_buffer)
#pragma DATA_ALIGN(device_info_buffer, 16)
uint8_t device_info_buffer[16];

#pragma NOINIT(cmd)
uint8_t cmd;
#pragma NOINIT(arg)
uint8_t arg;



static void clock_init();
static void comparator_init();
static void pin_init();
static void get_char();
static void handle_command();
static void clock_six_bits();
static void command_ack();
static void command_action();
static void device_init();
static void simple_copy_16(uint8_t *dst, const uint8_t *src);

static void sensor_init();
static void read_adc(uint8_t ch); // Keep in memory
#pragma NOINIT(adc_value) // Always NOINT this stuff, because the TI compiler eats glue
uint16_t adc_value;

// Const this, because TI really loves glue. Put it in the info section.
#pragma DATA_SECTION(channels, ".infoC")
const uint16_t channels[3] = {	INCH_10, // Temp
								INCH_6, //5v_curr
								INCH_7  // 12v_curr
							};

						//INCH_11, // Voltage
						//INCH_0, // Current
						//INCH_1	}; //

// The command table is pretty simple.
// 0: ping (do nothing, just acknowledge)
// 1: enable/disable 5V (arg = 0: disable, arg = 1: enable)
// 2, 3: no response
// 4: set signal attenuator channel 0
// 5: set signal attenuator channel 1
// 6: set signal attenuator channel 2
// 7: set signal attenuator channel 3
// 8: set trigger attenuator channel 0
// 9: set trigger attenuator channel 1
// 10: set trigger attenuator channel 2
// 11: set trigger attenuator channel 3
// 12: 12V enable channel 0
// 13: 12V enable channel 1
// 14: 12V enable channel 2
// 15: 12V enable channel 3
// all others are no response

static void device_init() {
	P2OUT = device_info[2];
	P2DIR = 0xFF;
	P3OUT = device_info[3];
	P3DIR = 0xFF;//Was 0xFD
	cmd = 8;
	do {
		cmd--;
		arg = device_info[cmd];
		command_action();
	} while (cmd);
	simple_copy_16(device_info_buffer, device_info);
}

static void clock_init() {
	// DCOCLK at 8 MHz.
	BCSCTL1 = XT2OFF | CALBC1_8MHZ;
	DCOCTL = CALDCO_8MHZ;
	// SMCLK from DCO, and divided by 8 (1 MHz).
	// MCLK = 8 MHz, SMCLK = 8 MHz.
}

static void comparator_init() {
    // Comparator A setup:
    // CAPD.0 = 1, CAPD.3 = 1, CACTL1 = 8'b0000 010x = 0x04 (off: when enabled, 0x0E), CACTL2 = 8'b0001010x = 0x14.
	// So CA+ = P1.0, CA- = P1.3, no reference used, comparator on, and falling edge triggers interrupt.
	// Interrupts not enabled initially.
    CAPD = cap_disable;
    CACTL2 = cap_ctl2;
    CACTL1 = CAON;
}

static void pin_init() {
    // P1.0: COMMS_COMP+ (CA0)
    // P1.1: BSL_TX
    // P1.2: BSL_RX
    // P1.3:  COMMS_COMP- (CA3)
    // P1.4: COMMS_TX (SMCLK output)
    // P1.5: BSL_RX
    // P1.6: 5V_Curr
    // P1.7: 12V_Curr

    // TimerA1 is used to do powerline comms. TimerA0 is used for a debugging UART.
    // When the comparator fires, the interrupt is disabled, and the value in TA1R is read.
    // This is then incremented to the middle of the next bit.
    // (Note that there's some jitter here, but this is likely not a big deal at 9600 bps. In the non-debugging
    //  case everything is halted normally). This is then written into a compare register, and the compare interrupt
    // is enabled. When the compare interrupt goes off, we sample a bit, and increment by the bit time. This repeats
    // 8 times, and then the last time, assuming it's 1, we disable the compare interrupt and process the byte. Then
    // the comparator input is reenabled.
    // So:
    // Port 1 setup:
    // P1DIR  = 8'b1101 1010 = 0xDA (when COMMS_TX on), 8'b11001010 = 0xCA  (when COMMS_TX off).
    // P1SEL  = 8'b0001 0000 = 0x10
    // P1SEL2 = 8'b0001 0000 = 0x00
    // P1OUT  = 0x00
    // Port 2 and 3 are by default all outputs except P3.1 and P3.7 (12v_EN).
    // P2DIR = 0xFF
    // P2SEL = 0x00
    // P2SEL2 = 0x00
    // P2OUT = 0xFF
    // P3DIR = 8'b1111 1111 = 0xFF
    // P3SEL = 0x00
    // P3SEL2 = 0x00
    // P3OUT = 0xFF
	//P1OUT = 0x80; //Also Experimental, bit set here determines whether pullup or pulldown res is enabled (in conjunction w/ P1REN)
	P1DIR = port1_dir;
    P1SEL = port1_sel;
    P1SEL2 = port1_sel2;
    P3SEL = port3_sel; // sels set low -> GPIO, set high -> comparator. Duh
    P3SEL2 = port3_sel2;
    device_init();
}

static void sensor_init()
{
	ADC10CTL0=SREF_1 + REFON + ADC10ON + ADC10SHT_3 ; //1.5V ref,Ref on,64 clocks for sample
	ADC10AE0 = analog_enable;

}

static void read_adc(uint8_t ch)
{
	ADC10CTL1 = channels[ch] + ADC10DIV_3; // Sensor is at INCH_ch and clock/4

	__delay_cycles(1000);              // Wait for reference to settle
	ADC10CTL0 |= ENC + ADC10SC;      // Enable Conversion
    while(ADC10CTL1 & BUSY);         // Converting...
    adc_value = ADC10MEM;                       // Store adc value
	ADC10CTL0&=~ENC;  // Disable Conversion
}

#pragma FUNC_NEVER_RETURNS(main)
void main(void) {
	static unsigned char preamble_match ;

	WDTCTL = WDTPW | WDTHOLD;	// Stop watchdog timer
    // Set up clocks.
    clock_init();
    // Set up pins.
    pin_init();
    // Set up comparator.
    comparator_init();
	// Initialize all our static variables.
	preamble_match = 0;

	sensor_init();

    // Main loop.
    while (1) {
    	while (preamble_match < rx_preamble_len) {
    		if (rx_char == rx_preamble[preamble_match]) {
    			preamble_match++;
    			get_char();
    		} else {
    			if (preamble_match) {
    				preamble_match = 0;
    			} else {
    				get_char();
    			}
    		}
    	}
    	cmd = rx_char;
    	get_char();
    	arg = rx_char;
    	get_char();
    	if (rx_char == etx) handle_command();
    	preamble_match = 0;
/*
    	// Get the next character from the powerline comms.
    	get_char();
    	// Are we matching the preamble?
    	if (preamble_match < rx_preamble_len) {
    		// Yes: compare it to the preamble.
    		if ( rx_char == rx_preamble[preamble_match]) {
    			// It matches - increment.
    			preamble_match++;
			} else {
				// It does not match. Check to see if it matches the first byte
				// of the preamble instead.
				if (rx_char == rx_preamble[0]) preamble_match = 1;
				else preamble_match = 0;
			}
    	} else {
    		// If we just read the preamble, we're now at the command step.
    		if (preamble_match == rx_preamble_len) {
    			cmd = rx_char;
    			preamble_match++;
    		}
    		// After that comes the argument step...
    		else if (preamble_match == rx_preamble_len + 1) {
    			arg = rx_char;
    			preamble_match++;
    		}
    		// Then check ETX, where we execute the command if it's OK.
    		else if (preamble_match == rx_preamble_len + 2) {
    			if (rx_char == etx) handle_command();
    			if (rx_char == rx_preamble[0]) preamble_match = 1;
    			else preamble_match = 0;
    		}
		}
*/
    }
}

// 104 us between bits. This should be exact.
#define UART_TBIT 104
// Time from comparator setting up time to middle of first bit.
#define UART_FIRST_BIT 147

static void get_char() {
	// Don't need to clear cur_char, each bit gets set/cleared deterministically.
	CACTL1 = CAON + CAIES + CAIE;
	_BIS_SR(LPM4_bits + GIE);
}

static void tx_char(unsigned char tx) {
	// Stop the counter, and clear it.
	TA1CTL = 0;
	TA1CCR0 = UART_TBIT;
	TA1CCTL0 = CCIE;
	// now set it off running.
	TA1CTL = TASSEL_2 + ID_3 + MC_1 + TACLR;
	// Upshift by 1 (the start bit is 0), plus
	// add the stop bit (bit 10).
	tx_char_pending = (tx << 1) | (0x200);
	// Sleep. We will wake up when a character has been received.
	_BIS_SR(LPM0_bits + GIE);
}

static void command_ack() {
	uint8_t counter;

	// Put a bit of a pause here to let the threshold settle.
	// This shouldn't be necessary in the end, but I don't think
	// it makes much of a difference.
	// 10 ms pause.
	__delay_cycles(80000);
	//Transmit preamble
	for (counter=tx_preamble_len;counter!=0;counter--) {
		tx_char(tx_preamble[counter-1]);
	}

	tx_char(cmd);
	tx_char(ack_byte);
	tx_char(etx);
	return;
}
static void simple_copy_16(uint8_t *dst, const uint8_t *src) {
	do {
		*dst++ = *src++;
	} while (((uint16_t) src) & 0xF);
//	uint8_t count;
//	for (count=16;count;count--) {
//		*dst++ = *src++;
//	}
}

static void device_info_flash() {
	// The flash timing generator must be between 257 kHz - 476 kHz.
	// We operate with SMCLK at 8 MHz. So we need to divide by 22.
	// This is FN4 + FN2 + FN0 (16 + 4 + 1, plus the implicit 1).
	FCTL2 = FWKEY + FSSEL_1 + FN4 + FN2 + FN0;	       // Clk = SMCLK/4
	FCTL3 = FWKEY;                       // Clear Lock bit
	FCTL1 = FWKEY + ERASE;               // Set Erase bit
	*((uint8_t *) device_info) = 0;
	FCTL1 = FWKEY + WRT;
	simple_copy_16((uint8_t *) device_info, device_info_buffer);
	FCTL1 = FWKEY;
	FCTL3 = FWKEY + LOCK;
}


// Pin configuration.
// These are stored in infoD.

static void handle_command() {
	if (cmd & 0x80) {//Write
		device_info_buffer[cmd & 0xF] = arg;
		ack_byte = 0;
	} else if (cmd & 0x40) {//read
		ack_byte = device_info_buffer[cmd & 0xF];
	} else if (cmd & 0x20) {//flash
		device_info_flash();
	} else if (cmd & 0x10) { // sensor reads, assume first time it goes to else so the value can be read
		unsigned char sensor_val = cmd & 0xF;
		if (sensor_val ==  4) ack_byte = (adc_value & 0x3); // For lower two bits of the adc10 value, check first and then read off
		else { // For the upper 8 bits, convert the value first
			if (sensor_val == 3){ //If sensor 3 -> look for fault detection
				P1REN=0x80; //Enable Pullup resistors
				P1OUT |= 0x80;
				ADC10AE0 = analog_enable_fault; //Set for fault detection
				read_adc(0x02); //Read the 12v_curr line (for FLT detect)
				ack_byte = adc_value >> 2; // Shift right by 2
				P1REN = 0x00; //Disable pullup resistors
				ADC10AE0 = analog_enable; //Return ADC10AE for 5 and 12v current sensing (default)
			} else{
			read_adc(sensor_val); // Pull out the requested channel and use as function argument
			ack_byte = adc_value >> 2; // Shift right by 2
			}
		}
	} else {
		command_action();
		ack_byte = 0;
	}
	command_ack();
}

// Command_action can be called during the initialization function.
// That is, if you just start at cmd=4 and increment until cmd=12,
// set 'arg' to the initialization value, and it'll handle it like a normal
// command, without the 'ack'ing.
static void command_action() {
	volatile uint8_t *addr;
	uint8_t ch;
	//uint8_t type

	ch = cmd & 0x3;
	// type = cmd & 0x0C;

	if (!(cmd & 0x08)) {
		// Commands 0-7 are sig/trig set commands.
		addr = att_port_arr[cmd & 0x7];
		*addr &= ~att_bit_arr[cmd & 0x7];
		// At this point we've lowered the chip select we want.
		// So now clock the data.
		clock_six_bits();
		// Raise all chip selects, since we lowered one.
		*addr |= att_bit_arr[cmd & 0x7];
		// Done.
	} else if (!(cmd & 0x04)) {
		addr = enable_port_arr[ch];
		if (arg) *addr |= enable_bit_arr[ch];
		else *addr &= ~enable_bit_arr[ch];
	} else {
		// 5V enable.
		if (ch & 0x1) {
			addr = en_5v_port;
			if (arg) *addr |= en_5v_bit; else *addr &= ~en_5v_bit;
		}
		// 12V enable.
		else if(ch & 0x2) {
			addr = en_12v_port;
			if (arg) *addr |= en_12v_bit; else *addr &= ~en_12v_bit;

		}
	}
}

void clock_six_bits() {
	volatile uint8_t *clk_port;
	volatile uint8_t *data_port;
	uint8_t counter;

	clk_port = spiclk_port;
	data_port = spidata_port;

	for (counter=6;counter !=0;counter--) {
		*clk_port &= ~spiclk_bit;
		*data_port &= ~spidata_bit;
		if (arg & 0x20) *data_port |= spidata_bit;
		*clk_port |= spiclk_bit;
		arg <<= 1;
	}
	*clk_port &= ~spiclk_bit;
	*data_port &= ~spidata_bit;
}

