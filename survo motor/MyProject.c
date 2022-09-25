void servoRotate0() //0 Degree
{
  unsigned int i;
  for(i=0;i<50;i++)
  {
    PORTB.F2 = 1;
    Delay_us(800);
    PORTB.F2 = 0;
    Delay_us(19200);
  }
}

void servoRotate90() //90 Degree
{
  unsigned int i;
  for(i=0;i<50;i++)
  {
    PORTB.F2 = 1;
    Delay_us(1500);
    PORTB.F2 = 0;
    Delay_us(18500);
  }
}

void servoRotate180() //180 Degree
{
  unsigned int i;
  for(i=0;i<50;i++)
  {
    PORTB.F2 = 1;
    Delay_us(2200);
    PORTB.F2 = 0;
    Delay_us(17800);
  }
}

void main()
{
  TRISB = 0; // PORTB as Ouput Port
  do
  {
    servoRotate0(); //0 Degree
    delay_ms(2000);
    servoRotate90(); //90 Degree
    delay_ms(2000);
    servoRotate180(); //180 Degree
  }while(1);
}