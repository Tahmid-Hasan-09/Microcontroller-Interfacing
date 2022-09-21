/****Code By Tahmid Hasan-170109 *****/
// LCD module connections
 sbit LCD_RS at RB5_bit;
 sbit LCD_EN at RB4_bit;
 sbit LCD_D4 at RB3_bit;
 sbit LCD_D5 at RB2_bit;
 sbit LCD_D6 at RB1_bit;
 sbit LCD_D7 at RB0_bit;
 sbit LCD_RS_Direction at TRISB5_bit;
 sbit LCD_EN_Direction at TRISB4_bit;
 sbit LCD_D4_Direction at TRISB3_bit;
 sbit LCD_D5_Direction at TRISB2_bit;
 sbit LCD_D6_Direction at TRISB1_bit;
 sbit LCD_D7_Direction at TRISB0_bit;
 // End LCD module connections
 char *text,mytext[4];
 unsigned char  a = 0, b = 0,i = 0,t1 = 0,t2 = 0,
               rh1 = 0,rh2 = 0,sum = 0;
 void StartSignal(){
     TRISD.F2 = 0;    //Configure RD2 as output
     PORTD.F2 = 0;    //RD2 sends 0 to the sensor
     delay_ms(18);
     PORTD.F2 = 1;    //RD2 sends 1 to the sensor
     delay_us(30);
     TRISD.F2 = 1;    //Configure RD2 as input
  }
 void CheckResponse(){
     a = 0;
     delay_us(40);
     if (PORTD.F2 == 0){
     delay_us(80);
     if (PORTD.F2 == 1)   a = 1;   delay_us(40);}
 }
 void ReadData(){
     for(b=0;b<8;b++){
       while(!PORTD.F2); //Wait until PORTD.F2 goes HIGH
       delay_us(30);
       if(PORTD.F2 == 0)    i&=~(1<<(7-b));  //Clear bit (7-b)
       else{
            i|= (1<<(7-b));               //Set bit (7-b)
            while(PORTD.F2); //Wait until PORTD.F2 goes LOW
       }
     }
 }
 void main() {
 //Configuration for gas leakage
   trisd.f7 = 1;
   TRISc = 0x00;
   PORTc = 0x00;
  // Configuration for temperature and humidity
   TRISB = 0;        //Configure PORTB as output
   PORTB = 0;        //Initial value of PORTB
   Lcd_Init();
   while(1){
       // gas leakage
       if(PORTD.f7 == 1){
           Portc.f7 = 1;
           delay_ms(100);
           Portc.f7 = 0;
           delay_ms(10);
           Portc.f0 = 1;
       }
       if(PORTD.f7 == 0){
           Portc.f0 = 0;
           Portc.f7 = 0;
       }
       // gas leakage end
       Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
       Lcd_Cmd(_LCD_CLEAR);             // clear LCD
       StartSignal();
       CheckResponse();
       if(a == 1){
          ReadData();
          rh1 =i;
          ReadData();
          rh2 =i;
          ReadData();
          t1 =i;
          ReadData();
          t2 =i;
          ReadData();
          sum = i;
          if(sum == rh1+rh2+t1+t2){
              text = "Temp:  .0C";
              Lcd_Out(1,6,text);
              text = "Humidity:  .0%";
              Lcd_Out(2,2,text);
              ByteToStr(t1,mytext);
              Lcd_Out(1,11,Ltrim(mytext));
              ByteToStr(rh1,mytext);
              Lcd_Out(2,11,Ltrim(mytext));
          }
          else{
            Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
            Lcd_Cmd(_LCD_CLEAR);             // clear LCD
            text = "Check sum error";
            Lcd_Out(1,1,text);}
        }
        else {
            text="No response";
            Lcd_Out(1,3,text);
            text = "from the sensor";
            Lcd_Out(2,1,text);
        }
        delay_ms(200);
   }
  }









