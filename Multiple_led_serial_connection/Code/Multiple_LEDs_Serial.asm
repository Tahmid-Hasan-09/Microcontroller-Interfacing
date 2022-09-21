
_main:

;Multiple_LEDs_Serial.c,1 :: 		void main() {
;Multiple_LEDs_Serial.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Multiple_LEDs_Serial.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Multiple_LEDs_Serial.c,5 :: 		while(1){
L_main0:
;Multiple_LEDs_Serial.c,6 :: 		PORTB.F0 = 0xff;
	BSF        PORTB+0, 0
;Multiple_LEDs_Serial.c,7 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Multiple_LEDs_Serial.c,8 :: 		portb.f0 = 0x00;
	BCF        PORTB+0, 0
;Multiple_LEDs_Serial.c,9 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Multiple_LEDs_Serial.c,10 :: 		}
	GOTO       L_main0
;Multiple_LEDs_Serial.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
