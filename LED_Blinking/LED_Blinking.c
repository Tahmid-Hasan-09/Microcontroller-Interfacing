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