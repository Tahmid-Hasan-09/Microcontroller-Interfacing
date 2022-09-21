/*** Code By Tahmid Hasan - 170109 ***/
/*** In This program We can only select in both program mode and run mode  ***/
//Declare functions
int display_7segment();
void pin_configuration();


//Variables & Arrays
char segments[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int i = 0,j=0;
int selected_number;
int counting_by_sensor = 0;

void main() {
   pin_configuration();

  //Implementation Start Here
  while(1){
     if(PORTC.f7 == 0){ //Program Mode
        PORTD.f5 = 0;
     }
     selected_number = display_7segment(); // Display 0-99 in 7seg by push button
     if(PORTC.f7 == 1){  //Run Mode
          PORTD.f5 = 1;  //1st LED turn On
          if(PORTD.f0 == 1){
             if(counting_by_sensor<99){
                counting_by_sensor++;  //Increment By 1 if less than 99
             }
             if(counting_by_sensor == 99){
                counting_by_sensor = 0; // Set 0 if equals 99
             }
            //Comaprison between selected number & counting by sensor
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
   //Port B Configuration
    TRISB = 0x00; //Output Pin
    PORTB = 0x00; //Initialize PortB

    //Port C Configuration
    TRISC.f2 = 1; //Input-Increment Pin
    TRISC.f3 = 1; //Input-Decrement Pin
    TRISC.f7 = 1;
    TRISC.f0 = 0; //Output Pin
    TRISC.f1 = 0;


    PORTC = 0x00; //Initialize PortC

    //Port E Configuration
    TRISE.f0 = 1; //Input Pin
    PORTE.f0 = 0; //Initialize PortE

    //Port D Configuration
    trisd.f0 = 0x11; //Input Pin
    trisd.f5 = 0x00;  //Output Pin
    trisd.f6 = 0x00;  //Output Pin
    trisd.f7 = 0x00;  //Output Pin
    portd = 0x00;  //Initialize PortD
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



/*** In This program We can select in both program mode and run mode  ***/
/***
//Declare functions
int display_7segment();
void pin_configuration();


//Variables & Arrays
char segments[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int i = 0,j=0;
int selected_number;
int counting_by_sensor = 0;

void main() {
   pin_configuration();

  //Implementation Start Here
  while(1){
     if(PORTC.f7 == 0){ //Program Mode
        PORTD.f5 = 0;
        selected_number = display_7segment(); // Display 0-99 in 7seg by push button
     }
     if(PORTC.f7 == 1){  //Run Mode
          PORTD.f5 = 1;  //1st LED turn On
          selected_number = display_7segment(); // Display 0-99 in 7seg by push button
          if(PORTD.f0 == 1){
             if(counting_by_sensor<99){
                counting_by_sensor++;  //Increment By 1 if less than 99
             }
             if(counting_by_sensor == 99){
                counting_by_sensor = 0; // Set 0 if equals 99
             }
            //Comaprison between selected number & counting by sensor
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
   //Port B Configuration
    TRISB = 0x00; //Output Pin
    PORTB = 0x00; //Initialize PortB

    //Port C Configuration
    TRISC.f2 = 1; //Input-Increment Pin
    TRISC.f3 = 1; //Input-Decrement Pin
    TRISC.f7 = 1;
    TRISC.f0 = 0; //Output Pin
    TRISC.f1 = 0;


    PORTC = 0x00; //Initialize PortC

    //Port E Configuration
    TRISE.f0 = 1; //Input Pin
    PORTE.f0 = 0; //Initialize PortE

    //Port D Configuration
    trisd.f0 = 0x11; //Input Pin
    trisd.f5 = 0x00;  //Output Pin
    trisd.f6 = 0x00;  //Output Pin
    trisd.f7 = 0x00;  //Output Pin
    portd = 0x00;  //Initialize PortD
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

***/
