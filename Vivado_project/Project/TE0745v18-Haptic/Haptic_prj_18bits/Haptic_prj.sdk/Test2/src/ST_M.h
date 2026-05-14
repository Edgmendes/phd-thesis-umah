/*
 * ST_M.h
 *
 *  Created on: 4 Jul 2023
 *      Author: eduar
 */

#ifndef SRC_ST_M_H_
#define SRC_ST_M_H_

void spatialtemporal_mod_haptic(float amplitude, short int frequency, short int sample_rate, int mod_type);
unsigned int * cal_circular_pos(float amplitude, short int sample_rate);
unsigned int * cal_linear_pos(float amplitude, short int sample_rate);
void enable_spatialtemporal_mod(short int frequency, short int sample_rate, unsigned int* ptr_pos, int modulation_type);

#endif /* SRC_ST_M_H_ */
