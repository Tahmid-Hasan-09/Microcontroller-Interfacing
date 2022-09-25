#line 1 "I:/Varsity Resources/Tarun_Sir/Code/16X2_4Bit_LCD_Interfacing/Code/LCD.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;



void main() {
 TRISB = 0x00;
 TRISC = 0x00;

 lcd_init();
 lcd_cmd(_lcd_clear);
 lcd_cmd(_LCD_CURSOR_OFF);
 while(1){
 Lcd_Cmd(_LCD_FIRST_ROW);
 Lcd_Chr(2, 3, 'T');
 Delay_ms(100);
 lcd_cmd(_lcd_clear);
 Lcd_Out_Cp("Welcome");
 Delay_ms(100);
 Lcd_Out(2, 3, "Tahmid Hasan");
 Delay_ms(1000);
 }
}
