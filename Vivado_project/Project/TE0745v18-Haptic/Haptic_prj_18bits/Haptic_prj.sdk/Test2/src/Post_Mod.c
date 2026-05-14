/*
 * Post_Mod.c
 *
 *  Created on: 8 Nov 2023
 *      Author: eduar
 */

#include "Post_Mod.h"
#include "xil_io.h"
#include "xparameters.h"
#include <stdio.h>

#define FPGA_CLK 50000000

void enable_post_mod_ip(){

	Xil_Out32(POST_MOD_IP_enable, 1);

}

void disable_post_mod_ip(){

	Xil_Out32(POST_MOD_IP_enable, 0);

}

void set_post_mod_ip(float period_on_s){

	int n_cycles = 0;

	n_cycles = period_on_s * FPGA_CLK;

	printf("n_cycles - %x \n", n_cycles);

	Xil_Out32(POST_MOD_IP_cycles_on, n_cycles);

}
