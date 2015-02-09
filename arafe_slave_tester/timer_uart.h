/*
 * timer_uart.h
 *
 *  Created on: Dec 9, 2014
 *      Author: barawn
 */

#ifndef TIMER_UART_H_
#define TIMER_UART_H_

#include <stdint.h>
#include "event2.h"

#ifndef TIMER_UART_C
extern event_t timer_uart_tx_event;
extern event_t timer_uart_rx_event;
extern uint16_t tx_char_pending;
#else
#pragma NOINIT(timer_uart_tx_event)
event_t timer_uart_tx_event;
#pragma NOINIT(timer_uart_rx_event)
event_t timer_uart_rx_event;
#pragma NOINIT(tx_char_pending)
uint16_t tx_char_pending;
#endif

// 104 us between bits. This should be exact.
#define UART_TBIT 104
// Time from comparator setting up time to middle of first bit.
#define UART_FIRST_BIT 147

static inline void tx_char(unsigned char tx) {
	// Stop the counter, and clear it.
	TA0CTL = 0;
	TA0CCR0 = UART_TBIT;
	TA0CCTL0 = CCIE;
	// now set it off running.
	TA0CTL = TASSEL_2 + ID_0 + MC_1 + TACLR;
	// Upshift by 1 (the start bit is 0), plus
	// add the stop bit (bit 10).
	tx_char_pending = (tx << 1) | (0x200);
}


#endif /* TIMER_UART_H_ */
