#line 1 "I:/Varsity Resources/Tarun_Sir/Code/DC_Motor_PWM/Code/DC_Motor_PWM.c"
int duty;
void main() {
 TRISB = 0x00;
 PORTB = 0x00;

 TRISC = 0x00;
 PORTC = 0x00;

 TRISD = 0xff;
 PORTD = 0x00;

 PWM1_Init(2000);
 duty = 0;

 PWM1_Start();
 PWM1_Set_Duty(duty);

 while(1){
 if(PORTD.f0 == 1){
 Delay_ms(100);
 if(duty <= 240){
 duty = duty+10;
 }
 PWM1_Set_Duty(duty);
 }

 if(PORTD.f4 == 1){
 Delay_ms(100);
 if(duty >= 10){
 duty = duty-10;
 }
 PWM1_Set_Duty(duty);
 }
 PORTB.f0 = 1;
 PORTB.f1 = 0;
 }
}
