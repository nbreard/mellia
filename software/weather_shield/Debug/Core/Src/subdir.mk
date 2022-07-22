################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/CayenneLpp.c \
../Core/Src/flash.c \
../Core/Src/i2c_if.c \
../Core/Src/lora_app.c \
../Core/Src/main.c \
../Core/Src/ringbuffer.c \
../Core/Src/rtc_if.c \
../Core/Src/stm32l4xx_hal_msp.c \
../Core/Src/stm32l4xx_it.c \
../Core/Src/sys_sensors.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l4xx.c \
../Core/Src/uart_if.c 

OBJS += \
./Core/Src/CayenneLpp.o \
./Core/Src/flash.o \
./Core/Src/i2c_if.o \
./Core/Src/lora_app.o \
./Core/Src/main.o \
./Core/Src/ringbuffer.o \
./Core/Src/rtc_if.o \
./Core/Src/stm32l4xx_hal_msp.o \
./Core/Src/stm32l4xx_it.o \
./Core/Src/sys_sensors.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l4xx.o \
./Core/Src/uart_if.o 

C_DEPS += \
./Core/Src/CayenneLpp.d \
./Core/Src/flash.d \
./Core/Src/i2c_if.d \
./Core/Src/lora_app.d \
./Core/Src/main.d \
./Core/Src/ringbuffer.d \
./Core/Src/rtc_if.d \
./Core/Src/stm32l4xx_hal_msp.d \
./Core/Src/stm32l4xx_it.d \
./Core/Src/sys_sensors.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l4xx.d \
./Core/Src/uart_if.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -D_GNU_SOURCE -D__USE_XOPEN -D_XOPEN_SOURCE -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Components/BME680_driver" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Sensors/Inc" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Components/BME680_driver/Self test" -O0 -ffunction-sections -fdata-sections -mslow-flash-data -fno-strict-aliasing -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

