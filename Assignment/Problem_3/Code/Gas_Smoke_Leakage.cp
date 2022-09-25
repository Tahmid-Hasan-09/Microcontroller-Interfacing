#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Assignment/Problem_3/Code/Gas_Smoke_Leakage.c"








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



sbit DHT11_PIN at RB0_bit;
sbit DHT11_PIN_Direction at TRISB0_bit;


char temperature[] = "Temp = 00.0 C  ";
char humidity[] = "RH   = 00.0 %  ";
unsigned short T_byte1, T_byte2, RH_byte1, RH_byte2, CheckSum ;
int loop;

void Start_Signal(void) {
 DHT11_PIN_Direction = 0;
 DHT11_PIN = 0;
 delay_ms(25);
 DHT11_PIN = 1;
 delay_us(25);
 DHT11_PIN_Direction = 1;
}

unsigned short Check_Response() {
 TMR1H = 0;
 TMR1L = 0;
 TMR1ON_bit = 1;
 while(!DHT11_PIN && TMR1L < 100);
 if(TMR1L > 99)
 return 0;
 else { TMR1H = 0;
 TMR1L = 0;
 while(DHT11_PIN && TMR1L < 100);
 if(TMR1L > 99)
 return 0;
 else
 return 1;
 }
}

unsigned short Read_Data(unsigned short* dht_data) {
 short i;
 *dht_data = 0;
 for(i = 0; i < 8; i++){
 TMR1H = 0;
 TMR1L = 0;
 while(!DHT11_PIN)
 if(TMR1L > 100) {
 return 1;
 }
 TMR1H = 0;
 TMR1L = 0;
 while(DHT11_PIN)
 if(TMR1L > 100) {
 return 1;
 }
 if(TMR1L > 50)
 *dht_data |= (1 << (7 - i));
 }
 return 0;
}

void main() {


 trisd.f7 = 1;
 TRISb.f1 = 0;
 TRISb.f2 = 0;
 PORTb.f1 = 0;
 PORTb.f2 = 0;

 T1CON = 0x10;
 TMR1H = 0;
 TMR1L = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 while(1) {


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


 Start_Signal();

 if(Check_Response()) {

 if(Read_Data(&RH_byte1) || Read_Data(&RH_byte2) || Read_Data(&T_byte1) || Read_Data(&T_byte2) || Read_Data(&Checksum)) {
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1, 5, "Time out!");
 }
 else {
 if(CheckSum == ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF)) {

 temperature[7] = T_Byte1/10 + 48;
 temperature[8] = T_Byte1%10 + 48;
 temperature[10] = T_Byte2/10 + 48;
 humidity[7] = RH_Byte1/10 + 48;
 humidity[8] = RH_Byte1%10 + 48;
 humidity[10] = RH_Byte2/10 + 48;
 temperature[11] = 223;
 lcd_out(1, 1, temperature);
 lcd_out(2, 1, humidity);
 }

 else {
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1, 1, "Checksum Error!");
 }
 }
 }

 else {
 Lcd_Cmd(_LCD_CLEAR);
 lcd_out(1, 3, "No response");
 lcd_out(2, 1, "from the sensor");
 }

 TMR1ON_bit = 0;
 delay_ms(1000);

 }
}
