#include <msp430.h>
#include <stdint.h>
/*
 * main.c
 */

uint8_t rx_char;
uint8_t rx_bits;
uint16_t timer1_isr_next_step;
uint16_t tx_char_pending;

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

#pragma DATA_ALIGN(device_info_buffer, 16)
static uint8_t device_info_buffer[16];

static uint8_t cmd;
static uint8_t arg;

static void clock_init();
static void comparator_init();
static void pin_init();
static void get_char();
static void handle_command();
static void clock_six_bits();
static void command_ack();
static void command_action();
static void device_init();
static void simple_copy_16(uint8_t *dst, uint8_t *src);

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

#define SPI_PORT P1OUT
#define SPI_CLK (BIT6)
#define SPI_DATA (BIT7)

// En ports go
// P3 , P2, P3, P2
//  0 ,  2,  4,  5
// Sig/trig ports are
// P2, P3, P2, P3
// Sig NCSs are
// 0, 2, 3, 5
// Trg NCSs are
// 1, 3, 4, 6
// So we could map this to
// 0, 2, 7, 5
// 1, 3, 4, 6

// Sig/trig ports are all the same.
#define CH0_EN_PORT P3OUT
#define CH0_EN (BIT0)
#define CH0_SIG_PORT P2OUT
#define CH0_SIG_NCS (BIT0)
#define CH0_TRG_PORT P2OUT
#define CH0_TRG_NCS (BIT1)

#define CH1_EN_PORT P2OUT
#define CH1_EN (BIT2)
#define CH1_SIG_PORT P3OUT
#define CH1_SIG_NCS (BIT2)
#define CH1_TRG_PORT P3OUT
#define CH1_TRG_NCS (BIT3)

#define CH2_EN_PORT P3OUT
#define CH2_EN (BIT4)
#define CH2_SIG_PORT P2OUT
#define CH2_SIG_NCS (BIT3)
#define CH2_TRG_PORT P2OUT
#define CH2_TRG_NCS (BIT4)

#define CH3_EN_PORT P2OUT
#define CH3_EN (BIT5)
#define CH3_SIG_PORT P3OUT
#define CH3_SIG_NCS (BIT5)
#define CH3_TRG_PORT P3OUT
#define CH3_TRG_NCS (BIT6)

// On port 2, pins 0, 1, 3, 4 are chip selects: 0001 1011 0x1B
#define PORT2_NCS_MASK 0x1B
// On port 3, pins 2, 3, 5, 6 are chip selects: 0110 11000 0x6C
#define PORT3_NCS_MASK 0x6C

#define EN_5V_PORT P3OUT
#define EN_5V (BIT7)

static void simple_copy_16(uint8_t *dst, uint8_t *src);

static void device_init() {
	P2OUT = device_info[2];
	P2DIR = 0xFF;
	P3OUT = device_info[3];
	P3DIR = 0xFD;
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
    CAPD = CAPD0 + CAPD2;
    CACTL2 = P2CA0 + P2CA2;
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
    // P1SEL  = 8'b0001 1000 = 0x18
    // P1SEL2 = 8'b0000 1000 = 0x08
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
    P1DIR = 0xCA;
    P1SEL = 0x18;
    P1SEL2 = 0x08;

    device_init();
}

