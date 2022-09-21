// Lcd pinout settings
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;


void main() {
  char voltage_txt[15];
  float analog_volatage;
  float adc_value = 0;
  ADC_Init();  // Initialize ADC module with default settings
  
  TRISB = 0x00;
  TRISA.f0 = 1;

  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Cmd(_LCD_CLEAR);
  while(1){
    adc_value = ADC_Read(0);  // Read analog value from channel 0
    analog_volatage = adc_value * 5 / 1023 ;
    //FloatToStr(adc_value, voltage_txt);
    FloatToStr_FixLen(analog_volatage, voltage_txt, 4);
    
    Lcd_Out(1, 3, "Analog Voltage:");
    Lcd_Cmd(_LCD_SECOND_ROW);
    Lcd_Out(2, 8, voltage_txt);
    Delay_ms(100);
  }
}