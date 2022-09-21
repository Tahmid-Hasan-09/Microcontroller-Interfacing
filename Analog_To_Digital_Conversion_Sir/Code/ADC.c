//create a variable that will hold the ADc value
int valADC;
//create a char array
char x[4];
void main()
{
   //initialize UARt
   UART1_Init(9600);
   //initialize ADC
   ADC_Init();

   //create a loop
   while(1)
   {
     //Read ADC value in RA2
     valADC = ADC_Read(0);
     //convert into string/char array
     IntToStr(valADC,x);
     //Print
     UART1_Write_Text("Analog value = ");
     UART1_Write_Text(x);
     //clear char array
     strcpy(x,"");
     UART1_Write(13);
     Delay_ms(1000);

   }
}