
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
 


int main (void) {  

  unsigned char messageBuf[MESSAGEBUF_SIZE];
  char textbuffer[10];
  uint8_t counter = 0;
  unsigned int dummy;
  
  uart_init( UART_BAUD_SELECT(UART_BAUD_RATE,F_CPU) );
  sei();
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
    uart_puts("test\r\n");
    _delay_ms(1000);
    PORTB &= ~(1<<PB4);
    //uart_puti(counter++);
    while(1){
      dummy = uart_getc();
      if(dummy & UART_NO_DATA){
        
      } else {
            if ( dummy & UART_FRAME_ERROR )
            {
                /* Framing Error detected, i.e no stop bit detected */
                uart_puts("UART Frame Error: ");
            }
            if ( dummy & UART_OVERRUN_ERROR )
            {
                /* 
                 * Overrun, a character already present in the UART UDR register was 
                 * not read by the interrupt handler before the next character arrived,
                 * one or more received characters have been dropped
                 */
                uart_puts("UART Overrun Error: ");
            }
            if ( dummy & UART_BUFFER_OVERFLOW )
            {
                /* 
                 * We are not reading the receive buffer fast enough,
                 * one or more received character have been dropped 
                 */
                uart_puts("Buffer overflow error: ");
            }

        uart_puti( dummy );
        uart_puts("\r\n");
      }
    }
    _delay_ms(1000);
  }

   return 0;              
}






