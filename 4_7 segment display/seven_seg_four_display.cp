#line 1 "C:/Users/tahmi/Desktop/Lab/4 seven segment display/seven_seg_four_display.c"
int firstDigit = 0xC6;
int secondDigit = 0xC0;
int thirdDigit = 0xC0;
int fourthDigit = 0xC7;


void main() {
 int i=0, j=0;
 TRISB = 0x00;
 portb = 0x00;

 TRISD = 0x00;
 portD = 0x00;
 while(1){

 portd.f1=1;
 portb=firstDigit;
 delay_ms(10);
 portd.f1=0;

 portd.f3=1;
 portb=secondDigit;
 delay_ms(10);
 portd.f3=0;

 portd.f5=1;
 portb=thirdDigit;
 delay_ms(10);
 portd.f5=0;

 portd.f7=1;
 portb=fourthDigit;
 delay_ms(10);
 portd.f7=0;

 }
}
