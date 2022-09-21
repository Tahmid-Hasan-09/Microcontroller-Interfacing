void main() {
   int status=0;
   TRISB = 0x00; //Set portb as output
   TRISD = 0xff;  //set portd as input
   PORTB = 0x00;  //portb initialization

   while(1){
     //Forward Button
      if(PORTD.f0 == 1){
       delay_ms(200);
         if(PORTD.f0 == 1){
           status = 1;
         }
      }
      //Stop Buttopn
      if(portd.f3 == 1){
       delay_ms(200);
       if(PORTD.f3 == 1){
           status = 0;
         }
      }
      //Reverse Button
      if(portd.f6 == 1){\
       delay_ms(200);
       if(PORTD.f6 == 1){
           status = 2;
         }
      }

      //Mototr moving as status direction
      if (status == 1){
       portb.f0 = 1;
       portb.f1 = 0;
      }
      else if (status == 2){
       portb.f0 = 0;
       portb.f1 = 1;
      }
      else{
       portb.f0 = 0;
       portb.f1 = 0;
      }
   }

}
