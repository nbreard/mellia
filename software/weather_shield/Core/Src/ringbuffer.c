/*
 * ringbuffer.c
 *
 *  Created on: 13 oct. 2021
 *      Author: nicolas
 */


#include "ringbuffer.h"
#include "stdio.h"
#include "string.h"


#include "lora_app.h"


void buffer_init(circular_buf_t *buff,uint32_t* list,size_t size,uint32_t baseAdress)
{
	buff->size=size;
	buff->base_adress=baseAdress;
	buff->cursor=0;

	uint32_t tmp=baseAdress;

	for(int i=0;i<=size;i++)
	{
	//	buff->buffer[i]=tmp;
		list[i]=tmp;
		tmp+=0x800;
	}
	buff->buffer=list;

}
/*put a paylaod message into the buffer queue */
HAL_StatusTypeDef buffer_put(circular_buf_t *buff,uint8_t *p_wr)
{
	HAL_StatusTypeDef rslt=HAL_OK;


	rslt=memory_write(p_wr,buff->buffer[buff->cursor]);
	return rslt;

}

void __movecursor(circular_buf_t *buff)
{
	if(buff->cursor<=buff->size)
	{
		buff->cursor++;
	}
	else
	{
		buff->cursor=0;
	}
}
/*get a payload message from the buffer queue*/
HAL_StatusTypeDef buffer_get(circular_buf_t *buff,uint8_t *p_rd,size_t size)
{
	HAL_StatusTypeDef rslt=HAL_OK;

	rslt=memory_read(p_rd,buff->buffer[buff->cursor],size);

	return rslt;
}
/*erase de memory page before wrinting in it */
HAL_StatusTypeDef buffer_flush(circular_buf_t *buff)
{
	HAL_StatusTypeDef rslt=HAL_OK;

	if(BASEPAGE+buff->cursor>127)
	{
		return HAL_ERROR;
	}
	else
	rslt=memory_erasePage(BASEPAGE+buff->cursor);

	return rslt;
}


void buffer_example()
{

	uint8_t message1[]="toto";
	uint8_t message2[]="tutu";
	uint8_t message3[]="tata";
	uint8_t rcv[32]={0};

	AppData_t AppData;

	buffer_init(&queue, adressList,3, BASEADRESSFLASH);
	for(int i=125;i<=127;i++)
	memory_erasePage(i);


	AppData.Buffer=message1;
	/*stocker le payload en mémoire */
	buffer_put(&queue, AppData.Buffer);
	__movecursor(&queue);

	AppData.Buffer=message2;
	buffer_put(&queue,   AppData.Buffer);
	__movecursor(&queue);

	AppData.Buffer=message3;
	buffer_put(&queue,  AppData.Buffer);

	__movecursor(&queue);
	AppData.Buffer=AppDataBuffer;

	do
	{
		queue.cursor--;
		buffer_get(&queue, rcv,sizeof(uint64_t));
		buffer_flush(&queue);
		strcat((char*)AppData.Buffer,(char*)rcv);
		printf("%s\r\n",AppData.Buffer);

	}
	while(queue.cursor!=0);

	memset(AppData.Buffer,0,strlen((char*)AppData.Buffer));
	HAL_Delay(1000);
}
