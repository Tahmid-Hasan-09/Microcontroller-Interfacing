void main() {
    TRISB = 0;
    PORTB = 0;
    
    while(1){
    PORTB = 0x01;
    Delay_ms(1000);
    PORTB = 0x02;
    Delay_ms(1000);
    PORTB = 0x04;
    Delay_ms(1000);
    PORTB = 0x08;
    Delay_ms(1000);
    PORTB = 0x10;
    Delay_ms(1000);
    PORTB = 0x20;
    Delay_ms(1000);
    PORTB = 0x40;
    Delay_ms(1000);
    PORTB = 0x80;
    Delay_ms(1000);
    PORTB = 0xFF;
    Delay_ms(2000);
    PORTB = 0x00;
    Delay_ms(2000);
 }
}