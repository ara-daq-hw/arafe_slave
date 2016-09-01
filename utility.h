/*
 * utility.h
 *
 *  Created on: Aug 31, 2016
 *      Author: barawn
 */

#ifndef UTILITY_H_
#define UTILITY_H_

#include <stdint.h>

void opt_delay(uint16_t ncycles);
//< Copy 16 bytes. This is the most space-efficient way to do it. Only works on 16-byte aligned structures.
void simple_copy_16(uint8_t *dst, const uint8_t *src);
uint8_t get_switch_command();

#endif /* UTILITY_H_ */
