#include <msp430.h>
#include <stdint.h>
#include "arafepc_board_specific.h"
#include "arafepc_powerline_comms.h"
#include "utility.h"
/*
 * main.c
 *
 * Updates:
 * 			1: 06/17/2015 - Changed device_info[2] and [3] to 0xFD and 0xA7 respectively. This ensures 12EN control does not turn on when board is turned on
 * 			2: 06/17/2015 - Also changed read to read the device_info_buffer, not device_info
 *			3: 04/28/2016 - Added sensor 12v/5v_curr sense and FLT detect
 *			4: 8/11/2016 - Bump to v1.0. Rework for RFSA3713, fix device_info bugs, guard against serial number/signature overwrite.
 *			5: 8/31/2016 - Change load attenuator function to have correct data transfer. Reduce some functions for space purposes.
 *			6: 9/1/2016 - v2.0. Rework the command protocol to save space. Bugfixes.
 */

#define VER_MAJOR 2
#define VER_MINOR 0

#pragma DATA_SECTION(tx_template, ".infoC")
// Transmitted data is really only 6 bytes long, but we want to reuse simple_copy_16.
#pragma DATA_ALIGN(tx_template, 16)
// Note that this is BACKWARDS since the counter runs from 6 to 0.
const uint8_t tx_template[16] = { 0xFF, 0, 0, '!', 'S', '!', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
#pragma NOINIT(tx_data)
#pragma DATA_ALIGN(tx_data, 16)
//< Actual data to transmit.
uint8_t tx_data[16];
//< Length of data to transmit.
const uint8_t tx_data_len = 6;
//< Location of command byte.
const uint8_t tx_data_cmd_idx = 2;
//< Location of ack byte.
const uint8_t tx_data_ack_idx = 1;

#pragma DATA_SECTION(rx_preamble, ".infoC")
//< Preamble received from master.
const char rx_preamble[3] = "!M!";
#define rx_preamble_len 3
//< End of transmission.
#define etx 0xFF

//< Location in device info structure of P2OUT default.
#define DEVICE_INFO_P2OUT 8
//< Location in device info structure of P3OUT default.
#define DEVICE_INFO_P3OUT 9
// device_info[0-7] are the attenuator settings.
// device_info[8] is P2OUT default
// device_info[9] is P3OUT default
// device_info[11:10] is serial[1:0]
// device_info[15:12] is a signature.
#pragma DATA_SECTION(device_info, ".infoB")
//< Device information structure. Contains defaults, serial number, version number, and signature.
const uint8_t device_info[16]= {   0x00, 0x00,
		                           0x00, 0x00,
		                           0x00, 0x00,
		                           0x00, 0x00,
								   0x00, 0x82,
								   0x00, 0x00,
								   VER_MAJOR, VER_MINOR,
								   0x12, 0x34 };
#pragma NOINIT(device_info_buffer)
#pragma DATA_ALIGN(device_info_buffer, 16)
//< Copy of device info in working memory.
uint8_t device_info_buffer[16];

#pragma NOINIT(cmd)
//< Command byte.
uint8_t cmd;
#pragma NOINIT(arg)
//< Argument byte.
uint8_t arg;

#pragma NOINIT(adc_value)
//< Last read ADC value.
uint16_t adc_value;


static void clock_init();
static void comparator_init();
static void pin_init();
static void handle_command();
void load_attenuator();
static void command_ack();
static void device_init();
static void sensor_init();
static void read_adc(uint8_t ch); // Keep in memory

//< Initialize device to defaults.
static void device_init() {
	// P2 and P3 only hold digital outputs that we can't screw up our communications.
	P2OUT = device_info[DEVICE_INFO_P2OUT];
	P2DIR = 0xFF;
	P3OUT = device_info[DEVICE_INFO_P3OUT];
	P3DIR = 0xFF;
	// Sleep ~11 ms. Each count is 3 clocks (dec+jne). This is therefore 90000 clocks. This is ~11 ms.
	opt_delay(30000);
	// We can now go ahead and pretend we get commands 7-0,
	// grabbing the device_info as the argument for each one.
	cmd = 8;
	do {
		cmd--;
		arg = device_info[cmd];
		// This doesn't ever actually *transmit* an ack, it just fills the buffer.
		// So we can reuse it here.
		handle_command();
	} while (cmd);
	simple_copy_16(device_info_buffer, device_info);
}

//< Initialize clock subsystem.
static void clock_init() {
	// DCOCLK at 8 MHz.
	BCSCTL1 = XT2OFF | CALBC1_8MHZ;
	DCOCTL = CALDCO_8MHZ;
	// SMCLK from DCO, and divided by 8 (1 MHz).
	// MCLK = 8 MHz, SMCLK = 8 MHz.
}

//< Initialize the comparators.
static void comparator_init() {
	// Disable digital buffers on P1.0 and P1.3.
	CAPD = CAPD0 | CAPD3;
	// [P2CA4,P2CA0] = 01, so In+ = CA0
	// [P2CA3,P2CA2,P2CA1] = 011, so In- = CA3.
    CACTL2 = P2CA0 | P2CA2 | P2CA1;
    // Turn on comparator.
    CACTL1 = CAON;
}

//< Initialize pins.
static void pin_init() {
    P1DIR = 0x10;
    P1OUT |= 0x80;
    P2SEL = 0x00;
    device_init();
}

//< Initialize sensors.
static void sensor_init()
{
	ADC10CTL0=SREF_1 + REFON + ADC10ON + ADC10SHT_3 ; //1.5V ref,Ref on,64 clocks for sample
	ADC10AE0 =0xC0;
}

//< Read a single ADC.
static void read_adc(uint8_t ch)
{
	ADC10CTL1 = sensor_channels[ch]; // Sensor is at INCH_ch and clock/4
	opt_delay(331);
	ADC10CTL0 |= ENC + ADC10SC;      // Enable Conversion
    while(ADC10CTL1 & BUSY);         // Converting...
    adc_value = ADC10MEM;                       // Store adc value
	ADC10CTL0&=~ENC;  // Disable Conversion
	//< Return the top 8 bits (low precision read).
	tx_data[tx_data_ack_idx] = adc_value >> 2;
}

#pragma FUNC_NEVER_RETURNS(main)
//< Main.
void main(void) {
	static unsigned char preamble_match ;

	WDTCTL = WDTPW | WDTHOLD;	// Stop watchdog timer
    // Set up clocks.
    clock_init();
    // Set up pins.
    pin_init();
    // Set up comparator.
    comparator_init();
    // Set up sensors.
    sensor_init();

    // Initialize all our static variables.
	preamble_match = 0;
	simple_copy_16(tx_data, tx_template);

    // Main loop.
    while (1) {
    	// Look for the preamble.
    	while (preamble_match < rx_preamble_len) {
    		if (rx_char == rx_preamble[preamble_match]) {
    			preamble_match++;
    			// Get next character. If we're at the end, we'll fall out of the loop here.
    			get_char();
    		} else {
    			if (preamble_match) {
    				preamble_match = 0;
    			} else {
    				get_char();
    			}
    		}
    	}
    	// Last received character is command.
    	cmd = rx_char;
    	// Get argument.
    	get_char();
    	// Last received character is argument.
    	arg = rx_char;
    	// Get ETX.
    	get_char();
    	// Check ETX, and if it matches, handle command and send acknowledge.
    	if (rx_char == etx) {
    		handle_command();
    		command_ack();
    	}
    	// Reset preamble count. Wait for next command.
    	preamble_match = 0;
    }
}

static void command_ack() {
	// Iterator.
	uint8_t counter;
	// This can be precomputed, rather than subtracting 1 from the stupid thing every time.
	const uint8_t *const tx_data_minus_one = tx_data - 1;

	tx_data[tx_data_cmd_idx] = cmd;
	opt_delay(26664);
	for (counter=tx_data_len;counter;counter--) {
		tx_char(tx_data_minus_one[counter]);
	}
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


typedef enum command_type {
  CMD_ATTENUATOR = 0,
  CMD_SENSOR = 2,
  CMD_INFO = 4,
  CMD_MISC = 6
} command_type_t;

//< Handle an incoming command.
static void handle_command() {
	uint8_t subcmd;
	uint8_t flag;
	uint8_t idx;
	volatile uint8_t *addr;
	uint8_t tmp;

	if (cmd == 0xFF) {
		device_info_flash();
		tx_data[tx_data_ack_idx] = 0;
		return;
	}
	// The C compiler is very, very dumb.
	// This function takes 8 bytes of space, plus the call, so 10 bytes total.
	// If I put the logical equivalent of it here (tmp = (((cmd << 2) >> 8) & 0xFF) << 1;) it takes
	// *52* because it pulls in the asr16 library and uses a shift-by-7. Sooo dumb.
	tmp = get_switch_command();
	subcmd = cmd & 0xF;
	idx = cmd & 0x7;
	flag = cmd & 0x10;
	switch (__even_in_range(tmp, CMD_MISC)) {
	case CMD_ATTENUATOR:
		addr = att_port_arr[idx];
		*addr &= ~att_bit_arr[idx];
		load_attenuator();
		*addr |= att_bit_arr[idx];
		*addr &= ~att_bit_arr[idx];
		tx_data[tx_data_ack_idx] = 0;
		return;
	case CMD_SENSOR:
		if (subcmd > 4) {
			tx_data[tx_data_ack_idx] = adc_value & 0x3;
			return;
		}
		if (subcmd == 3) {
			P1REN = 0x80;
			ADC10AE0 = 0x40;
			subcmd = 2;
		}
		read_adc(subcmd);
		tx_data[tx_data_ack_idx] = adc_value >> 2;
		P1REN = 0x00;
		ADC10AE0 = 0xC0;
		return;
	case CMD_INFO:
		if ((flag) && (subcmd < 12)) device_info_buffer[subcmd] = arg;
		tx_data[tx_data_ack_idx] = device_info_buffer[subcmd];
		return;
	case CMD_MISC:
		addr = pwr_port_arr[idx];
		if (arg) *addr |= pwr_bit_arr[idx];
		else *addr &= ~pwr_bit_arr[idx];
		tx_data[tx_data_ack_idx] = 0;
		return;
	}
}

inline void load_attenuator() {
	uint16_t shift_data;

	// Attenuator loading:
	// LE stays low, and 16-bits of data are clocked in.
	// Then LE for the appropriate attenuator goes high, then low.
	shift_data = 0x8000;
	shift_data |= arg;
	while (shift_data) {
		P2OUT &= ~BIT6;
		if (shift_data & 0x1) P2OUT |= BIT7;
		else P2OUT &= ~BIT7;
		P2OUT |= BIT6;
		shift_data = shift_data >> 1;
	}
	P2OUT &= ~BIT6;
	P2OUT &= ~BIT7;
}

