/*
 * haptic_config.h
 *
 *  Created on: 4 Jul 2023
 *      Author: eduar
 */

#ifndef SRC_HAPTIC_CONFIG_H_
#define SRC_HAPTIC_CONFIG_H_

#include "xil_types.h"

u8 init_peripherals(void);
void enable_fp_ip(void);
void disable_fp_ip(void);
void config_main_haptic_parameters(void);
void set_sonars_origin(void);
void set_coords_haptic(float *vector_dest);
void set_duty_cycle_haptic(float dc_fraction);
void set_speed_sound_haptic(short int speed_sound);
void set_frequency_haptic(int frequency);

#endif /* SRC_HAPTIC_CONFIG_H_ */
