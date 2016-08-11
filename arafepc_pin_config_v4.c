/*
 * arafepc_pin_config_v4.c
 *
 *  Created on: Apr 10, 2015
 *      Author: barawn
 */

#include <msp430.h>
#include <stdint.h>

#define CH0_EN_PORT		P3OUT
#define CH0_EN_BIT		BIT6

#define CH1_EN_PORT 	P3OUT
#define CH1_EN_BIT		BIT4

#define CH2_EN_PORT 	P3OUT
#define CH2_EN_BIT		BIT3

#define CH3_EN_PORT 	P2OUT
#define CH3_EN_BIT		BIT1

#define TATTCS0_PORT	P2OUT
#define TATTCS0_BIT		BIT5

#define TATTCS1_PORT	P2OUT
#define TATTCS1_BIT		BIT4

#define TATTCS2_PORT	P2OUT
#define TATTCS2_BIT		BIT2

#define TATTCS3_PORT	P3OUT
#define TATTCS3_BIT		BIT0

#define SATTCS0_PORT	P3OUT
#define SATTCS0_BIT		BIT5

#define SATTCS1_PORT	P2OUT
#define SATTCS1_BIT		BIT3

#define SATTCS2_PORT	P3OUT
#define SATTCS2_BIT		BIT2

#define SATTCS3_PORT	P2OUT
#define SATTCS3_BIT		BIT0

#define EN5V_PORT		P3OUT
#define EN5V_BIT		BIT1

#define EN12V_PORT      P3OUT
#define EN12V_BIT       BIT7

#define SPI_CLK_PORT	P2OUT // Changed from P1OUT
#define	SPI_CLK_BIT		BIT6

#define SPI_DATA_PORT	P2OUT // Changed from P1OUT
#define SPI_DATA_BIT	BIT7




#pragma DATA_SECTION(enable_port_arr, ".infoD")
volatile uint8_t *const enable_port_arr[4] = { &CH0_EN_PORT,
											   &CH1_EN_PORT,
											   &CH2_EN_PORT,
											   &CH3_EN_PORT };
#pragma DATA_SECTION(enable_bit_arr, ".infoD")
const uint8_t enable_bit_arr[4] = { CH0_EN_BIT, CH1_EN_BIT, CH2_EN_BIT, CH3_EN_BIT };
#pragma DATA_SECTION(att_port_arr, ".infoD")
volatile uint8_t *const att_port_arr[8] = { &SATTCS0_PORT, &SATTCS1_PORT, &SATTCS2_PORT, &SATTCS3_PORT,
											&TATTCS0_PORT, &TATTCS1_PORT, &TATTCS2_PORT, &TATTCS3_PORT };
#pragma DATA_SECTION(att_bit_arr, ".infoD")
const uint8_t att_bit_arr[8] = 	{ 	SATTCS0_BIT, SATTCS1_BIT, SATTCS2_BIT, SATTCS3_BIT,
									TATTCS0_BIT, TATTCS1_BIT, TATTCS2_BIT, TATTCS3_BIT };

#pragma DATA_SECTION(en_5v_port, ".infoD")
volatile uint8_t *const en_5v_port = &EN5V_PORT;
#pragma DATA_SECTION(en_5v_bit, ".infoD")
const uint8_t en_5v_bit = EN5V_BIT;


#pragma DATA_SECTION(en_12v_port, ".infoB") // Put in infoB b/c infoD is full....
volatile uint8_t *const en_12v_port = &EN12V_PORT;
#pragma DATA_SECTION(en_12v_bit, ".infoB")
const uint8_t en_12v_bit = EN12V_BIT;


#pragma DATA_SECTION(spiclk_port, ".infoD")
volatile uint8_t *const spiclk_port = &SPI_CLK_PORT;
#pragma DATA_SECTION(spiclk_bit,".infoD")
const uint8_t spiclk_bit = SPI_CLK_BIT;
#pragma DATA_SECTION(spidata_port, ".infoD")
volatile uint8_t *const spidata_port = &SPI_DATA_PORT;
#pragma DATA_SECTION(spidata_bit,".infoD")
const uint8_t spidata_bit = SPI_DATA_BIT;

// Default port inits.
// The difference between v3/v2 is:
// Port1's DIR  is 0xD0 for v3
// Port1's DIR  is 0xD8 for v2
// Port1's SEL  is 0x00 for v3
// Port1's SEL  is 0x08 for v2
// Port1's SEL2 is 0x00 for v3
// Port1's SEL2 is 0x08 for v2
// Port3's SEL  is 0x80 for v3
// Port3's SEL  is 0x00 for v2
// Port3's SEL2 is 0x80 for v3
// Port3's SEL2 is 0x00 for v2
// CAPD is 		CAPD0 + CAPD3 for v3
// CAPD is 		CAPD0 + CAPD2 for v2
// CACTL2 is	P2CA0 + P2CA2 + P2CA1 for v3 (In+ = CA0, In- = CA3)
// CACTL2 is	P2CA0 + P2CA2 for v2 (In+ = CA0, In- = CA2)


#pragma DATA_SECTION(port1_dir, ".infoD")
const uint8_t port1_dir = 0x10; //Changed from 0xD0
#pragma DATA_SECTION(port1_sel, ".infoD")
const uint8_t port1_sel = 0x00;
#pragma DATA_SECTION(port1_sel2, ".infoD")
const uint8_t port1_sel2 = 0x00;

#pragma DATA_SECTION(port3_sel, ".infoD")
const uint8_t port3_sel = 0x00; //needs to be 0x00 for the GPIO for 3.7, 3.7 use to be comparator
#pragma DATA_SECTION(port3_sel2, ".infoD")
const uint8_t port3_sel2 = 0x00; //0b00000000 also needs to be 0, or it will never turn off 12v

#pragma DATA_SECTION(cap_disable, ".infoD")
const uint8_t cap_disable = CAPD0 + CAPD3;
#pragma DATA_SECTION(cap_ctl2, ".infoD")
const uint8_t cap_ctl2 = P2CA0 + P2CA2 + P2CA1;

#pragma DATA_SECTION(analog_enable, ".infoD")
const uint8_t analog_enable = 0xC0; // 0xC0 Need to set bit 6 and 7 of ADC10AE for A6 and A7 (5v and 12v_curr) 0b11000000
#pragma DATA_SECTION(analog_enable_fault, "infoD")
const uint8_t analog_enable_fault = 0x40; //Do not set ADC bit for Pin 1.7 for 12V fault detection
