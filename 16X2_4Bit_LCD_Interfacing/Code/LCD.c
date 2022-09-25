// LCD module connections
sbit LCD_RS at RB0_bit; //Register Select line.
sbit LCD_EN at RB1_bit; //Enable line.
sbit LCD_D4 at RC4_bit; //Data 4 line.
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit; //Data 7 line.

sbit LCD_RS_Direction at TRISB0_bit; //Register Select direction pin.
sbit LCD_EN_Direction at TRISB1_bit;//Enable direction pin
sbit LCD_D4_Direction at TRISC4_bit; //Data 4 direction pin
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
// End LCD module connections


void main() {
    TRISB = 0x00;
    TRISC = 0x00;
    
    lcd_init(); //Initializes Lcd module.
    lcd_cmd(_lcd_clear); //Clear display
    lcd_cmd(_LCD_CURSOR_OFF); //Turn off Cursor
    while(1){
      Lcd_Cmd(_LCD_FIRST_ROW); //Move cursor to the 1st row
      Lcd_Chr(2, 3, 'T');
      Delay_ms(100);
      lcd_cmd(_lcd_clear); //Clear display
      Lcd_Out_Cp("Welcome"); //Prints text on Lcd at current cursor position.
      Delay_ms(100);
      Lcd_Out(2, 3, "Tahmid Hasan");
      Delay_ms(1000);
    }
}