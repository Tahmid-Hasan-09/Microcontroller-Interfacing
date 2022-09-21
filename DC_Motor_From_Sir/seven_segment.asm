
_main:

;seven_segment.c,1 :: 		void main() {
;seven_segment.c,2 :: 		int status=0;
	CLRF       main_status_L0+0
	CLRF       main_status_L0+1
;seven_segment.c,3 :: 		TRISC = 0x00;   //Set portc as output
	CLRF       TRISC+0
;seven_segment.c,4 :: 		PORTC = 0x00;   //Portc initialization
	CLRF       PORTC+0
;seven_segment.c,6 :: 		TRISD = 0xff;   //Set portb as input
	MOVLW      255
	MOVWF      TRISD+0
;seven_segment.c,7 :: 		while(1)
L_main0:
;seven_segment.c,10 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;seven_segment.c,12 :: 		delay_ms(200);
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
;seven_segment.c,13 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;seven_segment.c,15 :: 		status=1;
	MOVLW      1
	MOVWF      main_status_L0+0
	MOVLW      0
	MOVWF      main_status_L0+1
;seven_segment.c,16 :: 		}
L_main4:
;seven_segment.c,17 :: 		}
L_main2:
;seven_segment.c,19 :: 		if(portd.f4==1)
	BTFSS      PORTD+0, 4
	GOTO       L_main5
;seven_segment.c,21 :: 		delay_ms(200);
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
;seven_segment.c,22 :: 		if(portd.f4==1)
	BTFSS      PORTD+0, 4
	GOTO       L_main7
;seven_segment.c,24 :: 		status=0;
	CLRF       main_status_L0+0
	CLRF       main_status_L0+1
;seven_segment.c,25 :: 		}
L_main7:
;seven_segment.c,26 :: 		}
L_main5:
;seven_segment.c,28 :: 		if(portd.f7==1)
	BTFSS      PORTD+0, 7
	GOTO       L_main8
;seven_segment.c,30 :: 		delay_ms(200);
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
;seven_segment.c,31 :: 		if(portd.f7==1)
	BTFSS      PORTD+0, 7
	GOTO       L_main10
;seven_segment.c,33 :: 		status=2;
	MOVLW      2
	MOVWF      main_status_L0+0
	MOVLW      0
	MOVWF      main_status_L0+1
;seven_segment.c,34 :: 		}
L_main10:
;seven_segment.c,35 :: 		}
L_main8:
;seven_segment.c,36 :: 		if(status==1)
	MOVLW      0
	XORWF      main_status_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      1
	XORWF      main_status_L0+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;seven_segment.c,38 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;seven_segment.c,39 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;seven_segment.c,40 :: 		}
	GOTO       L_main12
L_main11:
;seven_segment.c,41 :: 		else if(status==2)
	MOVLW      0
	XORWF      main_status_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      2
	XORWF      main_status_L0+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;seven_segment.c,43 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;seven_segment.c,44 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;seven_segment.c,45 :: 		}
	GOTO       L_main14
L_main13:
;seven_segment.c,48 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;seven_segment.c,49 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;seven_segment.c,50 :: 		}
L_main14:
L_main12:
;seven_segment.c,51 :: 		}
	GOTO       L_main0
;seven_segment.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
