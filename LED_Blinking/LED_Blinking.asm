
_main:

;LED_Blinking.c,1 :: 		void main() {
;LED_Blinking.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;LED_Blinking.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;LED_Blinking.c,5 :: 		while(1){
L_main0:
;LED_Blinking.c,6 :: 		PORTB.F0 = 0xff;
	BSF        PORTB+0, 0
;LED_Blinking.c,7 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LED_Blinking.c,8 :: 		PORTB.F0 = 0x00;
	BCF        PORTB+0, 0
;LED_Blinking.c,9 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;LED_Blinking.c,10 :: 		}
	GOTO       L_main0
;LED_Blinking.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
