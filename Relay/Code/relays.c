void main() {
  TRISB.f0 = 1;
  TRISB.f1 = 0;
  
  PORTB.f0 = 0;
  PORTB.f1 = 0;
  
  while(1){
    if(PORTB.f0 == 1){
      PORTB.f1 = 1;
    }else{
      PORTB.f1 = 0;
    }
  }
}