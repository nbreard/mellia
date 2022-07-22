/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file    sys_sensors.c
 * @author  MCD Application Team
 * @brief   Manages the sensors on the application
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
 * All rights reserved.</center></h2>
 *
 * This software component is licensed by ST under Ultimate Liberty license
 * SLA0044, the "License"; You may not use this file except in compliance with
 * the License. You may obtain a copy of the License at:
 *                             www.st.com/SLA0044
 *
 ******************************************************************************
 */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "stdint.h"
#include "stm32l4xx_hal.h"
#include "math.h"
#include "main.h"
//#include "sys_conf.h"
//#include "sys_app.h"
#include "sys_sensors.h"
//#include "utilities_conf.h"
#include "stdio.h"
#include "string.h"
#include <stdlib.h>
#define SENSOR_ENABLED              0
#define COEFF_A  0.000854942
#define COEFF_B  0.000257305
#define COEFF_C  0.000000165368

/* USER CODE BEGIN Includes */
#if defined (SENSOR_ENABLED) && (SENSOR_ENABLED == 1)
#if defined (X_NUCLEO_IKS01A2)
#warning "IKS drivers are today available for several families but not stm32WL"
#warning "up to the user adapt IKS low layer to map it on WL board driver"
#warning "this code would work only if user provide necessary IKS and BSP layers"
#include "iks01a2_env_sensors.h"
#elif defined (X_NUCLEO_IKS01A3)
#include "main.h"
#include "bme680.h"
#include "gas_sensor.h"
/*
## How to add IKS01A3 to CubeWL

 1. Download STM32CubeExpansion_MEMS1_V8.0.0
 2. Copy Drivers From `STM32CubeExpansion_MEMS1_V8.0.0\Drivers\BSP\IKS01A3` to CubeWL `Drivers\BSP\IKS01A3` and add to the IDE Project
 3. Copy `STM32CubeExpansion_MEMS1_V8.0.0\Drivers\BSP\IKS01A3\iks01a3_conf_template.h` into `Projects\NUCLEO-WL55JC\Applications\LoRaWAN\End_Node\LoRaWAN\Target\iks01a3_conf.h`.
 4. Copy files nucleo_l476rg_bus.c/nucleo_l476rg_bus.h  from `STM32L476RG-Nucleo\Applications\IKS01A3\ActiveTime\Inc and \Src` to `Projects\NUCLEO-WL55JC\Applications\LoRaWAN\End_Node\LoRaWAN\Target` and rename to `nucleo_wl55jc_bus.c` and `nucleo_wl55jc_bus.h` respectively
 5. Update `nucleo_wl55jc_bus.c`  include files  to
 ```bash
#include "nucleo_wl55jc_bus.h"
#include "stm32wlxx_nucleo_errno.h"
#include "stm32wlxx_hal.h"
```

6. Update definitions in `nucleo_wl55jc_bus.h`(to be commented since already defined elsewhere)

 ```bash
//#define USE_HAL_SPI_REGISTER_CALLBACKS 0
//#define USE_HAL_I2C_REGISTER_CALLBACKS 0
```

7. copy following components and add them (.c and .h) into IDE Project

../../../../../../Drivers/BSP/Components/lsm6dso
../../../../../../Drivers/BSP/Components/lis2dw12
../../../../../../Drivers/BSP/Components/lis2mdl
../../../../../../Drivers/BSP/Components/hts221
../../../../../../Drivers/BSP/Components/lps22hh
../../../../../../Drivers/BSP/Components/stts751
../../../../../../Drivers/BSP/Components/Common

8. Enable #define HAL_I2C_MODULE_ENABLED in stm32_hal_conf.h
9. Add stm32wlxx_hal_i2c.c and stm32wlxx_hal_i2c_ex.c in the IDE Project
10. Update hi2c->Instance in `nucleo_wl55jc_bus.c` to

```bash
  hi2c->Instance = I2C2;
```

11. Update msp function in `nucleo_wl55jc_bus.c`

```bash
static void I2C2_MspInit(I2C_HandleTypeDef *i2cHandle)
{
  GPIO_InitTypeDef GPIO_InitStruct;

  GPIO_InitStruct.Pin = GPIO_PIN_11 | GPIO_PIN_12;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF4_I2C2;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  __HAL_RCC_I2C2_CLK_ENABLE();
}

static void I2C2_MspDeInit(I2C_HandleTypeDef *i2cHandle)
{
  __HAL_RCC_I2C2_CLK_DISABLE();

  HAL_GPIO_DeInit(GPIOA, GPIO_PIN_11 | GPIO_PIN_12);

}
```
12. Replace I2C1xx by MX_I2C2xx and i2c1 by i2c2 in `nucleo_wl55jc_bus.c`
13. Replace I2C1xx by MX_I2C2xx in `nucleo_wl55jc_bus.h`
 */
