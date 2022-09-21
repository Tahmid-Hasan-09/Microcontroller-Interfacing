#line 1 "I:/Varsity Resources/Tarun_Sir/Code/16X2_8Bit_LCD_Interfacing/Code/LCD_Manual_Command.c"




void lcd_cmd(unsigned char ch);
void lcd_data(unsigned char ch);
void lcd_str(unsigned char *str);
void main() {
 TRISB = 0;
 TRISC = 0;

 lcd_cmd(0x38);
 lcd_cmd(0x0e);

 while(1){
 lcd_cmd(0x01);
 lcd_cmd(0x80);
 lcd_data('A');
 lcd_cmd(0xc0);
 lcd_str("Welcome to PIC");
 lcd_cmd(0x01);
 lcd_cmd(0x80);
 lcd_str("My Name is");
 lcd_cmd(0xc0);
 lcd_str("Tahmid Hasan");
 }

}

void lcd_str(unsigned char *str){
 unsigned int loop = 0;
#line 33 "I:/Varsity Resources/Tarun_Sir/Code/16X2_8Bit_LCD_Interfacing/Code/LCD_Manual_Command.c"
 for(loop=0;str[loop] != '\0';loop++){ lcd_data(str[loop]);
 }

}

void lcd_cmd(unsigned char ch){
  PORTC  = ch;
  PORTB.f0  = 0;
  PORTB.f1  = 1;
 delay_ms(10);
  PORTB.f1  = 0;
}

void lcd_data(unsigned char ch){
  PORTC  = ch;
  PORTB.f0  = 1;
  PORTB.f1  = 1;
 delay_ms(10);
  PORTB.f1  = 0;
}
