/*
 * lora_app.c
 *
 *  Created on: 1 oct. 2021
 *      Author: nicolas
 */


#include "lora_app.h"
#include "uart_if.h"
#include "rtc_if.h"
#include "string.h"
#include "stdio.h"
#include "CayenneLpp.h"
#include "sys_sensors.h"
#include "flash.h"
#include "ringbuffer.h"
uint8_t ping[]="AT\r\n";
uint8_t getVer[]="AT+VER\r\n";
uint8_t setDevEui[]="AT+ID=DevEui,2CF7F120249004EE\r\n";
uint8_t getAppEui[]="AT+ID=AppEui\r\n";

uint8_t setKey[]="AT+KEY=APPKEY , 3288B6E7A5D3C516EC8474BC2ED955ED\r\n";
uint8_t modeOTAA[]="AT+MODE=LWOTAA\r\n";
uint8_t join[]=" AT+JOIN\r\n";
uint8_t DR[]="AT+DR=4\r\n";
uint8_t ADR[]="AT+ADR=ON\r\n";

uint8_t setPort[]="AT+PORT= \r\n";
uint8_t sendMsg[256]="AT+CMSGHEX=";

uint8_t ackrcv[]="+CMSGHEX: Done\r\n";
uint8_t notjoined[]="+CMSGHEX: Please join network first\r\n";
uint8_t joinedrcv[]="+JOIN: Join failed\r\n";

AppData_t AppData = { 0, 0, AppDataBuffer,0 ,0 };
uint8_t rcv[256]={0};



uint8_t lowpoweron[]="AT+LOWPOWER=AUTOON\r\n";
uint8_t lowpoweroff[]="AT+LOWPOWER=AUTOOFF\r\n";


HAL_StatusTypeDef LoRa_init()
{
	uint8_t rslt=HAL_OK;

	uint8_t wkup[32]={0xff,0xff,0xff,0xff};
	sprintf((char*)&wkup+4,"%s",lowpoweroff);

	at_send(&huart2,wkup,1000,strlen((char*)wkup));
	rslt=at_send(&huart2,ping , 1000, strlen((char*)ping));
	rslt=at_send(&huart2,(uint8_t*)"AT+UART=TIMEOUT,0\r\n",2000,strlen((char*)("AT+UART=TIMEOUT, 0\r\n")));
	rslt=at_send(&huart2,(uint8_t*)"AT+UART=BR,115200\r\n",2000,strlen((char*)("AT+UART=BR,115200\r\n")));
	huart2.Init.BaudRate=115200;
	HAL_UART_Init(&huart2);
	rslt=at_send(&huart2, getVer, 1000,strlen((char*)getVer));
	rslt=at_send(&huart2, setDevEui, 1000,strlen((char*)setDevEui));
	rslt=at_send(&huart2, getAppEui, 1000,strlen((char*)getAppEui));
	rslt=at_send(&huart2,setKey,1000,strlen((char*)setKey));
	rslt=at_send(&huart2,DR,1000,strlen((char*)DR));
	rslt=at_send(&huart2,ADR,1000,strlen((char*)ADR));



	if(LoRa_join())
	{
		return HAL_ERROR;
	}
	else
	{
		AppData.is_join=1;
	}



	rslt=at_send(&huart2, lowpoweron, 1000, strlen((char*)lowpoweron));
	return rslt;
}

HAL_StatusTypeDef LoRa_join()
{
	uint8_t rslt=HAL_OK;

	rslt=at_send(&huart2, modeOTAA, 1000,strlen((char*)modeOTAA));
	rslt=at_Com(&huart2, join,rcv, 10000,strlen((char*)join));
	char* ack=strstr((char*)rcv,(char*)joinedrcv);
	if(ack!=NULL)
		return HAL_BUSY;
	return rslt;
}

HAL_StatusTypeDef LoRa_send(uint8_t port, uint8_t *message,uint8_t size)
{
	uint8_t rslt=HAL_OK;
	uint8_t rcv[256]={0};

	setPort[8]=port+'0';


	printf("%s",setPort);
	rslt+=at_send(&huart2, setPort  , 1000,strlen((char*)setPort));
	uint8_t len=strlen((char*)sendMsg);
	for(int i=0;i<size;i++)
	{
		sprintf((char*)&sendMsg[len+2*i],"%02x",message[i]);
	}
	strcat((char*)&sendMsg[len+2*size],"\r\n");

	//uint8_t exemple[]="AT+CMSGHEX=12345678\r\n";
	printf("%s",sendMsg);
	rslt+=at_send(&huart2,(uint8_t*)"AT+LW=DTR\r\n",1000,strlen((char*)"AT+LW=DTR\r\n"));
	rslt+=at_Com(&huart2,sendMsg,rcv,12000,len+2*size+2);
	char* ack=strstr((char*)rcv,(char*)ackrcv);
	if(ack!=NULL)
	{
		AppData.is_send=1;
	}
	else if(strstr((char*)rcv,(char*)notjoined)!=NULL)
	{
		AppData.is_join=0;

	}
	memset((char*)&sendMsg[len],0,2*size+2);
	return rslt;
}