#warning "IKS drivers are today available for several families but not stm32WL, follow steps defined in sys_sensors.c"
#include "iks01a3_env_sensors.h"
#else  /* not X_IKS01xx */
#error "user to include its sensor drivers"
#endif  /* X_NUCLEO_IKS01xx */
#elif !defined (SENSOR_ENABLED)
#error SENSOR_ENABLED not defined
#endif  /* SENSOR_ENABLED */
/* USER CODE END Includes */

/* External variables ---------------------------------------------------------*/
/* USER CODE BEGIN EV */

/* USER CODE END EV */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/

/* USER CODE BEGIN PD */
#define STSOP_LATTITUDE           ((float) 43.618622 )  /*!< default latitude position */
#define STSOP_LONGITUDE           ((float) 7.051415  )  /*!< default longitude position */
#define MAX_GPS_POS               ((int32_t) 8388607 )  /*!< 2^23 - 1 */
#define HUMIDITY_DEFAULT_VAL      50.0f                 /*!< default humidity */
#define TEMPERATURE_DEFAULT_VAL   18.0f                 /*!< default temperature */
#define PRESSURE_DEFAULT_VAL      1000.0f               /*!< default pressure */
/* USER CODE END PD */
extern uint8_t rcvbuff[64];
extern uint8_t command[64];
extern uint8_t rcvptr;
/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
#if defined (SENSOR_ENABLED) && (SENSOR_ENABLED == 1)
#if defined (X_NUCLEO_IKS01A2)
#warning "IKS drivers are today available for several families but not stm32WL"
#warning "up to the user adapt IKS low layer to map it on WL board driver"
#warning "this code would work only if user provide necessary IKS and BSP layers"
IKS01A2_ENV_SENSOR_Capabilities_t EnvCapabilities;
#elif defined (X_NUCLEO_IKS01A3)
IKS01A3_ENV_SENSOR_Capabilities_t EnvCapabilities;
#else  /* not X_IKS01Ax */
#error "user to include its sensor drivers"
#endif  /* X_NUCLEO_IKS01 */
#elif !defined (SENSOR_ENABLED)
#error SENSOR_ENABLED not defined
#endif  /* SENSOR_ENABLED */


