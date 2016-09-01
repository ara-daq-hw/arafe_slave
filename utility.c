/*
 * utility.c
 *
 *  Created on: Aug 31, 2016
 *      Author: barawn
 */

#include "utility.h"

void simple_copy_16(uint8_t *dst, const uint8_t *src) {
	do {
		*dst++ = *src++;
	} while (((uint16_t) src) & 0xF);
}
__asm("   .global opt_delay");
__asm("opt_delay:");
__asm("   DEC.W r12");
__asm("   JNE opt_delay");
__asm("   RET");

__asm("   .global get_switch_command");
__asm("   .global cmd");
__asm("get_switch_command:");
__asm("   MOV.B	&cmd, r13");
__asm("   RLA.W r13");
__asm("   RLA.W r13");
__asm("   SWPB  r13");
__asm("   MOV.B r13, r12");
__asm("   RLA.B r12");
__asm("   RET");

