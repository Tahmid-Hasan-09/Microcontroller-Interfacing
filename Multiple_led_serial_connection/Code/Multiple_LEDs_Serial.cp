#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Multiple_led_serial_connection/Code/Multiple_LEDs_Serial.c"
void main() {
TRISB = 0x00;
PORTB = 0x00;

while(1){
PORTB.F0 = 0xff;
delay_ms(1000);
portb.f0 = 0x00;
delay_ms(1000);
}

}
