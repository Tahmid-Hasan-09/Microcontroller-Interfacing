
_main:

;seven_segmentpushbtn.c,1 :: 		void main() {
;seven_segmentpushbtn.c,2 :: 		char segment[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7C,0x07,0x7F,0x6F};
	MOVLW      63
	MOVWF      main_segment_L0+0
	MOVLW      6
	MOVWF      main_segment_L0+1
	MOVLW      91
	MOVWF      main_segment_L0+2
	MOVLW      79
	MOVWF      main_segment_L0+3
	MOVLW      102
	MOVWF      main_segment_L0+4
	MOVLW      109
	MOVWF      main_segment_L0+5
	MOVLW      124
	MOVWF      main_segment_L0+6
	MOVLW      7
	MOVWF      main_segment_L0+7
	MOVLW      127
	MOVWF      main_segment_L0+8
	MOVLW      111
	MOVWF      main_segment_L0+9
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;seven_segmentpushbtn.c,4 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;seven_segmentpushbtn.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;seven_segmentpushbtn.c,6 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;seven_segmentpushbtn.c,7 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;seven_segmentpushbtn.c,9 :: 		while(1){
L_main0:
;seven_segmentpushbtn.c,10 :: 		if(PORTD.F0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;seven_segmentpushbtn.c,11 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;seven_segmentpushbtn.c,12 :: 		if(PORTD.F0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;seven_segmentpushbtn.c,13 :: 		if(i<9){
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      9
	SUBWF      main_i_L0+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;seven_segmentpushbtn.c,14 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;seven_segmentpushbtn.c,15 :: 		}
L_main5:
;seven_segmentpushbtn.c,16 :: 		}
L_main4:
;seven_segmentpushbtn.c,17 :: 		}
L_main2:
;seven_segmentpushbtn.c,18 :: 		if(PORTD.F1 == 1){
	BTFSS      PORTD+0, 1
	GOTO       L_main6
;seven_segmentpushbtn.c,19 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;seven_segmentpushbtn.c,20 :: 		if(PORTD.F1 == 1){
	BTFSS      PORTD+0, 1
	GOTO       L_main8
;seven_segmentpushbtn.c,21 :: 		if(i>0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;seven_segmentpushbtn.c,22 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;seven_segmentpushbtn.c,23 :: 		}
L_main9:
;seven_segmentpushbtn.c,24 :: 		}
L_main8:
;seven_segmentpushbtn.c,25 :: 		}
L_main6:
;seven_segmentpushbtn.c,26 :: 		PORTB = segment[i];
	MOVF       main_i_L0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segmentpushbtn.c,27 :: 		}
	GOTO       L_main0
;seven_segmentpushbtn.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
