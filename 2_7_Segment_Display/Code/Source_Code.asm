
_main:

;Source_Code.c,3 :: 		void main() {
;Source_Code.c,4 :: 		int i=0, j=0, leftDigit, rightDigit;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;Source_Code.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Source_Code.c,6 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Source_Code.c,7 :: 		portb = 0x00;
	CLRF       PORTB+0
;Source_Code.c,8 :: 		portc = 0x00;
	CLRF       PORTC+0
;Source_Code.c,10 :: 		while(1){
L_main0:
;Source_Code.c,11 :: 		for(i=0;i<31;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      31
	SUBWF      main_i_L0+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Source_Code.c,12 :: 		leftDigit = i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_leftDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      main_leftDigit_L0+1
;Source_Code.c,13 :: 		rightDigit = i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_rightDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      main_rightDigit_L0+1
;Source_Code.c,15 :: 		for(j=0;j<20;j++){
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main5:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      20
	SUBWF      main_j_L0+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Source_Code.c,17 :: 		portc.f3=1;
	BSF        PORTC+0, 3
;Source_Code.c,18 :: 		portb=array[leftDigit];
	MOVF       main_leftDigit_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Source_Code.c,19 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;Source_Code.c,20 :: 		portc.f3=0;
	BCF        PORTC+0, 3
;Source_Code.c,22 :: 		portc.f6=1;
	BSF        PORTC+0, 6
;Source_Code.c,23 :: 		portb=array[rightDigit];
	MOVF       main_rightDigit_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Source_Code.c,24 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Source_Code.c,25 :: 		portc.f6=0;
	BCF        PORTC+0, 6
;Source_Code.c,15 :: 		for(j=0;j<20;j++){
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;Source_Code.c,27 :: 		}
	GOTO       L_main5
L_main6:
;Source_Code.c,11 :: 		for(i=0;i<31;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Source_Code.c,29 :: 		}
	GOTO       L_main2
L_main3:
;Source_Code.c,30 :: 		}
	GOTO       L_main0
;Source_Code.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
