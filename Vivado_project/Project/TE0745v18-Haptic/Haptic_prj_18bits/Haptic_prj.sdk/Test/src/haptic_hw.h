/*
 * haptic_hw.h
 *
 *  Created on: 4 Jul 2023
 *      Author: eduar
 */

#ifndef HAPTIC_HW_H_
#define HAPTIC_HW_H_

#include "xparameters.h"

#define AXI_INTERFACE							XPAR_AXI_INTERFACE_0_S00_AXI_BASEADDR
#define SC_BASE_ADDR 							XPAR_SC_1_BASEADDR

//SC Inputs
#define SC_IP_enable 			AXI_INTERFACE
#define SC_IP_dst_x		 		AXI_INTERFACE+1*0x4
#define SC_IP_dst_y		 		AXI_INTERFACE+2*0x4
#define SC_IP_dst_z		 		AXI_INTERFACE+3*0x4
#define SC_IP_set_src_pos 		AXI_INTERFACE+4*0x4

//Haptic IP Core
#define HAP_IP_dc_set			AXI_INTERFACE+5*0x4
#define HAP_IP_dc_val			AXI_INTERFACE+6*0x4
#define HAP_IP_vel_set			AXI_INTERFACE+8*0x4
#define HAP_IP_vel_val			AXI_INTERFACE+10*0x4
#define HAP_IP_freq_set			AXI_INTERFACE+7*0x4
#define HAP_IP_freq_val			AXI_INTERFACE+9*0x4

//SC Debug
#define SC_IP_sonar_id_dbg 		0
#define SC_IP_scr_dbg_x 		0
#define SC_IP_scr_dbg_y 		0
#define SC_IP_scr_dbg_z 		0
#define SC_IP_dst_dbg_x 		0
#define SC_IP_dst_dbg_y 		0
#define SC_IP_dst_dbg_z 		0

//Haptic Debug
#define HAP_IP_sonarval_dbg		0
#define HAP_IP_sonar_id_dbg		0

#define VECTOR_SHIFT 262144	//2^18
#define WAVE_PHASE_WITH 4294967295.0

#define CARRIER_FREQ 40000


#endif /* HAPTIC_HW_H_ */
