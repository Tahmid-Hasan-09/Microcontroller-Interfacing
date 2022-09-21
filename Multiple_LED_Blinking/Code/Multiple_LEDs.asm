
_main:

;Multiple_LEDs.c,1 :: 		void main() {
;Multiple_LEDs.c,2 :: 		TRISB = 0;
	CLRF       TRISB+0
;Multiple_LEDs.c,3 :: 		PORTB = 0;
	CLRF       PORTB+0
;Multiple_LEDs.c,5 :: 		while(1){
L_main0:
;Multiple_LEDs.c,6 :: 		PORTB = 0x01;
	MOVLW      1
	MOVWF      PORTB+0
;Multiple_LEDs.c,7 :: 		Delay_ms(1000);
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
;Multiple_LEDs.c,8 :: 		PORTB = 0x02;
	MOVLW      2
	MOVWF      PORTB+0
;Multiple_LEDs.c,9 :: 		Delay_ms(1000);
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
;Multiple_LEDs.c,10 :: 		PORTB = 0x04;
	MOVLW      4
	MOVWF      PORTB+0
;Multiple_LEDs.c,11 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;Multiple_LEDs.c,12 :: 		PORTB = 0x08;
	MOVLW      8
	MOVWF      PORTB+0
;Multiple_LEDs.c,13 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Multiple_LEDs.c,14 :: 		PORTB = 0x10;
	MOVLW      16
	MOVWF      PORTB+0
;Multiple_LEDs.c,15 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Multiple_LEDs.c,16 :: 		PORTB = 0x20;
	MOVLW      32
	MOVWF      PORTB+0
;Multiple_LEDs.c,17 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;Multiple_LEDs.c,18 :: 		PORTB = 0x40;
	MOVLW      64
	MOVWF      PORTB+0
;Multiple_LEDs.c,19 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;Multiple_LEDs.c,20 :: 		PORTB = 0x80;
	MOVLW      128
	MOVWF      PORTB+0
;Multiple_LEDs.c,21 :: 		Delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;Multiple_LEDs.c,22 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;Multiple_LEDs.c,23 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;Multiple_LEDs.c,24 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Multiple_LEDs.c,25 :: 		Delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;Multiple_LEDs.c,26 :: 		}
	GOTO       L_main0
;Multiple_LEDs.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
