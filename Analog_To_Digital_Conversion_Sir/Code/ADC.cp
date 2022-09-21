#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Analog_To_Digital_Conversion/Code/ADC.c"
unsigned char output[] = "hello";
void main() {
 UART1_Init(4800);
 Delay_ms(100);

 while (1) {
 if (UART1_Data_Ready() == 1) {
 UART1_Read_Text(output, "OK", 10);
 UART1_Write_Text(output);
 }
 }



}
