/*
 * rtc_if.c
 *
 *  Created on: Oct 8, 2021
 *      Author: nicolas
 */

#include "rtc_if.h"


extern uint8_t lowpoweron[];
extern uint8_t lowpoweroff[];

HAL_StatusTypeDef setDate(UART_HandleTypeDef *huart ,RTC_HandleTypeDef *hrtc)
{
	uint8_t rtc[]="AT+RTC\r\n";
	uint8_t rtczone[]="AT+RTC=ZONE,+00:00\r\n";

	uint8_t rcv[32]={0};
	struct tm clk={0};
	uint8_t wkup[32]={0xff,0xff,0xff,0xff};
/*	sprintf((char*)&wkup+4,"%s",lowpoweroff);
	at_send(huart,wkup,1000,strlen((char*)wkup));
	at_send(huart,rtczone,1000,strlen((char*)rtczone));
	at_Com(huart,rtc ,rcv, 1000, strlen((char*)rtc));
	at_send(huart, lowpoweron, 1000, strlen((char*)lowpoweron));


	char * result = strstr((char*) rcv, "+RTC:" );
	if(result!=NULL)
	{
		strptime((char*)&rcv[6],"%F %T",&clk);

		if(clk.tm_year<121)
		{
			return HAL_ERROR;
		}
		else
		{
			sDate.Year = clk.tm_year-100;
			sDate.Month = clk.tm_mon+1; //strptime renvoie les mois entre 0-11
			sDate.Date = clk.tm_mday;
			sDate.WeekDay = clk.tm_wday;
			HAL_RTC_SetDate(hrtc, &sDate, RTC_FORMAT_BIN);

			sTime.Hours = clk.tm_hour+1;
			sTime.Minutes = clk.tm_min;
			sTime.Seconds = clk.tm_sec;
			sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE ;
			sTime.StoreOperation = RTC_STOREOPERATION_RESET;
			HAL_RTC_SetTime(hrtc, &sTime, RTC_FORMAT_BIN);

			HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
			HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);
			printf("20%d-%d-%02d %02d:%02d:%02d\r\n",sDate.Year,sDate.Month,sDate.Date,sTime.Hours ,sTime.Minutes,sTime.Seconds);

			return HAL_OK;
		}
	}
	else
	{
		return HAL_ERROR;
	}*/

	sDate.Year = 21;
	sDate.Month = 12;
	sDate.Date = 13;
	sDate.WeekDay =1;
	HAL_RTC_SetDate(hrtc, &sDate, RTC_FORMAT_BIN);

	sTime.Hours = 23;
	sTime.Minutes = 55;
	sTime.Seconds = 00;
	sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE ;
	sTime.StoreOperation = RTC_STOREOPERATION_RESET;
	HAL_RTC_SetTime(hrtc, &sTime, RTC_FORMAT_BIN);

	HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);
	printf("20%d-%d-%02d %02d:%02d:%02d\r\n",sDate.Year,sDate.Month,sDate.Date,sTime.Hours ,sTime.Minutes,sTime.Seconds);

	return HAL_OK;
}

HAL_StatusTypeDef setAlarm(RTC_HandleTypeDef *hrtc,RTC_AlarmTypeDef *alarm,uint32_t delay)
{

	RTC_TimeTypeDef currentTime;
	HAL_StatusTypeDef rslt=HAL_OK;

	rslt=HAL_RTC_GetTime(hrtc, &currentTime, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);

	alarm->AlarmTime=currentTime;
	alarm->AlarmTime.Minutes+=delay;

	/*	while(alarm->AlarmTime.Seconds>=60)
	{
		alarm->AlarmTime.Seconds-=60;
		alarm->AlarmTime.Minutes++;
	}*/

	while(alarm->AlarmTime.Minutes>=60)
	{
		alarm->AlarmTime.Minutes-=60;
		alarm->AlarmTime.Hours++;
	}

	alarm->AlarmTime.Hours%=24;

	HAL_RTC_SetAlarm_IT(hrtc, alarm, RTC_FORMAT_BIN);
	// __HAL_RTC_ALARM_ENABLE_IT(hrtc, RTC_IT_ALRA);

	printf("alarm set to : %02d:%02d:%02d\r\n",alarm->AlarmTime.Hours ,alarm->AlarmTime.Minutes,alarm->AlarmTime.Seconds);
	HAL_Delay(10);

	return rslt;
}





void stopWithAlarm(RTC_HandleTypeDef *hrtc,RTC_AlarmTypeDef *alarm)
{

	HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);
	printf("20%d-%d-%02d %02d:%02d:%02d\r\n",sDate.Year,sDate.Month,sDate.Date,sTime.Hours ,sTime.Minutes,sTime.Seconds);

	printf("enter stop mode \r\n");
	setAlarm(hrtc, alarm,10);

	HAL_SuspendTick();
	HAL_PWR_EnterSTOPMode(PWR_MAINREGULATOR_ON,PWR_SLEEPENTRY_WFI);
	HAL_ResumeTick();
	SystemClock_Config();
	printf("exit stop mode \r\n");
	HAL_RTC_GetTime(hrtc, &sTime, RTC_FORMAT_BIN);
	HAL_RTC_GetDate(hrtc, &sDate, RTC_FORMAT_BIN);
	printf("20%d-%d-%02d %02d:%02d:%02d\r\n",sDate.Year,sDate.Month,sDate.Date,sTime.Hours ,sTime.Minutes,sTime.Seconds);
}






