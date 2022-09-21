#define rs PORTB.f0
#define en PORTB.f1
#define lcd_cmd_or_data PORTC

void lcd_cmd(unsigned char ch);
void lcd_data(unsigned char ch);
void lcd_str(unsigned char *str);
void main() {
   TRISB = 0;
   TRISC = 0;

   lcd_cmd(0x38); // 8bit,2Line,5X7 dots
   lcd_cmd(0x0e); //Display on,Cursor On

   while(1){
   lcd_cmd(0x01); //clear Display
     lcd_cmd(0x80); //1st row
     lcd_data('A');
     lcd_cmd(0xc0); //2nd row
     lcd_str("Welcome to PIC");
     lcd_cmd(0x01); //clear Display
     lcd_cmd(0x80); //1st row
     lcd_str("My Name is");
     lcd_cmd(0xc0); //2nd row
     lcd_str("Tahmid Hasan");
   }
   
}

void lcd_str(unsigned char *str){
 unsigned int loop = 0;
 for(loop=0;str[loop] != '\0';loop++){\
  lcd_data(str[loop]);
 }
 
}

void lcd_cmd(unsigned char cmd){
 lcd_cmd_or_data = cmd;
 rs = 0; //cmd
 en = 1;
 delay_ms(10);
 en = 0;
}

void lcd_data(unsigned char dat){
 lcd_cmd_or_data = dat;
 rs = 1; //data
 en = 1;
 delay_ms(10);
 en = 0;
}