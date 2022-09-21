#line 1 "I:/Varsity Resources/Tarun_Sir/Code/LED_Blinking/LED_Blinking.c"
void main() {
 TRISB = 0x00;
 PORTB = 0x00;

 while(1){
 PORTB.F0 = 0xff;
 delay_ms(1000);
 PORTB.F0 = 0x00;
 delay_ms(1000);
 }
}
