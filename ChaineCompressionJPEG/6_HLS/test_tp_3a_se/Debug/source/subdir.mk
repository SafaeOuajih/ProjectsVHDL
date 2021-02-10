################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/net/e/souajih/Documents/blegal/EN325/6_HLS/Q1/my_module.cpp 

OBJS += \
./source/my_module.o 

CPP_DEPS += \
./source/my_module.d 


# Each subdirectory must supply rules for building sources it contributes
source/my_module.o: /net/e/souajih/Documents/blegal/EN325/6_HLS/Q1/my_module.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/opt/xilinx/vivado/2018.2/Vivado/2018.2/lnx64/tools/auto_cc/include -I/opt/xilinx/vivado/2018.2/Vivado/2018.2/lnx64/tools/systemc/include -I/opt/xilinx/vivado/2018.2/Vivado/2018.2/include/etc -I/opt/xilinx/vivado/2018.2/Vivado/2018.2/include -I/net/e/souajih/Documents/blegal/EN325/6_HLS -I/opt/xilinx/vivado/2018.2/Vivado/2018.2/include/ap_sysc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


