/*
 * uart_if.h
 *
 *  Created on: Sep 30, 2021
 *      Author: nicolas
 */

#ifndef INC_UART_IF_H_
#define INC_UART_IF_H_


#include "main.h"
#include "stm32l4xx_hal.h"

HAL_StatusTypeDef at_Com(UART_HandleTypeDef *huart,uint8_t *p_ack,uint8_t *p_rcv, int timeout_ms,uint8_t size);
HAL_StatusTypeDef at_send(UART_HandleTypeDef *huart,uint8_t *p_ack, int timeout_ms, uint8_t size);






#endif /* INC_UART_IF_H_ */