extern  bme_gas_sensor;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Exported functions --------------------------------------------------------*/
int32_t  EnvSensors_Read(sensor_t *sensor_data)
{
	/* USER CODE BEGIN EnvSensors_Read */
	float HUMIDITY_Value = HUMIDITY_DEFAULT_VAL;
	float TEMPERATURE_Value = TEMPERATURE_DEFAULT_VAL;
	float PRESSURE_Value = PRESSURE_DEFAULT_VAL;

#if defined (SENSOR_ENABLED) && (SENSOR_ENABLED == 1)
#if (USE_IKS01A2_ENV_SENSOR_HTS221_0 == 1)
	IKS01A2_ENV_SENSOR_GetValue(HTS221_0, ENV_HUMIDITY, &HUMIDITY_Value);
	IKS01A2_ENV_SENSOR_GetValue(HTS221_0, ENV_TEMPERATURE, &TEMPERATURE_Value);
#endif /* USE_IKS01A2_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A2_ENV_SENSOR_LPS22HB_0 == 1)
	IKS01A2_ENV_SENSOR_GetValue(LPS22HB_0, ENV_PRESSURE, &PRESSURE_Value);
	IKS01A2_ENV_SENSOR_GetValue(LPS22HB_0, ENV_TEMPERATURE, &TEMPERATURE_Value);
#endif /* USE_IKS01A2_ENV_SENSOR_LPS22HB_0 */
#if (USE_IKS01A3_ENV_SENSOR_HTS221_0 == 1)
	IKS01A3_ENV_SENSOR_GetValue(IKS01A3_HTS221_0, ENV_HUMIDITY, &HUMIDITY_Value);
	IKS01A3_ENV_SENSOR_GetValue(IKS01A3_HTS221_0, ENV_TEMPERATURE, &TEMPERATURE_Value);
#endif /* USE_IKS01A3_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A3_ENV_SENSOR_LPS22HH_0 == 1)
	IKS01A3_ENV_SENSOR_GetValue(IKS01A3_LPS22HH_0, ENV_PRESSURE, &PRESSURE_Value);
	IKS01A3_ENV_SENSOR_GetValue(IKS01A3_LPS22HH_0, ENV_TEMPERATURE, &TEMPERATURE_Value);
#endif /* USE_IKS01A3_ENV_SENSOR_LPS22HH_0 */
#elif !defined (SENSOR_ENABLED)
#error SENSOR_ENABLED not defined
#endif  /* SENSOR_ENABLED */

	sensor_data->humidity    = HUMIDITY_Value;
	sensor_data->temperature = TEMPERATURE_Value;
	sensor_data->pressure    = PRESSURE_Value;

	sensor_data->latitude  = (int32_t)((STSOP_LATTITUDE  * MAX_GPS_POS) / 90);
	sensor_data->longitude = (int32_t)((STSOP_LONGITUDE  * MAX_GPS_POS) / 180);
	return 0;
	/* USER CODE END EnvSensors_Read */
}

