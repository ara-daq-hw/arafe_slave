/*
 * boot.h
 *
 *  Created on: Dec 1, 2014
 *      Author: barawn
 */

#ifndef BOOT_H_
#define BOOT_H_

#include <msp430.h>

// #define COND_TIMER1_ISR_NEXT_STEP	&timer1_isr_next_step
// #define COND_RX_BITS					&rx_bits
#define COND_TIMER1_ISR_NEXT_STEP	r4
#define COND_RX_BITS				r5

#endif /* BOOT_H_ */
