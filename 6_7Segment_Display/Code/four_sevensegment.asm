
_main:

;four_sevensegment.c,8 :: 		void main() {
;four_sevensegment.c,9 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;four_sevensegment.c,10 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;four_sevensegment.c,11 :: 		portb = 0x00;
	CLRF       PORTB+0
;four_sevensegment.c,12 :: 		portd = 0x00;
	CLRF       PORTD+0
;four_sevensegment.c,14 :: 		while(1)
L_main0:
;four_sevensegment.c,16 :: 		portd.f0 = 1;
	BSF        PORTD+0, 0
;four_sevensegment.c,17 :: 		portb = firstDigit;
	MOVF       _firstDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,18 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;four_sevensegment.c,19 :: 		portd.f0 = 0;
	BCF        PORTD+0, 0
;four_sevensegment.c,21 :: 		portd.f1 = 1;
	BSF        PORTD+0, 1
;four_sevensegment.c,22 :: 		portb = secondDigit;
	MOVF       _secondDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,23 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;four_sevensegment.c,24 :: 		portd.f1 = 0;
	BCF        PORTD+0, 1
;four_sevensegment.c,26 :: 		portd.f2 = 1;
	BSF        PORTD+0, 2
;four_sevensegment.c,27 :: 		portb = thirdDigit;
	MOVF       _thirdDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,28 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
;four_sevensegment.c,29 :: 		portd.f2 = 0;
	BCF        PORTD+0, 2
;four_sevensegment.c,31 :: 		portd.f3 = 1;
	BSF        PORTD+0, 3
;four_sevensegment.c,32 :: 		portb = fourthDigit;
	MOVF       _fourthDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,33 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;four_sevensegment.c,34 :: 		portd.f3 = 0;
	BCF        PORTD+0, 3
;four_sevensegment.c,36 :: 		portd.f5 = 1;
	BSF        PORTD+0, 5
;four_sevensegment.c,37 :: 		portb = fifthDigit;
	MOVF       _fifthDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,38 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;four_sevensegment.c,39 :: 		portd.f5 = 0;
	BCF        PORTD+0, 5
;four_sevensegment.c,41 :: 		portd.f7 = 1;
	BSF        PORTD+0, 7
;four_sevensegment.c,42 :: 		portb = sixthDigit;
	MOVF       _sixthDigit+0, 0
	MOVWF      PORTB+0
;four_sevensegment.c,43 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;four_sevensegment.c,44 :: 		portd.f7 = 0;
	BCF        PORTD+0, 7
;four_sevensegment.c,45 :: 		}
	GOTO       L_main0
;four_sevensegment.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
