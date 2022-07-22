/*
 * rtc_if.h
 *
 *  Created on: Oct 8, 2021
 *      Author: nicolas
 */

#ifndef INC_RTC_IF_H_
#define INC_RTC_IF_H_

#include "stm32l4xx_hal.h"
#include <time.h>
#include "stdio.h"
#include "string.h"
#include "uart_if.h"

RTC_DateTypeDef  sDate;
RTC_TimeTypeDef  sTime;
RTC_AlarmTypeDef sAlarm;


HAL_StatusTypeDef setDate(UART_HandleTypeDef *huart ,RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef setAlarm(RTC_HandleTypeDef *hrtc,RTC_AlarmTypeDef *alarm,uint32_t delay);
void stopWithAlarm(RTC_HandleTypeDef *hrtc,RTC_AlarmTypeDef *alarm);

#endif /* INC_RTC_IF_H_ */
