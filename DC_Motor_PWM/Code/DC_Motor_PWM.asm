
_main:

;DC_Motor_PWM.c,2 :: 		void main() {
;DC_Motor_PWM.c,3 :: 		TRISB = 0x00; //Set portB as output
	CLRF       TRISB+0
;DC_Motor_PWM.c,4 :: 		PORTB = 0x00; //PortB initialization
	CLRF       PORTB+0
;DC_Motor_PWM.c,6 :: 		TRISC = 0x00; //Set portC as output
	CLRF       TRISC+0
;DC_Motor_PWM.c,7 :: 		PORTC = 0x00; //Portc initialization
	CLRF       PORTC+0
;DC_Motor_PWM.c,9 :: 		TRISD = 0xff; //Set portD as intput
	MOVLW      255
	MOVWF      TRISD+0
;DC_Motor_PWM.c,10 :: 		PORTD = 0x00; //PortD initialization
	CLRF       PORTD+0
;DC_Motor_PWM.c,12 :: 		PWM1_Init(2000); // Initialize PWM1 module at 5KHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;DC_Motor_PWM.c,13 :: 		duty = 0;
	CLRF       _duty+0
	CLRF       _duty+1
;DC_Motor_PWM.c,15 :: 		PWM1_Start(); // start PWM1
	CALL       _PWM1_Start+0
;DC_Motor_PWM.c,16 :: 		PWM1_Set_Duty(duty); // Set current duty for PWM1
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DC_Motor_PWM.c,18 :: 		while(1){
L_main0:
;DC_Motor_PWM.c,19 :: 		if(PORTD.f0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;DC_Motor_PWM.c,20 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;DC_Motor_PWM.c,21 :: 		if(duty <= 240){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _duty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _duty+0, 0
	SUBLW      240
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;DC_Motor_PWM.c,22 :: 		duty = duty+10;
	MOVLW      10
	ADDWF      _duty+0, 1
	BTFSC      STATUS+0, 0
	INCF       _duty+1, 1
;DC_Motor_PWM.c,23 :: 		}
L_main4:
;DC_Motor_PWM.c,24 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DC_Motor_PWM.c,25 :: 		}
L_main2:
;DC_Motor_PWM.c,27 :: 		if(PORTD.f4 == 1){
	BTFSS      PORTD+0, 4
	GOTO       L_main5
;DC_Motor_PWM.c,28 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;DC_Motor_PWM.c,29 :: 		if(duty >= 10){
	MOVLW      128
	XORWF      _duty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      _duty+0, 0
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;DC_Motor_PWM.c,30 :: 		duty = duty-10;
	MOVLW      10
	SUBWF      _duty+0, 1
	BTFSS      STATUS+0, 0
	DECF       _duty+1, 1
;DC_Motor_PWM.c,31 :: 		}
L_main7:
;DC_Motor_PWM.c,32 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DC_Motor_PWM.c,33 :: 		}
L_main5:
;DC_Motor_PWM.c,34 :: 		PORTB.f0 = 1;
	BSF        PORTB+0, 0
;DC_Motor_PWM.c,35 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;DC_Motor_PWM.c,36 :: 		}
	GOTO       L_main0
;DC_Motor_PWM.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
