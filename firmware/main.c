
#define UART_BAUD_RATE 19200
#define F_CPU 1e6
#define MESSAGEBUF_SIZE 10
 
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
 
 
 
 


int main (void) {  

  unsigned char messageBuf[MESSAGEBUF_SIZE];
  char textbuffer[10];
  uint8_t counter = 0;
  unsigned int dummy;
  

  unsigned char i;
  InitUART (12);     /* Set the baudrate to
2400 bps using a 3.6846MHz crystal */

  USI_TWI_Master_Initialise();
  
  
  messageBuf[0] = 0b01011000;
  messageBuf[1] = 0x00;       
  messageBuf[2] = 0xAB;

        
  USI_TWI_Start_Read_Write( messageBuf, 3 );

  
  DDR_USI =0;
  PORT_USI = 0;
  
  DDRB |= (1<<PB4); // make LED pin output

  
  while(1){
    PORTB |= (1<<PB4);

    _delay_ms(1000);
    PORTB &= ~(1<<PB4);
    //uart_puti(counter++);
    _delay_ms(1000);
    
  
  while (1)
    {
      TransmitByte (ReceiveByte () );       
/* Echo the received character + 1.  Example send in A then send out B */
      for (i = 0; i < 200; i++);
    }

    
    
    
  }

   return 0;              
}






