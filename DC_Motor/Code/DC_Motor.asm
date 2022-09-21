
_main:

;DC_Motor.c,1 :: 		void main() {
;DC_Motor.c,2 :: 		int status=0;
	CLRF       main_status_L0+0
	CLRF       main_status_L0+1
;DC_Motor.c,3 :: 		TRISB = 0x00; //Set portb as output
	CLRF       TRISB+0
;DC_Motor.c,4 :: 		TRISD = 0xff;  //set portd as input
	MOVLW      255
	MOVWF      TRISD+0
;DC_Motor.c,5 :: 		PORTB = 0x00;  //portb initialization
	CLRF       PORTB+0
;DC_Motor.c,7 :: 		while(1){
L_main0:
;DC_Motor.c,9 :: 		if(PORTD.f0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;DC_Motor.c,10 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;DC_Motor.c,11 :: 		if(PORTD.f0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;DC_Motor.c,12 :: 		status = 1;
	MOVLW      1
	MOVWF      main_status_L0+0
	MOVLW      0
	MOVWF      main_status_L0+1
;DC_Motor.c,13 :: 		}
L_main4:
;DC_Motor.c,14 :: 		}
L_main2:
;DC_Motor.c,16 :: 		if(portd.f3 == 1){
	BTFSS      PORTD+0, 3
	GOTO       L_main5
;DC_Motor.c,17 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;DC_Motor.c,18 :: 		if(PORTD.f3 == 1){
	BTFSS      PORTD+0, 3
	GOTO       L_main7
;DC_Motor.c,19 :: 		status = 0;
	CLRF       main_status_L0+0
	CLRF       main_status_L0+1
;DC_Motor.c,20 :: 		}
L_main7:
;DC_Motor.c,21 :: 		}
L_main5:
;DC_Motor.c,24 :: 		delay_ms(200);
	BTFSS      PORTD+0, 6
	GOTO       L_main8
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;DC_Motor.c,25 :: 		if(PORTD.f6 == 1){
	BTFSS      PORTD+0, 6
	GOTO       L_main10
;DC_Motor.c,26 :: 		status = 2;
	MOVLW      2
	MOVWF      main_status_L0+0
	MOVLW      0
	MOVWF      main_status_L0+1
;DC_Motor.c,27 :: 		}
L_main10:
;DC_Motor.c,28 :: 		}
L_main8:
;DC_Motor.c,31 :: 		if (status == 1){
	MOVLW      0
	XORWF      main_status_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      1
	XORWF      main_status_L0+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;DC_Motor.c,32 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;DC_Motor.c,33 :: 		portb.f1 = 0;
	BCF        PORTB+0, 1
;DC_Motor.c,34 :: 		}
	GOTO       L_main12
L_main11:
;DC_Motor.c,35 :: 		else if (status == 2){
	MOVLW      0
	XORWF      main_status_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      2
	XORWF      main_status_L0+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;DC_Motor.c,36 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;DC_Motor.c,37 :: 		portb.f1 = 1;
	BSF        PORTB+0, 1
;DC_Motor.c,38 :: 		}
	GOTO       L_main14
L_main13:
;DC_Motor.c,40 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;DC_Motor.c,41 :: 		portb.f1 = 0;
	BCF        PORTB+0, 1
;DC_Motor.c,42 :: 		}
L_main14:
L_main12:
;DC_Motor.c,43 :: 		}
	GOTO       L_main0
;DC_Motor.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
