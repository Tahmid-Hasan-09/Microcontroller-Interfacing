#line 1 "I:/Varsity Resources/Tarun_Sir/Code/2_Seven_Segment_Display/Code/Source_Code.c"
char array[]={0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

void main() {
 int i=0, j=0, leftDigit, rightDigit;
 TRISB = 0x00;
 TRISC = 0x00;
 portb = 0x00;
 portc = 0x00;

 while(1){
 for(i=0;i<31;i++){
 leftDigit = i/10;
 rightDigit = i%10;

 for(j=0;j<20;j++){

 portc.f3=1;
 portb=array[leftDigit];
 delay_ms(20);
 portc.f3=0;

 portc.f6=1;
 portb=array[rightDigit];
 delay_ms(20);
 portc.f6=0;

 }

 }
 }
}
