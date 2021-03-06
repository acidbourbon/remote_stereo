
#define F_CPU 1e6
#define MESSAGEBUF_SIZE 10





#define CMDLENGTH 6

#include <avr/io.h> 
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>


// I got the source code for using the ATTiny2313 USI as I2C master
// from http://www.instructables.com/id/I2C_Bus_for_ATtiny_and_ATmega/
// thanks to instructables user doktec!
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
  // turn debug led on
     PORTB |= (1<<PB4); 
}
 
void ledOff(void){
  // turn debug led off
       PORTB &= ~(1<<PB4);
}

void paMute(void){
  // set power amp mute pin
     PORTB |= (1<<PB3); 
}
 
void paUnMute(void){
  // clear power amp mute pin
       PORTB &= ~(1<<PB3);
}

 
 



int main (void) {  
  
  
  // arrays containing the address/command bytes to control the individual digipots
  char i2cByte0[] = { 0b01011100, 0b01011100, 0b01011000, 0b01011010, 0b01011000, 0b01011010, 0b01011000, 0b01011010, 0b01011000, 0b01011010 };
  char i2cByte1[] = { 0b00000000, 0b00010000, 0b00000000, 0b00000000, 0b00010000, 0b00010000, 0x60, 0x60, 0x70, 0x70 }; 
  

  unsigned char messageBuf[MESSAGEBUF_SIZE];

  InitUART (12);     /* Set the baudrate to
4800 bps at 1 MHZ */

  USI_TWI_Master_Initialise();
  
  

  
  DDRB |= (1<<PB4) | (1<<PB3); // make LED pin output, make MUTE pin output

    
  char byte;
  char cmdBuffer[8];
  char numBuffer[4];
  uint8_t volVal = 0;
  uint8_t LR = 0;
  uint8_t channel = 0;
  uint8_t lookupIndex = 0;
  uint8_t cmdPos = 0;
  
  
  // initialize all potis with zero volume
  
  for(uint8_t i=0;i<10;i++){
          messageBuf[0] = i2cByte0[i];
          messageBuf[1] = i2cByte1[i];
          messageBuf[2] = 220;
          
          USI_TWI_Start_Read_Write( messageBuf, 3 );
  }
  
  
  
  // main loop, run forever
  
  while (1)
    {
      // receive from UART
      byte = ReceiveByte();
      
      
      /* let me quickly explain the UART command format by examples:
       * 
       * [channel#][left/right]=[volume][carriage return (or) newline]
       * 
       *    1L=255  -> sets left channel of input 1 to 255 (maximum value)
       *    2R=000  -> sets right channel of input 2 to 0 (minimum value)
       *    MM=TRU  -> mutes the power amp
       *    MM=FLS  -> unmutes the power amp
       *    ML=128  -> set left channel of master volume to 128
       *    MR=128  -> set right channel of master volume to 128
       * 
       * i think you get the idea
       * 
       */
      
      
      
      
      // when carriage return or newline character is received
      // evaluate the command you have just received
      // given that you can make sense of it
      if(byte == '\r' || byte == '\n') {
        
        // evaluate the command string
        
        // is there an equal sign, and is it in the right position?
        if (cmdPos == CMDLENGTH && cmdBuffer[2] == '='){
          
          
          // is it a mute command?
          if (cmdBuffer[0] == 'M' && cmdBuffer[1] == 'M') {
            // so we received a command beginning with "MM"
            if (cmdBuffer[3] == 'T' && cmdBuffer[4] == 'R' && cmdBuffer[5] == 'U') { // MUTE == TRUE?
              paMute(); // MUTE the PA!
            } else {
              paUnMute(); // not MUTE the PA!
            }
            
          } else { // was a volume command
            
            // commands for the left channel contain an L as second letter, if it's not an L, treat it as R
            if(cmdBuffer[1] == 'L'){ 
              LR = 0;
            } else {
              LR = 1;
            }
            
            // if command begins with an M, it means it's a master volume command
            if(cmdBuffer[0] == 'M'){
              channel=0;
            } else {
              // use the first character in command string 
              // as channel 
              cmdBuffer[1] = '\0';
              channel=atoi(cmdBuffer);
            }
             
            // calculate the the index that leads us to the correct
            // entry in the i2cByte0/i2cByte1 arrays
            lookupIndex = (channel<<1) | LR;
            
            // calculate the volume ...
            // quick and ugly way to copy three bytes between arrays
            // no need to use strcpy :D
            numBuffer[0]=cmdBuffer[3];
            numBuffer[1]=cmdBuffer[4];         
            numBuffer[2]=cmdBuffer[5];
            numBuffer[3]='\0'; // terminate the string
            volVal=atoi(numBuffer);
            
            messageBuf[0] = i2cByte0[lookupIndex]; // load address byte 0
            messageBuf[1] = i2cByte1[lookupIndex]; // load address/data byte 1
            messageBuf[2] = volVal; // third byte is poti wiper position
            
            // send command to the poti
            USI_TWI_Start_Read_Write( messageBuf, 3 );
          
          }
          
        }
        
        cmdPos=0; // reset character counter
        ledOff(); // turn debug led off after successful/unsuccessful execution of command
      } else {
        ledOn(); // command is not complete, turn led on to show that you are still waiting
        // accumulate the command string
        cmdBuffer[cmdPos++]=byte;
      }
        

    } // end of main loop

   // never reached

   return 0;              
}






