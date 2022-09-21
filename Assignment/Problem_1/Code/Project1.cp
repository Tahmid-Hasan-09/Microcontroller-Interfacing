#line 1 "I:/Varsity Resources/Tarun_Sir/Code/Assignment/Problem_1/Code/Project1.c"


int display_7segment();
void pin_configuration();



char segments[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int i = 0,j=0;
int selected_number;
int counting_by_sensor = 0;

void main() {
 pin_configuration();


 while(1){
 if(PORTC.f7 == 0){
 PORTD.f5 = 0;
 }
 selected_number = display_7segment();
 if(PORTC.f7 == 1){
 PORTD.f5 = 1;
 if(PORTD.f0 == 1){
 if(counting_by_sensor<99){
 counting_by_sensor++;
 }
 if(counting_by_sensor == 99){
 counting_by_sensor = 0;
 }

 if(selected_number == counting_by_sensor){
 while(PORTC.f7 == 1 ){
 PORTD.f5 = 0;
 PORTD.f6 = 1;
 Delay_ms(1000);
 PORTD.f6 = 0;
 PORTD.f7 = 1;
 Delay_ms(1000);
 PORTD.f7 = 0;
 PORTD.f5 = 1;
 Delay_ms(1000);
 }
 }
 }
 }
 }
}


void pin_configuration(){

 TRISB = 0x00;
 PORTB = 0x00;


 TRISC.f2 = 1;
 TRISC.f3 = 1;
 TRISC.f7 = 1;
 TRISC.f0 = 0;
 TRISC.f1 = 0;


 PORTC = 0x00;


 TRISE.f0 = 1;
 PORTE.f0 = 0;


 trisd.f0 = 0x11;
 trisd.f5 = 0x00;
 trisd.f6 = 0x00;
 trisd.f7 = 0x00;
 portd = 0x00;
}

int display_7segment(){
 int leftDigit,rightDigit;
 if(PORTC.F2 == 1){
 if(PORTC.F2 == 1){
 if(i<99){
 i++;
 }
 }
 }
 if(PORTC.F3 == 1){
 if(PORTC.F3 == 1){
 if(i>0){
 i--;
 }
 }
 }
 leftDigit = i/10;
 rightDigit = i% 10;
 for(j=0;j<10;j++){
 portc.f0=1;
 portb=segments[leftDigit];
 delay_ms(10);
 portc.f0=0;

 portc.f1=1;
 portb=segments[rightDigit];
 delay_ms(10);
 portc.f1=0;
 }
 return i;
}
