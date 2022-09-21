void main() {

    TRISB = 0x00; // Set port B as output with 0V
    TRISC = 0x00; // Set port C as output with 0V

    PORTB = 0x00; //portb initialize
    PORTC = 0x00; //portc initialize

    PWM1_Init(5000); PWM1_Start(); //define PWM for motor 1 (clockwise)(right-side motor)
    PWM2_Init(5000); PWM2_Start(); //define PWM for motor 2 (anti-clockwise)(right-side motor)

    PORTB.f0 = 1;//H-bridge for motor 1
    PORTB.f1 = 0;

    PORTB.f2 = 1; // H-bridge for motor 2
    PORTB.f3 = 0;

    PWM1_Set_Duty(255); //motor 1 with full speed
    PWM2_Set_Duty(255); //motor 2 with full speed
    Delay_ms(5000); //5 sec delay

    PORTB.f0 = 0; // motor 1 off
    Delay_ms(2000); //2 sec delay

    PORTB.f0 = 1;
    PORTB.f1 = 0;
    PORTB.f2 = 1;
    PORTB.f3 = 0;

    PWM1_Set_Duty(127); // motor 1 with half speed
    PWM2_Set_Duty(127); //motor 2 with half speed
    Delay_ms(5000); //5 sec delay

    PORTB.f0 = 0; // motor 1 off
    Delay_ms(2000); //2 sec delay

    PORTB.f0 = 1;
    PORTB.f1 = 0;
    PORTB.f2 = 1;
    PORTB.f3 = 0;

    PWM1_Set_Duty(127); // motor 1 with half speed
    PWM2_Set_Duty(127); //motor 2 with half speed
    Delay_ms(5000); //5 sec delay

    PORTB = 0x00; // motor 1 & 2 stops
}