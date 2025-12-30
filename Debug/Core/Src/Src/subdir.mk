################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Src/main.c \
../Core/Src/Src/stm32f4xx_hal_msp.c \
../Core/Src/Src/stm32f4xx_it.c \
../Core/Src/Src/syscalls.c \
../Core/Src/Src/sysmem.c \
../Core/Src/Src/system_stm32f4xx.c 

OBJS += \
./Core/Src/Src/main.o \
./Core/Src/Src/stm32f4xx_hal_msp.o \
./Core/Src/Src/stm32f4xx_it.o \
./Core/Src/Src/syscalls.o \
./Core/Src/Src/sysmem.o \
./Core/Src/Src/system_stm32f4xx.o 

C_DEPS += \
./Core/Src/Src/main.d \
./Core/Src/Src/stm32f4xx_hal_msp.d \
./Core/Src/Src/stm32f4xx_it.d \
./Core/Src/Src/syscalls.d \
./Core/Src/Src/sysmem.d \
./Core/Src/Src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Src/%.o Core/Src/Src/%.su Core/Src/Src/%.cyclo: ../Core/Src/Src/%.c Core/Src/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Src

clean-Core-2f-Src-2f-Src:
	-$(RM) ./Core/Src/Src/main.cyclo ./Core/Src/Src/main.d ./Core/Src/Src/main.o ./Core/Src/Src/main.su ./Core/Src/Src/stm32f4xx_hal_msp.cyclo ./Core/Src/Src/stm32f4xx_hal_msp.d ./Core/Src/Src/stm32f4xx_hal_msp.o ./Core/Src/Src/stm32f4xx_hal_msp.su ./Core/Src/Src/stm32f4xx_it.cyclo ./Core/Src/Src/stm32f4xx_it.d ./Core/Src/Src/stm32f4xx_it.o ./Core/Src/Src/stm32f4xx_it.su ./Core/Src/Src/syscalls.cyclo ./Core/Src/Src/syscalls.d ./Core/Src/Src/syscalls.o ./Core/Src/Src/syscalls.su ./Core/Src/Src/sysmem.cyclo ./Core/Src/Src/sysmem.d ./Core/Src/Src/sysmem.o ./Core/Src/Src/sysmem.su ./Core/Src/Src/system_stm32f4xx.cyclo ./Core/Src/Src/system_stm32f4xx.d ./Core/Src/Src/system_stm32f4xx.o ./Core/Src/Src/system_stm32f4xx.su

.PHONY: clean-Core-2f-Src-2f-Src