void main(void) {

	WDTCTL = WDTPW | WDTHOLD;	// Stop watchdog timer
    // Set up clocks.
    clock_init();
    // Set up pins.
    pin_init();
    // Set up comparator.
    comparator_init();
    // Main loop.
    while (1) {
    	// Get the next character from the powerline comms.
    	if (rx_char != '!') get_char();
    	else {
    		get_char();
    		if (rx_char != 'M') continue;
    		get_char();
    		if (rx_char != '!') continue;
    		get_char();
    		cmd = rx_char;
    		get_char();
    		arg = rx_char;
    		get_char();
    		if (rx_char != 0xFF) continue;
    		handle_command();
    	}
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
	TACTL = 0;
	TACCR0 = UART_TBIT;
	TACCTL0 = CCIE;
	// now set it off running.
	TACTL = TASSEL_2 + ID_0 + MC_1 + TACLR;
	// Upshift by 1 (the start bit is 0), plus
	// add the stop bit (bit 10).
	tx_char_pending = (tx << 1) | (0x200);
	// Sleep. We will wake up when a character has been received.
	_BIS_SR(LPM0_bits + GIE);
}

static void command_ack() {
	uint8_t counter;

	for (counter=tx_preamble_len;counter!=0;counter--) {
		tx_char(tx_preamble[counter]);
	}
	tx_char(cmd);
	tx_char(ack_byte);
	tx_char(etx);
	return;
}
static void simple_copy_16(uint8_t *dst, uint8_t *src) {
	do {
		*dst++ = *src++;
	} while (((uint16_t) src) & 0x10);
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
	simple_copy_16(device_info, device_info_buffer);
	FCTL1 = FWKEY;
	FCTL3 = FWKEY + LOCK;
}


#pragma DATA_SECTION(enable_arr, ".infoD")
const uint8_t enable_arr[4] = { CH0_EN, CH1_EN, CH2_EN, CH3_EN };
#pragma DATA_SECTION(sig_arr, ".infoD")
const uint8_t sig_arr[4] = {CH0_SIG_NCS, CH1_SIG_NCS, CH2_SIG_NCS, CH3_SIG_NCS};
#pragma DATA_SECTION(trg_arr, ".infoD")
const uint8_t trg_arr[4] = {CH0_TRG_NCS, CH1_TRG_NCS, CH2_TRG_NCS, CH3_TRG_NCS};

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
	uint8_t mask;
	uint8_t ch;
	//uint8_t type;

	ch = cmd & 0x3;
	// type = cmd & 0x0C;

	if (!(cmd & 0x08)) {
		if (ch & 0x1) addr = &P3OUT;
		else addr = &P2OUT;
		if (cmd & 0x4) mask = trg_arr[ch];
		else mask = sig_arr[ch];

		*addr &= ~mask;
		// At this point we've lowered the chip select we want.
		// So now clock the data.
		clock_six_bits();
		// Raise all chip selects, since we lowered one.
		*addr |= mask;
		// Done.
	} else if (!(cmd & 0x04)) {
		// Port enable.
		if (ch & 0x1) addr = &P2OUT;
		else addr = &P3OUT;

		if (arg) *addr |= enable_arr[ch];
		else *addr &= ~enable_arr[ch];
	} else {
		// 5V enable.
		if (ch & 0x1) {
			if (arg) EN_5V_PORT |= EN_5V; else EN_5V_PORT &= ~EN_5V;
		}
	}
}

void clock_six_bits() {
	uint8_t counter;

	for (counter=6;counter !=0;counter--) {
		SPI_PORT &= ~SPI_CLK;
		SPI_PORT &= ~SPI_DATA;
		if (arg & 0x20) SPI_PORT |= SPI_DATA;
		SPI_PORT |= SPI_CLK;
		arg <<= 1;
	}
	SPI_PORT &= ~(SPI_CLK | SPI_DATA);
}

// Replace this with:
// rrc tx_char_pending
// jnc timer1_a0_isr_clear
// nop
// nop
// bis #(BIT4), P1SEL
// reti
// timer1_a0_isr_clear:
// jz  timer1_a0_isr_done
// bic #(BIT4), P1SEL
// reti
// timer1_a0_isr_done:
// mov.w #(TASSEL_2 + ID_3 + TACLR + MC_0), &TACTL
// clr.w &TACCTL0
// bic.w #(LPM0), 0(SP)
// reti
//#pragma vector = TIMER1_A0_VECTOR
//__interrupt void TIMER1_A0_ISR(void) {
//	unsigned int p1sel_temp;
//	// if tx_char_pending is set, we're transmitting.
//	// otherwise, we're receiving.
//	if (tx_char_pending) {
//		p1sel_temp = P1SEL;
//		if (tx_char_pending & 0x1) p1sel_temp &= ~(BIT4);
//		else p1sel_temp |= BIT4;
//		P1SEL = p1sel_temp;
//
//		tx_char_pending >>= 1;
//		// was that the stop bit? if so, kill the counter and wake up
//		if (!tx_char_pending) {
//			TACTL = TASSEL_2 + ID_3 + TACLR + MC_0;
//			TACCTL0 = 0;
//			_bic_SR_register_on_exit(LPM0_bits);
//		}
//		// otherwise, stay asleep, we'll wake up at the next bit transition.
//	}
//}
