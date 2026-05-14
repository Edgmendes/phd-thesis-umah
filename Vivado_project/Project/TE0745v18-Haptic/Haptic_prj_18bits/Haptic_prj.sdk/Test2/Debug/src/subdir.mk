################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/Post_Mod.c \
../src/ST_M.c \
../src/ScuTimer.c \
../src/haptic_config.c \
../src/helloworld.c \
../src/platform.c 

OBJS += \
./src/Post_Mod.o \
./src/ST_M.o \
./src/ScuTimer.o \
./src/haptic_config.o \
./src/helloworld.o \
./src/platform.o 

C_DEPS += \
./src/Post_Mod.d \
./src/ST_M.d \
./src/ScuTimer.d \
./src/haptic_config.d \
./src/helloworld.d \
./src/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../Test2_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


