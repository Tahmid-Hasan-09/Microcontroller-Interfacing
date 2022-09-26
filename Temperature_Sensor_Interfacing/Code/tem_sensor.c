// LCD module connections
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;
// End LCD module connections


void main() {
   float adc_value = 0;
   float backtoanalog_value = 0;
   float temperature = 0;
   char display[16]="";

   TRISB = 0x00;
   TRISA.f0 = 1;

   adcon1=0x80;
   ADC_Init(); // Initialize ADC module with default settings
   Delay_ms(100);
   Lcd_Init(); // Initialize LCD
   Delay_ms(100);

   Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off

   Lcd_Out(1,1,"Learning");
   Lcd_Out(2,2,"Microcontrollers");
   Delay_ms(200);
   Lcd_Cmd(_LCD_CLEAR); // Clear display

   while(1){
       adc_value = ADC_Read(0);  // Read analog value from channel 0
       backtoanalog_value = (adc_value*5 / 1023);//10bit,resolution=5/1023
       temperature = backtoanalog_value*100; // 1 degree = 10mv -> 1volt = 100 degree

       FloatToStr_FixLen(temperature, display, 4);
       //Delay_ms(20);

       //Now we can display this string on LCD
       //Lcd_Cmd(_LCD_CLEAR);

       Lcd_Out(1,1,"Temp = ");
       lcd_out_cp(display);
       lcd_chr(1,12,0xdf); //print at pos(row=1,col=16) "°" =223 =0xdf
       lcd_out_cp(" C"); //celcius
   }
}
