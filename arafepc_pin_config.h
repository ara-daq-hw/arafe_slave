/*
 * arafepc_pin_config.h
 *
 * These define the ACTUAL pin configuration of the slave control board being used.
 *
 *  Created on: Mar 23, 2015
 *      Author: barawn
 */

#ifndef ARAFEPC_PIN_CONFIG_H_
#define ARAFEPC_PIN_CONFIG_H_

#include <stdint.h>

extern volatile uint8_t *const enable_port_arr[4];
extern const uint8_t enable_bit_arr[4];
extern volatile uint8_t *const att_port_arr[8];
extern const uint8_t att_bit_arr[8];
extern volatile uint8_t *const en_5v_port;
extern const uint8_t en_5v_bit;
extern volatile uint8_t *const spiclk_port;
extern const uint8_t spiclk_bit;
extern volatile uint8_t *const spidata_port;
extern const uint8_t spidata_bit;

extern const uint8_t port1_dir;
extern const uint8_t port1_sel;
extern const uint8_t port1_sel2;
extern const uint8_t port3_sel;
extern const uint8_t port3_sel2;
extern const uint8_t cap_disable;
extern const uint8_t cap_ctl2;

#endif /* ARAFEPC_PIN_CONFIG_H_ */
