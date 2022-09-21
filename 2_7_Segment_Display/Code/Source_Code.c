char array[]={0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
//char array[]={0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
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