/*
 * arafe.c
 *
 *  Created on: Dec 9, 2014
 *      Author: barawn
 */
#include "timer_uart.h"
#define ARAFE_C
#include "arafe.h"
#include <stdbool.h>

typedef enum arafe_state_t {
	STATE_PREAMBLE_0 = 1,
	STATE_PREAMBLE_1 = 2,
	STATE_PREAMBLE_2 = 3,
	STATE_COMMAND = 4,
	STATE_ARGUMENT = 5,
	STATE_ETX = 6,
	STATE_LISTEN = 7,
	STATE_IDLE = 0
} arafe_state_t;

static arafe_state_t state = STATE_IDLE;

bool arafe_busy() {
	return (state != STATE_IDLE);
}

void arafe_send_command() {
	state = STATE_PREAMBLE_0;
	arafe_tx_handler();
}

void arafe_tx_handler() {
	switch (state) {
	case STATE_PREAMBLE_0:
	case STATE_PREAMBLE_2:
		tx_char('!');
		break;
	case STATE_PREAMBLE_1:
		tx_char('M');
		break;
	case STATE_COMMAND:
		tx_char(arafe_command);
		break;
	case STATE_ARGUMENT:
		tx_char(arafe_argument);
		break;
	case STATE_ETX:
		tx_char(0xFF);
		break;
	case STATE_LISTEN:
		// switch comparator on and listen for acknowledge.
		// or something like that. Need to figure this part out.
		state = STATE_IDLE;
		return;
	}
	state++;
}
