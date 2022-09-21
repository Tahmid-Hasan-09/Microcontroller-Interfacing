#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Double_DC_Motor_PWM/Code/Double_PWM.c"
void main() {

 TRISB = 0x00;
 TRISC = 0x00;

 PORTB = 0x00;
 PORTC = 0x00;

 PWM1_Init(5000); PWM1_Start();
 PWM2_Init(5000); PWM2_Start();

 PORTB.f0 = 1;
 PORTB.f1 = 0;

 PORTB.f2 = 1;
 PORTB.f3 = 0;

 PWM1_Set_Duty(255);
 PWM2_Set_Duty(255);
 Delay_ms(5000);

 PORTB.f0 = 0;
 Delay_ms(2000);

 PORTB.f0 = 1;
 PORTB.f1 = 0;
 PORTB.f2 = 1;
 PORTB.f3 = 0;

 PWM1_Set_Duty(127);
 PWM2_Set_Duty(127);
 Delay_ms(5000);

 PORTB.f0 = 0;
 Delay_ms(2000);

 PORTB.f0 = 1;
 PORTB.f1 = 0;
 PORTB.f2 = 1;
 PORTB.f3 = 0;

 PWM1_Set_Duty(127);
 PWM2_Set_Duty(127);
 Delay_ms(5000);

 PORTB = 0x00;
}
