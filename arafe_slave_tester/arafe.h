/*
 * arafe.h
 *
 *  Created on: Dec 9, 2014
 *      Author: barawn
 */

#ifndef ARAFE_H_
#define ARAFE_H_

#include <stdint.h>
#include <stdbool.h>

#ifndef ARAFE_C
extern uint8_t arafe_command;
extern uint8_t arafe_argument;
#else
#pragma NOINIT(arafe_command)
uint8_t arafe_command;
#pragma NOINIT(arafe_argument)
uint8_t arafe_argument;
#endif

#define ARAFE_COMMAND_PING 12
#define ARAFE_COMMAND_5V 13
#define ARAFE_COMMAND_FLASH 32
//< Commands 0-3 are signal attenuator set
#define ARAFE_COMMAND_SIG 0
//< Commands 4-7 are trigger attenuator set
#define ARAFE_COMMAND_TRIG 4
//< Commands 8-11 are power enable
#define ARAFE_COMMAND_CONTROL 8
//< Commands 128-143 are device info writes
#define ARAFE_COMMAND_WRITE 128
//< Commands 64-79 are device info reads
#define ARAFE_COMMAND_READ 64



void arafe_send_command();
void arafe_tx_handler();
bool arafe_busy();

#endif /* ARAFE_H_ */
