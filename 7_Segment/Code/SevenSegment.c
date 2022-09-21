void main() {
  unsigned int segment[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7C,0x07,0x7F,0x6F};
  int i;
  TRISC = 0x00;
  PORTC = 0x00;
  
  while(1){
   for(i=0;i<10;i++){
    PORTC = segment[i];
    Delay_ms(1000);
   }
  }
}