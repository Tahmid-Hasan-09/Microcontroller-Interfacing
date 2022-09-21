
_main:

;seven_seg_four_display.c,7 :: 		void main() {
;seven_seg_four_display.c,8 :: 		int i=0, j=0;
;seven_seg_four_display.c,9 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;seven_seg_four_display.c,10 :: 		portb = 0x00;
	CLRF       PORTB+0
;seven_seg_four_display.c,12 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;seven_seg_four_display.c,13 :: 		portD = 0x00;
	CLRF       PORTD+0
;seven_seg_four_display.c,14 :: 		while(1){
L_main0:
;seven_seg_four_display.c,16 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;seven_seg_four_display.c,17 :: 		portb=firstDigit;
	MOVF       _firstDigit+0, 0
	MOVWF      PORTB+0
;seven_seg_four_display.c,18 :: 		delay_ms(10);
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
;seven_seg_four_display.c,19 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;seven_seg_four_display.c,21 :: 		portd.f3=1;
	BSF        PORTD+0, 3
;seven_seg_four_display.c,22 :: 		portb=secondDigit;
	MOVF       _secondDigit+0, 0
	MOVWF      PORTB+0
;seven_seg_four_display.c,23 :: 		delay_ms(10);
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
;seven_seg_four_display.c,24 :: 		portd.f3=0;
	BCF        PORTD+0, 3
;seven_seg_four_display.c,26 :: 		portd.f5=1;
	BSF        PORTD+0, 5
;seven_seg_four_display.c,27 :: 		portb=thirdDigit;
	MOVF       _thirdDigit+0, 0
	MOVWF      PORTB+0
;seven_seg_four_display.c,28 :: 		delay_ms(10);
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
;seven_seg_four_display.c,29 :: 		portd.f5=0;
	BCF        PORTD+0, 5
;seven_seg_four_display.c,31 :: 		portd.f7=1;
	BSF        PORTD+0, 7
;seven_seg_four_display.c,32 :: 		portb=fourthDigit;
	MOVF       _fourthDigit+0, 0
	MOVWF      PORTB+0
;seven_seg_four_display.c,33 :: 		delay_ms(10);
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
;seven_seg_four_display.c,34 :: 		portd.f7=0;
	BCF        PORTD+0, 7
;seven_seg_four_display.c,36 :: 		}
	GOTO       L_main0
;seven_seg_four_display.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
