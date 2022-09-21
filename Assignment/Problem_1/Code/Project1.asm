
_main:

;Project1.c,13 :: 		void main() {
;Project1.c,14 :: 		pin_configuration();
	CALL       _pin_configuration+0
;Project1.c,17 :: 		while(1){
L_main0:
;Project1.c,18 :: 		if(PORTC.f7 == 0){ //Program Mode
	BTFSC      PORTC+0, 7
	GOTO       L_main2
;Project1.c,19 :: 		PORTD.f5 = 0;
	BCF        PORTD+0, 5
;Project1.c,20 :: 		}
L_main2:
;Project1.c,21 :: 		selected_number = display_7segment(); // Display 0-99 in 7seg by push button
	CALL       _display_7segment+0
	MOVF       R0+0, 0
	MOVWF      _selected_number+0
	MOVF       R0+1, 0
	MOVWF      _selected_number+1
;Project1.c,22 :: 		if(PORTC.f7 == 1){  //Run Mode
	BTFSS      PORTC+0, 7
	GOTO       L_main3
;Project1.c,23 :: 		PORTD.f5 = 1;  //1st LED turn On
	BSF        PORTD+0, 5
;Project1.c,24 :: 		if(PORTD.f0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;Project1.c,25 :: 		if(counting_by_sensor<99){
	MOVLW      128
	XORWF      _counting_by_sensor+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      99
	SUBWF      _counting_by_sensor+0, 0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Project1.c,26 :: 		counting_by_sensor++;  //Increment By 1 if less than 99
	INCF       _counting_by_sensor+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counting_by_sensor+1, 1
;Project1.c,27 :: 		}
L_main5:
;Project1.c,28 :: 		if(counting_by_sensor == 99){
	MOVLW      0
	XORWF      _counting_by_sensor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      99
	XORWF      _counting_by_sensor+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Project1.c,29 :: 		counting_by_sensor = 0; // Set 0 if equals 99
	CLRF       _counting_by_sensor+0
	CLRF       _counting_by_sensor+1
;Project1.c,30 :: 		}
L_main6:
;Project1.c,32 :: 		if(selected_number == counting_by_sensor){
	MOVF       _selected_number+1, 0
	XORWF      _counting_by_sensor+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVF       _counting_by_sensor+0, 0
	XORWF      _selected_number+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Project1.c,33 :: 		while(PORTC.f7 == 1 ){
L_main8:
	BTFSS      PORTC+0, 7
	GOTO       L_main9
;Project1.c,34 :: 		PORTD.f5 = 0;
	BCF        PORTD+0, 5
;Project1.c,35 :: 		PORTD.f6 = 1;
	BSF        PORTD+0, 6
;Project1.c,36 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;Project1.c,37 :: 		PORTD.f6 = 0;
	BCF        PORTD+0, 6
;Project1.c,38 :: 		PORTD.f7 = 1;
	BSF        PORTD+0, 7
;Project1.c,39 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Project1.c,40 :: 		PORTD.f7 = 0;
	BCF        PORTD+0, 7
;Project1.c,41 :: 		PORTD.f5 = 1;
	BSF        PORTD+0, 5
;Project1.c,42 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;Project1.c,43 :: 		}
	GOTO       L_main8
L_main9:
;Project1.c,44 :: 		}
L_main7:
;Project1.c,45 :: 		}
L_main4:
;Project1.c,46 :: 		}
L_main3:
;Project1.c,47 :: 		}
	GOTO       L_main0
;Project1.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_pin_configuration:

;Project1.c,51 :: 		void pin_configuration(){
;Project1.c,53 :: 		TRISB = 0x00; //Output Pin
	CLRF       TRISB+0
;Project1.c,54 :: 		PORTB = 0x00; //Initialize PortB
	CLRF       PORTB+0
;Project1.c,57 :: 		TRISC.f2 = 1; //Input-Increment Pin
	BSF        TRISC+0, 2
;Project1.c,58 :: 		TRISC.f3 = 1; //Input-Decrement Pin
	BSF        TRISC+0, 3
;Project1.c,59 :: 		TRISC.f7 = 1;
	BSF        TRISC+0, 7
;Project1.c,60 :: 		TRISC.f0 = 0; //Output Pin
	BCF        TRISC+0, 0
;Project1.c,61 :: 		TRISC.f1 = 0;
	BCF        TRISC+0, 1
;Project1.c,64 :: 		PORTC = 0x00; //Initialize PortC
	CLRF       PORTC+0
;Project1.c,67 :: 		TRISE.f0 = 1; //Input Pin
	BSF        TRISE+0, 0
;Project1.c,68 :: 		PORTE.f0 = 0; //Initialize PortE
	BCF        PORTE+0, 0
;Project1.c,71 :: 		trisd.f0 = 0x11; //Input Pin
	BSF        TRISD+0, 0
;Project1.c,72 :: 		trisd.f5 = 0x00;  //Output Pin
	BCF        TRISD+0, 5
;Project1.c,73 :: 		trisd.f6 = 0x00;  //Output Pin
	BCF        TRISD+0, 6
;Project1.c,74 :: 		trisd.f7 = 0x00;  //Output Pin
	BCF        TRISD+0, 7
;Project1.c,75 :: 		portd = 0x00;  //Initialize PortD
	CLRF       PORTD+0
;Project1.c,76 :: 		}
L_end_pin_configuration:
	RETURN
; end of _pin_configuration

_display_7segment:

;Project1.c,78 :: 		int display_7segment(){
;Project1.c,80 :: 		if(PORTC.F2 == 1){
	BTFSS      PORTC+0, 2
	GOTO       L_display_7segment13
;Project1.c,81 :: 		if(PORTC.F2 == 1){
	BTFSS      PORTC+0, 2
	GOTO       L_display_7segment14
;Project1.c,82 :: 		if(i<99){
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_7segment30
	MOVLW      99
	SUBWF      _i+0, 0
L__display_7segment30:
	BTFSC      STATUS+0, 0
	GOTO       L_display_7segment15
;Project1.c,83 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Project1.c,84 :: 		}
L_display_7segment15:
;Project1.c,85 :: 		}
L_display_7segment14:
;Project1.c,86 :: 		}
L_display_7segment13:
;Project1.c,87 :: 		if(PORTC.F3 == 1){
	BTFSS      PORTC+0, 3
	GOTO       L_display_7segment16
;Project1.c,88 :: 		if(PORTC.F3 == 1){
	BTFSS      PORTC+0, 3
	GOTO       L_display_7segment17
;Project1.c,89 :: 		if(i>0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_7segment31
	MOVF       _i+0, 0
	SUBLW      0
L__display_7segment31:
	BTFSC      STATUS+0, 0
	GOTO       L_display_7segment18
;Project1.c,90 :: 		i--;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;Project1.c,91 :: 		}
L_display_7segment18:
;Project1.c,92 :: 		}
L_display_7segment17:
;Project1.c,93 :: 		}
L_display_7segment16:
;Project1.c,94 :: 		leftDigit = i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      display_7segment_leftDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      display_7segment_leftDigit_L0+1
;Project1.c,95 :: 		rightDigit = i% 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      display_7segment_rightDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      display_7segment_rightDigit_L0+1
;Project1.c,96 :: 		for(j=0;j<10;j++){
	CLRF       _j+0
	CLRF       _j+1
L_display_7segment19:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_7segment32
	MOVLW      10
	SUBWF      _j+0, 0
L__display_7segment32:
	BTFSC      STATUS+0, 0
	GOTO       L_display_7segment20
;Project1.c,97 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Project1.c,98 :: 		portb=segments[leftDigit];
	MOVF       display_7segment_leftDigit_L0+0, 0
	ADDLW      _segments+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Project1.c,99 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_display_7segment22:
	DECFSZ     R13+0, 1
	GOTO       L_display_7segment22
	DECFSZ     R12+0, 1
	GOTO       L_display_7segment22
	NOP
;Project1.c,100 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Project1.c,102 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Project1.c,103 :: 		portb=segments[rightDigit];
	MOVF       display_7segment_rightDigit_L0+0, 0
	ADDLW      _segments+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Project1.c,104 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_display_7segment23:
	DECFSZ     R13+0, 1
	GOTO       L_display_7segment23
	DECFSZ     R12+0, 1
	GOTO       L_display_7segment23
	NOP
;Project1.c,105 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Project1.c,96 :: 		for(j=0;j<10;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;Project1.c,106 :: 		}
	GOTO       L_display_7segment19
L_display_7segment20:
;Project1.c,107 :: 		return i;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
;Project1.c,108 :: 		}
L_end_display_7segment:
	RETURN
; end of _display_7segment
