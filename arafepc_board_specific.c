/*
 * arafepc_board_specific.c
 *
 *  Created on: Aug 31, 2016
 *      Author: barawn
 */
#include <stdint.h>
#include <msp430.h>


//channel 0-3 enable ports and bits
#define CH0_EN_PORT		P3OUT
#define CH0_EN_BIT		BIT6

#define CH1_EN_PORT 	P3OUT
#define CH1_EN_BIT		BIT4

#define CH2_EN_PORT 	P3OUT
#define CH2_EN_BIT		BIT3

#define CH3_EN_PORT 	P2OUT
#define CH3_EN_BIT		BIT1


//channel 0-3 trigger ports and bits
#define TATTCS0_PORT	P2OUT
#define TATTCS0_BIT		BIT5

#define TATTCS1_PORT	P2OUT
#define TATTCS1_BIT		BIT4

#define TATTCS2_PORT	P2OUT
#define TATTCS2_BIT		BIT2

#define TATTCS3_PORT	P3OUT
#define TATTCS3_BIT		BIT0


//channel 0-3 signal ports and bits
#define SATTCS0_PORT	P3OUT
#define SATTCS0_BIT		BIT5

#define SATTCS1_PORT	P2OUT
#define SATTCS1_BIT		BIT3

#define SATTCS2_PORT	P3OUT
#define SATTCS2_BIT		BIT2

#define SATTCS3_PORT	P2OUT
#define SATTCS3_BIT		BIT0


//5v enable port and bit
#define EN5V_PORT		P3OUT
#define EN5V_BIT		BIT1


//12v enable port and bit
#define EN12V_PORT      P3OUT
#define EN12V_BIT       BIT7

// 8 bytes left over in infoD.
#pragma DATA_SECTION(att_port_arr, ".infoD")
volatile uint8_t *const att_port_arr[8] = {
  &SATTCS0_PORT, &SATTCS1_PORT, &SATTCS2_PORT, &SATTCS3_PORT,
  &TATTCS0_PORT, &TATTCS1_PORT, &TATTCS2_PORT, &TATTCS3_PORT
};
#pragma DATA_SECTION(att_bit_arr, ".infoD")
const uint8_t att_bit_arr[8] = 	{
  SATTCS0_BIT, SATTCS1_BIT, SATTCS2_BIT, SATTCS3_BIT,
  TATTCS0_BIT, TATTCS1_BIT, TATTCS2_BIT, TATTCS3_BIT
};
#pragma DATA_SECTION(pwr_port_arr, ".infoD")
volatile uint8_t *const pwr_port_arr[8] = {
  &CH0_EN_PORT, &CH1_EN_PORT, &CH2_EN_PORT, &CH3_EN_PORT,
  &EN5V_PORT, &EN12V_PORT, &EN5V_PORT, &EN12V_PORT
};
#pragma DATA_SECTION(pwr_bit_arr, ".infoD")
const uint8_t pwr_bit_arr[8] = {
  CH0_EN_BIT, CH1_EN_BIT, CH2_EN_BIT, CH3_EN_BIT,
  EN5V_BIT, EN12V_BIT, EN5V_BIT, EN12V_BIT
};
#pragma DATA_SECTION(sensor_channels, ".infoD")
const uint16_t sensor_channels[4] = {
		INCH_10 | ADC10DIV_3, // Temp
		INCH_6  | ADC10DIV_3, //5v_curr
		INCH_7  | ADC10DIV_3, // 12v_curr
		INCH_7  | ADC10DIV_3  // also 12v curr
};


