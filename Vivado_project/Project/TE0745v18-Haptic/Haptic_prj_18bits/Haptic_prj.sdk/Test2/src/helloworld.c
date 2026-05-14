/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sleep.h>

#include "xuartps_hw.h"
#include "xuartps.h"
#include "platform.h"

#include "haptic_config.h"
#include "ST_M.h"

#include "Post_Mod.h"

#define BUFFER_SIZE 100

void set_sonars_destination(u8 receive_uart);
void receive_dest_vector_uart(float **vector_dest);
void set_dc(void);
void set_temperature(void);
void set_frequency(void);

void amplitude_modulation(void);

void spatialtemporal_modulation(void);
void spatialtemporal_circular_modulation(void);
void spatialtemporal_circular_STM_modulation(void);
void spatialtemporal_circular_LM_modulation(void);
void spatialtemporal_linear_modulation(void);
void spatialtemporal_linear_STM_modulation(void);
void spatialtemporal_linear_LM_modulation(void);

void set_pulse(void);

float sonar_vector_dest[3];

int main()
{
	char c = 0;
	char buffer[BUFFER_SIZE];

	init_platform();

	if(init_peripherals() != XST_SUCCESS)
	{
		xil_printf("\t Error configuring Timers\n");
	}else{
		xil_printf("\t Timers Configured!\n");
	}

    xil_printf("\t Ultrasonic Mid-Air Haptic\n");

	config_main_haptic_parameters();

	//Set initial positions
	set_sonars_origin();

	//Disable Post Modulatior
	disable_post_mod_ip();

 /*
 * Receive Inputs from UART
 */

    while(c  != '0')
    {
        xil_printf("\n\t------------------MENU-----------------------\n"
        			"\t 0 - RESET Haptic							 \n"
        			"\t 1 - Set FP Position							 \n"
        			"\t 2 - Set Transducer's Positions				 \n"
					"\t 3 - Set Duty Cycle 							 \n"
        			"\t 4 - Set Air Temperature 					 \n"
        			"\t 5 - Set Carrier Frequency 					 \n"
        			"\t 6 - --			 				 	 \n"
        			"\t 7 - Statial-temporal Circular Modulation 			 \n"
					"\t 8 - Statial-temporal Circular Modulation (STM)		 \n"
					"\t 9 - Statial-temporal Circular Modulation (LM)		 \n"
					"\t a - Statial-temporal Linear Modulation 			 		 \n"
					"\t b - Statial-temporal Linear Modulation (STM) 			 \n"
					"\t c - Statial-temporal Linear Modulation (LM) 			 \n"
					"\t d - Enable Post Modulation			 			 		 \n"
					"\t e - Disable Post Modulation 			 				\n"
					"\t f - Set Pulse Modulation 								\n"
        			"\n"
        			"\t 0 - Exit\n\n");

		gets(buffer);
		sscanf(buffer, "%c", &c);

    	switch(c)
    	{
			case '0':
				config_main_haptic_parameters();
			break;
    		case '1':
    			set_sonars_destination(1);
			break;
    		case '2':
    			set_sonars_origin();
			break;
    		case '3':
    			set_dc();
			break;
    		case '4':
    			set_temperature();
			break;
    		case '5':
    			set_frequency();
			break;
    		case '6':

			break;
    		case '7':
    			spatialtemporal_circular_modulation();
			break;
			case '8':
    			spatialtemporal_circular_STM_modulation();
			break;
			case '9':
    			spatialtemporal_circular_LM_modulation();
			break;
			case 'a':
    			spatialtemporal_linear_modulation();
			break;
			case 'b':
    			spatialtemporal_linear_STM_modulation();
			break;
			case 'c':
    			spatialtemporal_linear_LM_modulation();
			break;
			case 'd':
    			enable_post_mod_ip();
			break;
			case 'e':
    			disable_post_mod_ip();
			break;
			case 'f':
				set_pulse();
			break;
    		default:
    			set_sonars_destination(0);
			break;
    	}
    	c = 0;	//clean command to enter default case
    }

/*
 * Cleanup Platform
 */
    xil_printf("\n\nExiting...\r\n");

    cleanup_platform();
    return 0;
}

void set_sonars_destination(u8 receive_uart)
{
	float *vector_dest;

	vector_dest = &sonar_vector_dest[0];

/*
 * Get Destination Coordinates Vector
 */
	if(receive_uart){
		receive_dest_vector_uart(&vector_dest);
	}

	disable_fp_ip();
	set_coords_haptic(vector_dest);
	enable_fp_ip();

}

/*
 * Receive Destination Vector from UART
 */
void receive_dest_vector_uart(float **vector_dest)
{
	float val = 0.0;
	char buffer[BUFFER_SIZE];
	char c = 'X';
	u8 l = 0;

	/*
	 * Get Vectors from UART
	 */
		xil_printf("\n\nSonars Destination:");

		for(l = 0; l < 3; l++)
		{
			xil_printf("\n\t%C: ", c+l);

		/*
		 * Read from UART
		 */
			gets(buffer);

		/*
		 * Convert String to Float
		 */
			sscanf(buffer, "%f", &val);

		/*
		 * Echo Value
		 */
			//printf("%.03lf\n", val);
			//xil_printf("Int val: %ld", (int32_t)(val*VECTOR_SHIFT));

		/*
		 * Get Coordinate Value
		 */
			(*vector_dest)[l] = val;
    }
}

void set_dc(void){

	int dc = 0;
	float fraction = 0.0f;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Duty Cycle \n");

	/*
	 * Read from UART
	 */
	gets(buffer);

	/*
	 * Convert String to Float
	 */
	sscanf(buffer, "%d", &dc);

	/*
	 * Echo Value
	 */
		//printf("%d %%\n", dc);

	fraction = (float)dc/100.0f;

	set_duty_cycle_haptic(fraction);

}