HAL_StatusTypeDef LoRa_process()
{
	HAL_StatusTypeDef rslt=HAL_OK;
	AppData.is_send=0;
	int8_t try=2;

	uint8_t wkup[32]={0xff,0xff,0xff,0xff};
	sprintf((char*)&wkup+4,"%s",lowpoweroff);

	at_send(&huart2,wkup,1000,strlen((char*)wkup));

	do
	{
		if(AppData.is_join)
		{
			queue.cursor--;
			buffer_get(&queue, AppData.Buffer,sizeof(uint64_t));
			rslt=LoRa_send(AppData.Port,AppData.Buffer,AppData.BufferSize);
			if(AppData.is_send)
			{
				buffer_flush(&queue);
				break;
			}
			else
				try--;
			__movecursor(&queue);

		}
		else
		{
			if(LoRa_join())
			{
				try--;
			}
			else
			{
				AppData.is_join=1;
			}
		}

	}while(queue.cursor!=0 && try>=0);
	rslt=at_send(&huart2, lowpoweron, 1000, strlen((char*)lowpoweron));

	return rslt;

}



void CayenneMakeBuffer(void)
{
	/* USER CODE BEGIN SendTxData_1 */
	uint16_t pressure = 0;
	int16_t temperature_bme = 0;
	int16_t temperature_ntc =0;
	sensor_t sensor_data={0};
	uint16_t weight=0;
	//UTIL_TIMER_Time_t nextTxIn = 0;

#ifdef CAYENNE_LPP
	uint8_t channel = 0;
#else
	uint16_t humidity = 0;
	uint32_t i = 0;
	int32_t latitude = 0;
	int32_t longitude = 0;
	uint16_t altitudeGps = 0;
#endif /* CAYENNE_LPP */

	// EnvSensors_Read(&sensor_data);

	Bme680Sensors_Init();
	//ADS1232Sensors_Init(&sensor_data);
	Bme680Sensors_Read(&sensor_data);
	NTCRead(&hadc1,&sensor_data);
	printf("NTC_TEMP=%f °C NTC_HUM=%f%\r\n",sensor_data.ntc_temp,sensor_data.ntc_humidity);
//	ADS1232Read(&huart5,&sensor_data);

	sensor_data.scale.weight = (sensor_data.scale.m*sensor_data.scale.c + sensor_data.scale.wzs -sensor_data.scale.wt)*100;
	printf("adc code = %x weight= %f\r\n",sensor_data.scale.c,sensor_data.scale.weight);
	//sprintf(&weight,"%06.3f",sensor_data.scale.weight);
	temperature_bme = (uint16_t)(sensor_data.temperature);
	temperature_ntc = (uint16_t)(sensor_data.ntc_temp*100);
	pressure    = (sensor_data.pressure / 100);      /* in hPa / 10 */
	//	weight = (int)(sensor_data.scale.weight < 0 ? (sensor_data.scale.weight - 0.5) : (sensor_data.scale.weight + 0.5));
	weight =sensor_data.scale.weight;
	AppData.Port = LORAWAN_USER_APP_PORT;
#ifdef CAYENNE_LPP
	CayenneLppReset();
	CayenneLppAddBarometricPressure(channel++, (uint16_t)(sensor_data.pressure/100));
	CayenneLppAddTemperature(channel++, (uint16_t)temperature_bme);
	CayenneLppAddTemperature(channel++, (uint16_t)temperature_ntc);
	//CayenneLppAddAnalogInput(channel++, (uint16_t) weight);
	//CayenneLppAddAnalogInput(channel++,sensor_data.raw_weight);
	CayenneLppAddRelativeHumidity(channel++, (uint16_t)(sensor_data.humidity/1000));
	CayenneLppAddRelativeHumidity(channel++, (uint16_t)(sensor_data.ntc_humidity));




	CayenneLppCopy(AppData.Buffer);
	AppData.BufferSize = CayenneLppGetSize();

	buffer_flush(&queue);
	buffer_put(&queue, AppData.Buffer);
	__movecursor(&queue);
#endif /* CAYENNE_LPP */


	/* USER CODE END SendTxData_1 */
}

