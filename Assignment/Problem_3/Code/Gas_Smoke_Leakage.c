/****Code By Tahmid Hasan-170109 *****/

// Interfacing DHT11 sensor and gas/smoke leakage with PIC16F887 mikroC code

// LCD module connections
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;
sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;
// End LCD module connections

// DHT11 sensor connection (here data pin is connected to pin RB0)
sbit DHT11_PIN at RB0_bit;
sbit DHT11_PIN_Direction at TRISB0_bit;
// End DHT11 sensor connection

char temperature[] = "Temp = 00.0 C  ";
char humidity[] = "RH   = 00.0 %  ";
unsigned short T_byte1, T_byte2, RH_byte1, RH_byte2, CheckSum ;
int loop;

void Start_Signal(void) {
  DHT11_PIN_Direction = 0;                    // Configure connection pin as output
  DHT11_PIN = 0;                              // Connection pin output low
  delay_ms(25);                               // Wait 25 ms
  DHT11_PIN = 1;                              // Connection pin output high
  delay_us(25);                               // Wait 25 us
  DHT11_PIN_Direction = 1;                    // Configure connection pin as input
}

unsigned short Check_Response() {
  TMR1H = 0;                                  // Reset Timer1
  TMR1L = 0;
  TMR1ON_bit = 1;                             // Enable Timer1 module
  while(!DHT11_PIN && TMR1L < 100);           // Wait until DHT11_PIN becomes high (cheking of 80µs low time response)
  if(TMR1L > 99)                              // If response time > 99µS  ==> Response error
    return 0;                                 // Return 0 (Device has a problem with response)
  else {    TMR1H = 0;                        // Reset Timer1
    TMR1L = 0;
    while(DHT11_PIN && TMR1L < 100);          // Wait until DHT11_PIN becomes low (cheking of 80µs high time response)
    if(TMR1L > 99)                            // If response time > 99µS  ==> Response error
      return 0;                               // Return 0 (Device has a problem with response)
    else
      return 1;                               // Return 1 (response OK)
  }
}

unsigned short Read_Data(unsigned short* dht_data) {
  short i;
  *dht_data = 0;
  for(i = 0; i < 8; i++){
    TMR1H = 0;                                // Reset Timer1
    TMR1L = 0;
    while(!DHT11_PIN)                         // Wait until DHT11_PIN becomes high
      if(TMR1L > 100) {                       // If low time > 100  ==>  Time out error (Normally it takes 50µs)
        return 1;
      }
    TMR1H = 0;                                // Reset Timer1
    TMR1L = 0;
    while(DHT11_PIN)                          // Wait until DHT11_PIN becomes low
      if(TMR1L > 100) {                       // If high time > 100  ==>  Time out error (Normally it takes 26-28µs for 0 and 70µs for 1)
        return 1;                             // Return 1 (timeout error)
      }
     if(TMR1L > 50)                           // If high time > 50  ==>  Sensor sent 1
       *dht_data |= (1 << (7 - i));           // Set bit (7 - i)
  }
  return 0;                                   // Return 0 (data read OK)
}

void main() {

  //Configuration for gas leakage
   trisd.f7 = 1;
   TRISb.f1 = 0;
   TRISb.f2 = 0;
   PORTb.f1 = 0;
   PORTb.f2 = 0;
   
  T1CON = 0x10;                    // Set Timer1 clock source to internal with 1:2 prescaler (Timer1 clock = 1MHz)
  TMR1H = 0;                       // Reset Timer1
  TMR1L = 0;
  Lcd_Init();                      // Initialize LCD module
  Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
  Lcd_Cmd(_LCD_CLEAR);             // clear LCD
  while(1) {
  
  // gas leakage
       if(PORTD.f7 == 1){
         for(loop = 0;loop<10;loop++){
           Portb.f2 = 1;
           Portb.f1 = 1;
           delay_ms(100);
           Portb.f2 = 0;
           Portb.f1 = 0;
           delay_ms(100);
           Portb.f2 = 1;
           Portb.f1 = 1;
           Portb.f2 = 0;
           Portb.f1 = 0;
         }
       }
       if(PORTD.f7 == 0){
           Portb.f1 = 0;
           Portb.f2 = 0;
       }
       // gas leakage end

    Start_Signal();                // Send start signal to the sensor

    if(Check_Response()) {         // Check if there is a response from sensor (If OK start reding humidity and temperature data)
    // Read (and save) data from the DHT11 sensor and check time out errors
      if(Read_Data(&RH_byte1) || Read_Data(&RH_byte2) || Read_Data(&T_byte1) || Read_Data(&T_byte2) || Read_Data(&Checksum)) {
        Lcd_Cmd(_LCD_CLEAR);                               // clear LCD
        lcd_out(1, 5, "Time out!");                        // Display "Time out!"
      }
      else {                                               // If there is no time out error
        if(CheckSum == ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF)) {
        // If there is no checksum error
          temperature[7]  = T_Byte1/10  + 48;
          temperature[8]  = T_Byte1%10  + 48;
          temperature[10] = T_Byte2/10  + 48;
          humidity[7]     = RH_Byte1/10 + 48;
          humidity[8]     = RH_Byte1%10 + 48;
          humidity[10]    = RH_Byte2/10 + 48;
          temperature[11] = 223;                      // Put degree symbol (°)
          lcd_out(1, 1, temperature);
          lcd_out(2, 1, humidity);
        }
        // If there is a checksum error
        else {
          Lcd_Cmd(_LCD_CLEAR);                        // clear LCD
          lcd_out(1, 1, "Checksum Error!");
        }
      }
    }
    // If there is a response (from the sensor) problem
    else {
      Lcd_Cmd(_LCD_CLEAR);                 // clear LCD
      lcd_out(1, 3, "No response");
      lcd_out(2, 1, "from the sensor");
    }

    TMR1ON_bit = 0;                        // Disable Timer1 module
    delay_ms(1000);                        // Wait 1 second

  }
}
// End of code
  
  
  
  