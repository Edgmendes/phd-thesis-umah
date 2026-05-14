/*
 * ST_M.c
 *
 *  Created on: 4 Jul 2023
 *      Author: eduar
 */

#include "stdlib.h"
#include "xil_io.h"

#include "haptic_hw.h"
#include "ST_M.h"
#include "ScuTimer.h"
#include "xparameters.h"
#include "math.h"

void spatialtemporal_mod_haptic(float amplitude, short int frequency, short int sample_rate, int mod_type){
	unsigned int * positions_hw = NULL;

	if(mod_type == 0){
		positions_hw = cal_circular_pos(amplitude, sample_rate);
	}else if(mod_type == 1){
		positions_hw = cal_linear_pos(amplitude, sample_rate);
	}

	enable_spatialtemporal_mod(frequency, sample_rate, positions_hw, mod_type);

}

unsigned int * cal_circular_pos(float amplitude, short int sample_rate){
	unsigned int * positions_hw = NULL;
	float angle_rad = 0.f;
	unsigned int xx_pf_hw, yy_pf_hw;
	unsigned int amplitude_hw;

	positions_hw = (unsigned int*)malloc(2*sample_rate*sizeof(int));

	if(sample_rate!=0){
		angle_rad = (2*M_PI)/sample_rate;
	}

	amplitude_hw = amplitude * VECTOR_SHIFT;
	xx_pf_hw = Xil_In32(SC_IP_dst_x);
	yy_pf_hw = Xil_In32(SC_IP_dst_y);

	for(int i=0;i<sample_rate;i++){
		positions_hw[(i*2)] = xx_pf_hw + amplitude_hw*cosf(i*angle_rad);
		positions_hw[(i*2)+1] = yy_pf_hw + amplitude_hw*sinf(i*angle_rad);
//		xil_printf("x_%d - %u \n\r",i,positions_hw[(i*2)]);
//		xil_printf("y_%d - %u \n\r",i,positions_hw[(i*2)+1]);
	}

	return positions_hw;
}

unsigned int * cal_linear_pos(float amplitude, short int sample_rate){
	unsigned int * positions_hw = NULL;
	float angle_rad = 0.f;
	unsigned int xx_pf_hw;
	unsigned int amplitude_hw;

	positions_hw = (unsigned int*)malloc(sample_rate*sizeof(int));

	if(sample_rate!=0){
		angle_rad = (2*M_PI)/sample_rate;
	}

	amplitude_hw = amplitude * VECTOR_SHIFT;
	xx_pf_hw = Xil_In32(SC_IP_dst_x);

	for(int i=0;i<sample_rate;i++){
		positions_hw[i] = xx_pf_hw + amplitude_hw*cosf(i*angle_rad);
//		xil_printf("x_%d - %u \n\r",i,positions_hw[i]);
	}

	return positions_hw;
}

void enable_spatialtemporal_mod(short int frequency, short int sample_rate, unsigned int* ptr_pos, int modulation_type){
	unsigned int TIMER_RELOAD_VAL;
	float pulse_period = 0.f;

	pulse_period = (1.0/(float)(frequency*sample_rate));
	TIMER_RELOAD_VAL = pulse_period * (XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ/2.0);

	set_sample_positions(ptr_pos,sample_rate,1,modulation_type);

	XScuTimer_LoadTimer(&TimerInstance, TIMER_RELOAD_VAL);
	XScuTimer_Start(&TimerInstance);
}
