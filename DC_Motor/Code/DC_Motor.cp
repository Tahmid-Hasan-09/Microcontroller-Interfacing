#line 1 "I:/Varsity Resources/Tarun_Sir/Code/DC_Motor/Code/DC_Motor.c"
void main() {
 int status=0;
 TRISB = 0x00;
 TRISD = 0xff;
 PORTB = 0x00;

 while(1){

 if(PORTD.f0 == 1){
 delay_ms(200);
 if(PORTD.f0 == 1){
 status = 1;
 }
 }

 if(portd.f3 == 1){
 delay_ms(200);
 if(PORTD.f3 == 1){
 status = 0;
 }
 }
#line 24 "I:/Varsity Resources/Tarun_Sir/Code/DC_Motor/Code/DC_Motor.c"
 if(portd.f6 == 1){ delay_ms(200);
 if(PORTD.f6 == 1){
 status = 2;
 }
 }


 if (status == 1){
 portb.f0 = 1;
 portb.f1 = 0;
 }
 else if (status == 2){
 portb.f0 = 0;
 portb.f1 = 1;
 }
 else{
 portb.f0 = 0;
 portb.f1 = 0;
 }
 }

}
