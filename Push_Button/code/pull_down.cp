#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Push_Button/code/pull_down.c"
void main() {
 TRISB.F0 = 1;
 TRISB.F1 = 0;
 PORTB = 0x00;
 while(1)
 {
 if(PORTB.F0 == 1)
 {
 PORTB.F1 = 1;
 }
 else{
 PORTB.F1 = 0;
 }
 }
}
