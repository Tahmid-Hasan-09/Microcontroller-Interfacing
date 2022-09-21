#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Practice/Code/practice.c"
void main(){
 TRISb = 0x00;
 portb = 0x00;

 while(1){

 if (PORTd.F0 == 1){
 PORTb.F0 = 1;
 PORTb.F1 = 1;
 }
 if (PORTd.F0 == 0){
 PORTb.F0 = 0;
 PORTb.F1 = 0;
 }

 }
}
