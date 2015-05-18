#include <msp430.h>
#include <stdint.h>
#include "arafepc_pin_config.h"
/*
 * main.c
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
								   0xFF, 0xFF,
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
	P3DIR = 0xFF;
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
    // CAPD.0 = 1, CAPD.2 = 1, CACTL1 = 8'b0000 010x = 0x04 (off: when enabled, 0x0E), CACTL2 = 8'b0001010x = 0x14.
	// So CA+ = P1.0, CA- = P1.2, no reference used, comparator on, and falling edge triggers interrupt.
	// Interrupts not enabled initially.
    CAPD = cap_disable;
    CACTL2 = cap_ctl2
    CACTL1 = CAON;
}

static void pin_init() {
    // P1.0: COMMS_COMP+ (CA0)
    // P1.1: BSL_TX
    // P1.2: COMMS_COMP- (CA2)
    // P1.3: unused
    // P1.4: COMMS_TX (SMCLK output)
    // P1.5: BSL_RX
    // P1.6: SPI_CLK
    // P1.7: SPI_DATA

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
    // Port 2 and 3 are by default all outputs except P3.1.
    // P2DIR = 0xFF
    // P2SEL = 0x00
    // P2SEL2 = 0x00
    // P2OUT = 0xFF
    // P3DIR = 8'b1111 1101 = 0xFD
    // P3SEL = 0x00
    // P3SEL2 = 0x00
    // P3OUT = 0xFF

	P1DIR = port1_dir;
    P1SEL = port1_sel;
    P1SEL2 = port1_sel2;
    P3SEL = port3_sel;
    P3SEL2 = port3_sel2;
    device_init();
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

// TUNE THESE FOR THE VERSION BEING USED

// Pin configuration.
// These are stored in infoD.

static void handle_command() {
	if (cmd & 0x80) {
		device_info_buffer[cmd & 0xF] = arg;
		ack_byte = 0;
	} else if (cmd & 0x40) {
		ack_byte = device_info[cmd & 0xF];
	} else if (cmd & 0x20) {
		device_info_flash();
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
	//uint8_t type;

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
		*addr |= att_bit_arr[ch];
		// Done.
	} else if (!(cmd & 0x04)) {
		addr = enable_port_arr[ch];
		if (arg) *addr |= enable_bit_arr[ch];
		else *addr &= enable_bit_arr[ch];
	} else {
		// 5V enable.
		if (ch & 0x1) {
			addr = en_5v_port;
			if (arg) *addr |= en_5v_bit; else *addr &= ~en_5v_bit;
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

