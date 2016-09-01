/*
 * arafepc_powerline_comms.h
 *
 *  Created on: Aug 31, 2016
 *      Author: barawn
 */

#ifndef ARAFEPC_POWERLINE_COMMS_H_
#define ARAFEPC_POWERLINE_COMMS_H_

extern volatile uint8_t rx_char;
extern volatile uint16_t tx_char_pending;

// 104 us between bits. This should be exact.
#define UART_TBIT 104
// Time from comparator setting up time to middle of first bit.
#define UART_FIRST_BIT 147

//< Get character from powerline comms. Just turn on comparator interrupt and sleep. (See interrupts_v2.asm for rx routines).
inline void get_char() {
	// Don't need to clear cur_char, each bit gets set/cleared deterministically.
	CACTL1 = CAON + CAIES + CAIE;
	_BIS_SR(LPM4_bits + GIE);
}

//< Send character to powerline comms.
inline void tx_char(unsigned char tx) {
	// Stop the counter, and clear it.
	TA1CTL = 0;
	TA1CCR0 = UART_TBIT;
	TA1CCTL0 = CCIE;
	// now set it off running.
	TA1CTL = TASSEL_2 + ID_3 + MC_1 + TACLR;
	// Upshift by 1 (the start bit is 0), plus
	// add the stop bit (bit 10).
	tx_char_pending = (tx << 1) | (0x200);
	// Sleep. We will wake up when a character has been fully sent.
	_BIS_SR(LPM0_bits + GIE);
}




#endif /* ARAFEPC_POWERLINE_COMMS_H_ */
