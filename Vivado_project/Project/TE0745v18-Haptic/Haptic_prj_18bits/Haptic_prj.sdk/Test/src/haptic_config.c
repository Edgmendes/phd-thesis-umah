/*
 * haptic_config.c
 *
 *  Created on: 4 Jul 2023
 *      Author: eduar
 */

#include "haptic_config.h"

#include <stdio.h>
#include <stdlib.h>
#include "xil_io.h"

#include "haptic_hw.h"
#include "array.h"
#include "ScuTimer.h"
/*
 * Initialize Peripherals
 */
u8 init_peripherals(void)
{
	u8 Status = XST_SUCCESS;

	/*
	 * Setup the Timer Interrupt
	 */
	Status = ScuTimerIntr(&IntcInstance, &TimerInstance,
				TIMER_DEVICE_ID, TIMER_IRPT_INTR);

	if (Status != XST_SUCCESS) {
		xil_printf("SCU Private Timer Setup Failed\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*
 * Enable/Refresh calculation of Haptic System throught the enablement of the FocalPointgen IP Core
 */
void enable_fp_ip(void){

	u32 enable=1;

	 Xil_Out32(SC_IP_enable,enable);

}

/*
 * Disable Haptic
 */
void disable_fp_ip(void){

	u32 enable= 0x0;

	 Xil_Out32(SC_IP_enable,enable);

}

/*
 * Default configurations
 */
void config_main_haptic_parameters(void){

	xil_printf("Reseting..\n");

	disable_fp_ip();

	//configure temperature 23ºC
	Xil_Out32(HAP_IP_vel_val,343);
	Xil_Out32(HAP_IP_vel_set,1);
	Xil_Out32(HAP_IP_vel_set,0);

	//Configure DC 0% (safety reasons)
	Xil_Out32(HAP_IP_dc_val,0);
	Xil_Out32(HAP_IP_dc_set,1);
	Xil_Out32(HAP_IP_dc_set,0);

	//Configure the FP position
	Xil_Out32(SC_IP_dst_x,(int32_t)(0.085*VECTOR_SHIFT));
	Xil_Out32(SC_IP_dst_y,(int32_t)(0.085*VECTOR_SHIFT));
	Xil_Out32(SC_IP_dst_z,(int32_t)(0.2*VECTOR_SHIFT));

	//Set Carrier Frequency
	Xil_Out32(HAP_IP_freq_val,CARRIER_FREQ);
	Xil_Out32(HAP_IP_freq_set,1);
	Xil_Out32(HAP_IP_freq_set,0);

	enable_fp_ip();

	XScuTimer_Stop(&TimerInstance);

}

void set_sonars_origin(void){

    int *mem = (int*)SC_BASE_ADDR;

    for( int i = 0; i < NSONARS; i++ ){
    	for(int j = NCOORDS-1; j >= 0; j--){
//    		printf(" %f",sonars_origin[i][j]);
    		*mem = sonars_origin[i][j]*VECTOR_SHIFT;
    		mem++;
    	}
    }

    disable_fp_ip();
    Xil_Out32(SC_IP_set_src_pos,1);
    enable_fp_ip();
}

void set_coords_haptic(float *vector_dest){

    Xil_Out32(SC_IP_dst_x,(*vector_dest)*VECTOR_SHIFT);
    vector_dest++;
    Xil_Out32(SC_IP_dst_y,(*vector_dest)*VECTOR_SHIFT);
    vector_dest++;
    Xil_Out32(SC_IP_dst_z,(*vector_dest)*VECTOR_SHIFT);
}

void set_duty_cycle_haptic(float dc_fraction){

	unsigned int DC_VAL = 0;

	DC_VAL = dc_fraction*WAVE_PHASE_WITH;

//	printf("\n\t %llu\n", DC_VAL);

	Xil_Out32(HAP_IP_dc_val,DC_VAL);
	Xil_Out32(HAP_IP_dc_set,1);
	Xil_Out32(HAP_IP_dc_set,0);
}

void set_speed_sound_haptic(short int speed_sound){

	disable_fp_ip();

	Xil_Out32(HAP_IP_vel_val,speed_sound);
	Xil_Out32(HAP_IP_vel_set,1);
	Xil_Out32(HAP_IP_vel_set,0);

	enable_fp_ip();
}

void set_frequency_haptic(int frequency){

	disable_fp_ip();

	Xil_Out32(HAP_IP_freq_val,frequency);
	Xil_Out32(HAP_IP_freq_set,1);
	Xil_Out32(HAP_IP_freq_set,0);

	enable_fp_ip();
}
