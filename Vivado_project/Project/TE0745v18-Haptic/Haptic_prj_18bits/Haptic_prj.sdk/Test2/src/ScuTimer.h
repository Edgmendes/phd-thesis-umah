/*
 * ScuTimer.h
 *
 *  Created on: 13/06/2017
 *      Author: HP
 */

#ifndef SRC_SCUTIMER_H_
#define SRC_SCUTIMER_H_

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xscutimer.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are only defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID

#define TIMER_DEVICE_ID		XPAR_XSCUTIMER_0_DEVICE_ID
#define TIMER_IRPT_INTR		XPAR_SCUTIMER_INTR

#define TIMER2_DEVICE_ID		XPAR_XSCUTIMER_1_DEVICE_ID
#define TIMER2_IRPT_INTR		XPAR_SCUTIMER_INTR

#define SM_MOD_FREQ			100
#define TIMER_TIME_S		(1.0/(SM_MOD_FREQ*2))	//Time to trigger interrupt
#define TIMER_LOAD_VALUE	(TIMER_TIME_S*XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ/2.0)
#define TIMER_LOAD_VALUE_1s	XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ/2.0

//TimerLoad=Time*Fclk

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int ScuTimerIntr(XScuGic *IntcInstancePtr, XScuTimer *TimerInstancePtr,
			u16 TimerDeviceId, u16 TimerIntrId);

void TimerIntrHandler(void *CallBackRef);

int TimerSetupIntrSystem(XScuGic *IntcInstancePtr,
				XScuTimer *TimerInstancePtr, u16 TimerIntrId);

void TimerDisableIntrSystem(XScuGic *IntcInstancePtr, u16 TimerIntrId);

/************************** Variable Definitions *****************************/

XScuTimer TimerInstance;	/* Cortex A9 Scu Private Timer Instance */
XScuGic IntcInstance;		/* Interrupt Controller Instance */


/*
 * The following variables are shared between non-interrupt processing and
 * interrupt processing such that they must be global.
 */
volatile int TimerExpired;


void set_sample_positions(unsigned int * positions_ptr, int sample_rate, int update_flag, int modulation_type);


#endif /* SRC_SCUTIMER_H_ */