void set_temperature(void){

	short int temprature = 0;
	short int sound_velocity = 0;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Haptic Temperature \n");

	/*
	 * Read from UART
	 */
	gets(buffer);

	/*
	 * Convert String to Float
	 */
	sscanf(buffer, "%hd", &temprature);

	/*
	 * Echo Value
	 */
	printf("%d\n", temprature);

	sound_velocity = 331.4f+0.6f*temprature;

//		printf("%hd\n", sound_velocity);

	set_speed_sound_haptic(sound_velocity);
}

void set_frequency(void){

	int frequency = 0;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Carrier Frequency \n");

	/*
	 * Read from UART
	 */
	gets(buffer);

	/*
	 * Convert String to Float
	 */
	sscanf(buffer, "%d", &frequency);

	/*
	 * Echo Value
	 */
	//printf("%u \n", frequency);

	set_frequency_haptic(frequency);
}

void set_pulse(void){

	float pulse_s = 0;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Pulse Period (Seconds)\n");

	/*
	 * Read from UART
	 */
	gets(buffer);

	/*
	 * Convert String to Float
	 */
	sscanf(buffer, "%f", &pulse_s);

	/*
	 * Echo Value
	 */
	printf("%f \n", pulse_s);

	set_post_mod_ip(pulse_s);
}


void spatialtemporal_circular_modulation(void){
	float amplitude = 0.f;
	short int frequency = 0;
	short int sample_rate = 0;
	char buffer[BUFFER_SIZE];
	int modulation_type = 0;

	xil_printf("\t Set Modulation Amplitude \n");

	gets(buffer);

	sscanf(buffer, "%f", &amplitude);

	xil_printf("\t Set Modulation Frequency \n");

	gets(buffer);

	sscanf(buffer, "%hd", &frequency);

	xil_printf("\t Set Pattern Sample Rate \n");

	gets(buffer);

	sscanf(buffer, "%hd", &sample_rate);

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);

}

void spatialtemporal_circular_STM_modulation(void){
	float lamda = 0.f;
	float amplitude = 0.f;
	short int frequency = 0;
	short int sample_rate = 15;
	int modulation_type = 0;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Wavelength \n");

	gets(buffer);

	sscanf(buffer, "%f", &lamda);

	xil_printf("\t Perimeter = 18*Wavelength\n");
	xil_printf("\t Focal Speed = 8 m/s\n");
	xil_printf("\t Pattern Sample Rate = 15\n");

	amplitude = (18*lamda)/(2*M_PI);		//radii = Perimeter/2pi
	frequency = (8)/(18*lamda);				//fmod = Speed/Perimeter

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);

}

void spatialtemporal_circular_LM_modulation(void){
	float lamda = 0.f;
	float amplitude = 0.f;
	short int frequency = 200;
	short int sample_rate = 15;
	int modulation_type = 0;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Wavelength \n");

	gets(buffer);

	sscanf(buffer, "%f", &lamda);

	xil_printf("\t Perimeter = 4*Wavelength\n");
	xil_printf("\t Modulation Frequency = 200Hz\n");
	xil_printf("\t Pattern Sample Rate = 15\n");

	amplitude = (4*lamda)/(2*M_PI);		//radii = Perimeter/2pi

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);

}

void spatialtemporal_linear_modulation(void){
	float amplitude = 0.f;
	short int frequency = 0;
	short int sample_rate = 0;
	char buffer[BUFFER_SIZE];
	int modulation_type = 1;

	xil_printf("\t Set Modulation Amplitude \n");

	gets(buffer);

	sscanf(buffer, "%f", &amplitude);

	xil_printf("\t Set Modulation Frequency \n");

	gets(buffer);

	sscanf(buffer, "%hd", &frequency);

	xil_printf("\t Set Pattern Sample Rate \n");

	gets(buffer);

	sscanf(buffer, "%hd", &sample_rate);

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);

}

void spatialtemporal_linear_STM_modulation(void){
	float lamda = 0.f;
	float amplitude = 0.f;
	short int frequency = 0;
	short int sample_rate = 15;
	int modulation_type = 1;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Wavelength \n");

	gets(buffer);

	sscanf(buffer, "%f", &lamda);

	xil_printf("\t Perimeter = 10*Wavelength\n");
	xil_printf("\t Amplitude = 5*Wavelength\n");
	xil_printf("\t Focal Speed = 6 m/s\n");
	xil_printf("\t Pattern Sample Rate = 15\n");

	amplitude = (10*lamda)/(2*M_PI);		//radii = Perimeter/2pi
	frequency = (6)/(10*lamda);				//fmod = Speed/Perimeter

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);
}

void spatialtemporal_linear_LM_modulation(void){
	float lamda = 0.f;
	float amplitude = 0.f;
	short int frequency = 150;
	short int sample_rate = 10;
	int modulation_type = 1;
	char buffer[BUFFER_SIZE];

	xil_printf("\t Set Wavelength \n");

	gets(buffer);

	sscanf(buffer, "%f", &lamda);

	xil_printf("\t Perimeter = 2*Wavelength\n");
	xil_printf("\t Amplitude = Wavelength\n");
	xil_printf("\t Modulation Frequency = 150Hz\n");
	xil_printf("\t Pattern Sample Rate = 10\n");

	amplitude = (2*lamda)/(2*M_PI);		//radii = Perimeter/2pi

	spatialtemporal_mod_haptic(amplitude, frequency, sample_rate, modulation_type);


}
