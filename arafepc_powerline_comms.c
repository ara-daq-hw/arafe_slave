/*
 * arafepc_powerline_comms.c
 *
 *  Created on: Aug 31, 2016
 *      Author: barawn
 */

#include <stdint.h>

#pragma NOINIT(rx_char)
volatile uint8_t rx_char;

#pragma NOINIT(tx_char_pending)
volatile uint16_t tx_char_pending;
