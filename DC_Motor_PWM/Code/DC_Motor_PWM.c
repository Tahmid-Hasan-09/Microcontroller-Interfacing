int duty;
void main() {
   TRISB = 0x00; //Set portB as output
   PORTB = 0x00; //PortB initialization

   TRISC = 0x00; //Set portC as output
   PORTC = 0x00; //Portc initialization

   TRISD = 0xff; //Set portD as intput
   PORTD = 0x00; //PortD initialization

   PWM1_Init(2000); // Initialize PWM1 module at 5KHz
   duty = 0;

   PWM1_Start(); // start PWM1
   PWM1_Set_Duty(duty); // Set current duty for PWM1

   while(1){
      if(PORTD.f0 == 1){
        Delay_ms(100);
        if(duty <= 240){
           duty = duty+10;
        }
        PWM1_Set_Duty(duty); // Set current duty for PWM1
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

/*
 portb.f0=0;
 portb.f1=1;
 delay_ms(5000);
 portb.f0=1;
 portb.f1=0;
 delay_ms(5000);
*/