HAL_StatusTypeDef  EnvSensors_Init(void)
{
	/* USER CODE BEGIN EnvSensors_Init */
#if defined (SENSOR_ENABLED) && (SENSOR_ENABLED == 1)
	/* Init */
#if (USE_IKS01A2_ENV_SENSOR_HTS221_0 == 1)
	IKS01A2_ENV_SENSOR_Init(HTS221_0, ENV_TEMPERATURE | ENV_HUMIDITY);
#endif /* USE_IKS01A2_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A2_ENV_SENSOR_LPS22HB_0 == 1)
	IKS01A2_ENV_SENSOR_Init(LPS22HB_0, ENV_TEMPERATURE | ENV_PRESSURE);
#endif /* USE_IKS01A2_ENV_SENSOR_LPS22HB_0 */
#if (USE_IKS01A3_ENV_SENSOR_HTS221_0 == 1)
	IKS01A3_ENV_SENSOR_Init(IKS01A3_HTS221_0, ENV_TEMPERATURE | ENV_HUMIDITY);
#endif /* USE_IKS01A3_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A3_ENV_SENSOR_LPS22HH_0 == 1)
	IKS01A3_ENV_SENSOR_Init(IKS01A3_LPS22HH_0, ENV_TEMPERATURE | ENV_PRESSURE);
#endif /* USE_IKS01A3_ENV_SENSOR_LPS22HH_0 */

	/* Enable */
#if (USE_IKS01A2_ENV_SENSOR_HTS221_0 == 1)
	IKS01A2_ENV_SENSOR_Enable(HTS221_0, ENV_HUMIDITY);
	IKS01A2_ENV_SENSOR_Enable(HTS221_0, ENV_TEMPERATURE);
#endif /* USE_IKS01A2_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A2_ENV_SENSOR_LPS22HB_0 == 1)
	IKS01A2_ENV_SENSOR_Enable(LPS22HB_0, ENV_PRESSURE);
	IKS01A2_ENV_SENSOR_Enable(LPS22HB_0, ENV_TEMPERATURE);
#endif /* USE_IKS01A2_ENV_SENSOR_LPS22HB_0 */
#if (USE_IKS01A3_ENV_SENSOR_HTS221_0 == 1)
	IKS01A3_ENV_SENSOR_Enable(IKS01A3_HTS221_0, ENV_HUMIDITY);
	IKS01A3_ENV_SENSOR_Enable(IKS01A3_HTS221_0, ENV_TEMPERATURE);
#endif /* USE_IKS01A3_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A3_ENV_SENSOR_LPS22HH_0 == 1)
	IKS01A3_ENV_SENSOR_Enable(IKS01A3_LPS22HH_0, ENV_PRESSURE);
	IKS01A3_ENV_SENSOR_Enable(IKS01A3_LPS22HH_0, ENV_TEMPERATURE);
#endif /* USE_IKS01A3_ENV_SENSOR_LPS22HH_0 */

	/* Get capabilities */
#if (USE_IKS01A2_ENV_SENSOR_HTS221_0 == 1)
	IKS01A2_ENV_SENSOR_GetCapabilities(HTS221_0, &EnvCapabilities);
#endif /* USE_IKS01A2_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A2_ENV_SENSOR_LPS22HB_0 == 1)
	IKS01A2_ENV_SENSOR_GetCapabilities(LPS22HB_0, &EnvCapabilities);
#endif /* USE_IKS01A2_ENV_SENSOR_LPS22HB_0 */
#if (USE_IKS01A3_ENV_SENSOR_HTS221_0 == 1)
	IKS01A3_ENV_SENSOR_GetCapabilities(IKS01A3_HTS221_0, &EnvCapabilities);
#endif /* USE_IKS01A3_ENV_SENSOR_HTS221_0 */
#if (USE_IKS01A3_ENV_SENSOR_LPS22HH_0 == 1)
	IKS01A3_ENV_SENSOR_GetCapabilities(IKS01A3_LPS22HH_0, &EnvCapabilities);
#endif /* USE_IKS01A3_ENV_SENSOR_LPS22HH_0 */

#elif !defined (SENSOR_ENABLED)
#error SENSOR_ENABLED not defined
#endif /* SENSOR_ENABLED  */

	return HAL_OK;
}
/* USER CODE END EnvSensors_Init */


HAL_StatusTypeDef  Bme680Sensors_Read(sensor_t *sensor_data)
{
	/* USER CODE BEGIN EnvSensors_Read */
	gas_Sensor_Read_data(&bme_gas_sensor,sensor_data);

	return HAL_OK;
	/* USER CODE END EnvSensors_Read */
}


HAL_StatusTypeDef  Bme680Sensors_Init(void)
{
	/* USER CODE BEGIN Bme682Sensors_Init */
	if(gas_Sensor_Init(&bme_gas_sensor))
	{
		return HAL_ERROR;
	}

	/* USER CODE END Bme682Sensors_Init*/

	return HAL_OK;
}


void ADS1232Sensors_Init(sensor_t *sensor_data)
{
	sensor_data->scale.wfs=6;
	sensor_data->scale.wt=0;

	sensor_data->scale.m=2.27673736e-05;
	sensor_data->scale.wzs=2.35198355;
}


