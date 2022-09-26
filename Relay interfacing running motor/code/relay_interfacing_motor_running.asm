
_main:

;relay_interfacing_motor_running.c,2 :: 		void main() {
;relay_interfacing_motor_running.c,4 :: 		TRISC=0x00;
	CLRF       TRISC+0
;relay_interfacing_motor_running.c,5 :: 		PORTC=0x00;
	CLRF       PORTC+0
;relay_interfacing_motor_running.c,7 :: 		while(1){
L_main0:
;relay_interfacing_motor_running.c,9 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;relay_interfacing_motor_running.c,10 :: 		delay_ms(8000);
	MOVLW      82
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      0
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;relay_interfacing_motor_running.c,11 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;relay_interfacing_motor_running.c,12 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;relay_interfacing_motor_running.c,14 :: 		}
	GOTO       L_main0
;relay_interfacing_motor_running.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
