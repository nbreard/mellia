################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/BME680_driver/Self\ test/bme680_selftest.c 

OBJS += \
./Drivers/BSP/Components/BME680_driver/Self\ test/bme680_selftest.o 

C_DEPS += \
./Drivers/BSP/Components/BME680_driver/Self\ test/bme680_selftest.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/BME680_driver/Self\ test/bme680_selftest.o: ../Drivers/BSP/Components/BME680_driver/Self\ test/bme680_selftest.c Drivers/BSP/Components/BME680_driver/Self\ test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -D_GNU_SOURCE -D__USE_XOPEN -D_XOPEN_SOURCE -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Components/BME680_driver" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Sensors/Inc" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP" -I"/home/nicolas/STM32CubeIDE/workspace_1.7.0/weather_shield/Drivers/BSP/Components/BME680_driver/Self test" -O0 -ffunction-sections -fdata-sections -mslow-flash-data -fno-strict-aliasing -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Components/BME680_driver/Self test/bme680_selftest.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

