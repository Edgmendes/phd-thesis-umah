/*
 * Post_Mod.h
 *
 *  Created on: 8 Nov 2023
 *      Author: eduar
 */

#ifndef SRC_POST_MOD_H_
#define SRC_POST_MOD_H_

#include "haptic_hw.h"

#define POST_MOD_IP_enable				AXI_INTERFACE+11*0x4
#define POST_MOD_IP_cycles_on			AXI_INTERFACE+12*0x4

void disable_post_mod_ip(void);
void enable_post_mod_ip(void);
void set_post_mod_ip(float period_on_s);

#endif /* SRC_POST_MOD_H_ */
