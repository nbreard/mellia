/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    sys_sensors.h
  * @author  MCD Application Team
  * @brief   Header for sensors application
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SENSORS_H__
#define __SENSORS_H__

#ifdef __cplusplus
extern "C" {
#endif
/* Includes ------------------------------------------------------------------*/

/* USER CODE BEGIN Includes */
//#include "stm32l4xx_hal_def.h"
#include "stm32l4xx_hal.h"
#include "stdbool.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/

typedef struct
{
	float weight; // weight = m*c + wzs -wt
	uint8_t wt;   // tare

	float m;    // calibration constant m=wfs/(cfs-czs)

	uint8_t wfs;  // calibration weight
	float wzs;  // zero scale mass	wzs=-m*czs

	int32_t c;   // raw adc code
	int32_t cfs; // raw adc code of the calibration weight
	int32_t czs; // raw adc code of the zero scale mass


	bool is_calibrate;

} ADS1232_HandleTypeDef;



/**
  * Sensor data parameters
  */
typedef struct
{
  float pressure;         /*!< in mbar */
  float temperature;      /*!< in degC */
  float humidity;         /*!< in % */
  int32_t latitude;       /*!< latitude converted to binary */
  int32_t longitude ;     /*!< longitude converted to binary */
  int16_t altitudeGps;    /*!< in m */
  int16_t altitudeBar ;   /*!< in m * 10 */

  uint32_t ntc_temp_resistance;/*!< in Ohm */
  float ntc_temp;         /*!< in degC */
  float ntc_humidity;     /*!< in % */

  uint16_t ntc_temp_adc;
  uint16_t ntc_hum_adc;

  ADS1232_HandleTypeDef scale;

  /**more may be added*/
  /* USER CODE BEGIN sensor_t */

  /* USER CODE END sensor_t */
} sensor_t;




/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/

/* USER CODE BEGIN EC */
#if defined (SENSOR_ENABLED) && (SENSOR_ENABLED == 1) && defined (X_NUCLEO_IKS01A2)
#define HTS221_0    0U
#define LPS22HB_0   1U
#endif /* SENSOR_ENABLED & X_NUCLEO_IKS01A2 */
/* USER CODE END EC */

/* External variables --------------------------------------------------------*/
/* USER CODE BEGIN EV */

/* USER CODE END EV */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
/**
  * @brief  initialize the environmental sensor
  */
HAL_StatusTypeDef EnvSensors_Init(void);
HAL_StatusTypeDef  Bme680Sensors_Init(void);
void ADS1232Sensors_Init(sensor_t *sensor_data);

/**
  * @brief  Environmental sensor  read.
  * @param  sensor_data sensor data
  */
int32_t EnvSensors_Read(sensor_t *sensor_data);
HAL_StatusTypeDef  Bme680Sensors_Read(sensor_t *sensor_data);

HAL_StatusTypeDef NTCRead(ADC_HandleTypeDef *hadc,sensor_t *sensor_data);

void ADS1232Power(UART_HandleTypeDef *huart,bool status );

HAL_StatusTypeDef ADS1232Read(UART_HandleTypeDef *huart,sensor_t *sensor_data);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

#ifdef __cplusplus
}
#endif

#endif /* __SENSORS_H__ */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
