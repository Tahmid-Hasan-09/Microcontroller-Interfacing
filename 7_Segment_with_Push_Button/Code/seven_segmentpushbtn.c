void main() {
    char segment[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7C,0x07,0x7F,0x6F};
    int i = 0;
    TRISD = 0xff;
    TRISB = 0x00;
    PORTB = 0x00;
    PORTD = 0x00;

    while(1){
       if(PORTD.F0 == 1){
          delay_ms(200);
          if(PORTD.F0 == 1){
              if(i<9){
               i++;
              }
          }
       }
       if(PORTD.F1 == 1){
           delay_ms(200);
           if(PORTD.F1 == 1){
               if(i>0){
                i--;
               }
           }
       }
       PORTB = segment[i];
    }

}