HAL_StatusTypeDef NTCRead(ADC_HandleTypeDef *hadc,sensor_t *sensor_data)
{
	uint16_t temp_adc=0;
	uint16_t hum_adc=0;
	HAL_Delay(100);

	for(int i=0;i<16;i++)
	{
		HAL_ADC_Start( hadc);

		HAL_Delay(100);

		HAL_ADC_PollForConversion( hadc, 1000 );

		temp_adc += HAL_ADC_GetValue ( hadc);

		hum_adc+=HAL_ADC_GetValue ( hadc);
		HAL_ADC_Stop(hadc);
	}


	temp_adc/=16;
	hum_adc/=16;
	uint16_t vTemp=(temp_adc*3300)/1023;
	uint16_t vHum=(hum_adc*3300)/1023;

	//	sensor_data->ntc_temp_adc=vTemp;
	//	sensor_data->ntc_hum_adc=vHum;
	sensor_data->ntc_temp_resistance=(vTemp*10000)/(5000-vTemp); //la sonde est alimentée en 5V
	float ln=log(sensor_data->ntc_temp_resistance);
	sensor_data->ntc_temp=(1/(COEFF_A+(COEFF_B*ln)+(COEFF_C*ln*ln*ln)))-273;
	sensor_data->ntc_humidity=0.0375 * vHum- 37.7;


	return HAL_OK;



}


void ADS1232Power(UART_HandleTypeDef *huart,bool status )
{
	uint8_t rcvbuff[64]={0};
	//	activer le relais
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_7,status);
	if(status==RESET)
		return;
	//	activer it
	HAL_UART_Receive_IT(huart, &rcvbuff[rcvptr], 1);

	//	 envoyer commande while !reponse
	uint32_t tickstart = HAL_GetTick();

	while(strstr((char*) command, "Texas Instruments" )==NULL)
	{
		HAL_UART_Transmit(huart,(uint8_t *) "v\r", 2, 200);
		HAL_Delay(100);
		//	printf("%s\r\n",command);
		if((HAL_GetTick() - tickstart) > 15000)
		{
			HAL_GPIO_WritePin(GPIOC, GPIO_PIN_7,RESET);
			HAL_Delay(5000);
			HAL_GPIO_WritePin(GPIOC, GPIO_PIN_7, SET);
			HAL_Delay(5000);
			tickstart = HAL_GetTick();
		}

	}

	/*demarrage de l'ads1232*/

	HAL_Delay(8000);

	//	désactiver it

	HAL_UART_Abort_IT(huart);


}


HAL_StatusTypeDef ADS1232Read(UART_HandleTypeDef *huart,sensor_t *sensor_data)
{
	uint8_t rcvbuff[64]={0};

	const char * separators = "\r\n";
	int num =0;
	uint8_t average=16;

	/*		if(ADS1232VerifPower(huart))
		{
			return HAL_ERROR;
		}*/
	HAL_UART_Transmit(huart,(uint8_t *) "P3\r", 3, 1000);
	HAL_UART_Receive(huart,&rcvbuff[0], 59, 1000);
	HAL_Delay(100);

	HAL_UART_Transmit(huart,(uint8_t *) "K\r", 2, 1000);
	HAL_UART_Receive(huart,&rcvbuff[0], 59, 1000);
	HAL_Delay(100);

	memset(rcvbuff,0,64);

	for(int i=0;i<average;i++)
	{
		HAL_UART_Transmit(huart,(uint8_t *) "d\r", 2, 1000);
		HAL_UART_Receive(huart,&rcvbuff[0], 59, 1000);
		char * strToken = strtok ((char*) rcvbuff, separators );
		strToken = strtok ( NULL, separators );
		num+= (int)strtol(strToken, NULL, 16);
		HAL_Delay(100);
	}
	sensor_data->scale.c=(num/average);
	if(sensor_data->scale.c&0x00800000)
	{
		sensor_data->scale.c|=0xFF000000;
	}


	///	sensor_data->scale.c = ~sensor_data->scale.c+1;

	printf("%x\r\n",sensor_data->scale.c);
	memset(rcvbuff,0,64);
	return HAL_OK;

}




/* USER CODE BEGIN EF */

/* USER CODE END EF */

/* Private Functions Definition -----------------------------------------------*/
/* USER CODE BEGIN PrFD */

/* USER CODE END PrFD */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
