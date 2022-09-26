#line 1 "I:/Microcontroller lab practice/Relay interfacing running motor/code/relay_interfacing_motor_running.c"

void main() {

 TRISC=0x00;
 PORTC=0x00;

 while(1){

 portc.f0=1;
 delay_ms(8000);
 portc.f0=0;
 delay_ms(2000);

 }

}
