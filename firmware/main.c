
#define UART_BAUD_RATE 19200
#define F_CPU 1e6
#define MESSAGEBUF_SIZE 10

//1L=255  -> sets left channel of input 1 to 255
#define CMDLENGTH 6
 
#include <avr/io.h> 
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>

#include "uart.h"
#include "USI_TWI_Master.h"




//############################ main #####################################
 
 
 
 /* Initialize UART */
void
InitUART (unsigned char baudrate)
{
  /* Set the baud rate */
  UBRRL = baudrate;

  /* Enable UART receiver and transmitter */
  UCSRB = (1 << RXEN) | (1 << TXEN);

  /* set to 8 data bits, 1 stop bit */
  UCSRC = (1 << UCSZ1) | (1 << UCSZ0);

}

/* Read and write functions */
unsigned char
ReceiveByte (void)
{
  /* Wait for incomming data */
  while (!(UCSRA & (1 << RXC)));

  /* Return the data */
  return UDR;
}

void
TransmitByte (unsigned char data)
{
  /* Wait for empty transmit buffer */
  while (!(UCSRA & (1 << UDRE)));

  /* Start transmittion */
  UDR = data;
}
 

void ledOn(void){
     PORTB |= (1<<PB4); 
}
 
void ledOff(void){
       PORTB &= ~(1<<PB4);
}
 


int main (void) {  
  
  
  char i2cByte0[] = { 0b01011100, 0b01011100, 0b01011000, 0b01011010, 0b01011000, 0b01011010, 0b01011000, 0b01011010, 0b01011000, 0b01011010 };
  char i2cByte1[] = { 0b00000000, 0b00010000, 0b00000000, 0b00000000, 0b00010000, 0b00010000, 0x60, 0x60, 0x70, 0x70 }; 
  

  unsigned char messageBuf[MESSAGEBUF_SIZE];

  InitUART (12);     /* Set the baudrate to
4800 bps at 1 MHZ */

  USI_TWI_Master_Initialise();
  
  

  
  DDRB |= (1<<PB4); // make LED pin output

    
  char byte;
  char cmdBuffer[8];
  char numBuffer[4];
  uint8_t volVal = 0;
  uint8_t LR = 0;
  uint8_t channel = 0;
  uint8_t lookupIndex = 0;
  uint8_t cmdPos = 0;
  
  while (1)
    {
      
      byte = ReceiveByte();
      
      if(byte == '\r' || byte == '\n') {
        
        if (cmdPos == CMDLENGTH && cmdBuffer[2] == '='){
          // evaluate the command string
          
          // copy the three vals by hand ...
          numBuffer[0]=cmdBuffer[3];
          numBuffer[1]=cmdBuffer[4];         
          numBuffer[2]=cmdBuffer[5];
          numBuffer[3]='\0';
          
          volVal=atoi(numBuffer);
          
          if(cmdBuffer[1] == 'L'){
            LR = 0;
          } else {
            LR = 1;
          }
          
          if(cmdBuffer[0] == 'M'){
            channel=0;
          } else {
            cmdBuffer[1] = '\0';
            channel=atoi(cmdBuffer);
          }
           
          lookupIndex = (channel<<1) | LR;
          
          messageBuf[0] = i2cByte0[lookupIndex];
          messageBuf[1] = i2cByte1[lookupIndex];
          messageBuf[2] = volVal;
          
          USI_TWI_Start_Read_Write( messageBuf, 3 );
          
//           for (uint8_t i =0; i<volVal;i++){
//             TransmitByte ('0');  
//           }
//           TransmitByte('\n');
        }
        
        cmdPos=0;
        ledOff();
      } else {
        ledOn();
        // accumulate the command string
        cmdBuffer[cmdPos++]=byte;
      }
        

    }

   

   return 0;              
}






