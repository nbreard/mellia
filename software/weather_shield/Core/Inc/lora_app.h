/*
 * lora_app.h
 *
 *  Created on: 1 oct. 2021
 *      Author: nicolas
 */

#ifndef INC_LORA_APP_H_
#define INC_LORA_APP_H_
#include "stm32l4xx_hal.h"
#include "main.h"

#define LORAWAN_APP_DATA_BUFFER_MAX_SIZE            242

#define LORAWAN_USER_APP_PORT                       2
#define CAYENNE_LPP



extern UART_HandleTypeDef huart2;
extern UART_HandleTypeDef huart5;

extern ADC_HandleTypeDef hadc1;
extern RTC_HandleTypeDef hrtc;


/**
  * @brief User application buffer
  */
 uint8_t AppDataBuffer[LORAWAN_APP_DATA_BUFFER_MAX_SIZE];

/**
  * @brief User application data structure
  */


HAL_StatusTypeDef LoRa_init();
HAL_StatusTypeDef LoRa_join();
HAL_StatusTypeDef LoRa_send(uint8_t port, uint8_t *message,uint8_t size);
HAL_StatusTypeDef LoRa_process();

void CayenneMakeBuffer(void);


void string2hexString(char* input, char* output);


#endif /* INC_LORA_APP_H_ */
