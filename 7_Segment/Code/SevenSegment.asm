
_main:

;SevenSegment.c,1 :: 		void main() {
;SevenSegment.c,2 :: 		unsigned int segment[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7C,0x07,0x7F,0x6F};
	MOVLW      63
	MOVWF      main_segment_L0+0
	MOVLW      0
	MOVWF      main_segment_L0+1
	MOVLW      6
	MOVWF      main_segment_L0+2
	MOVLW      0
	MOVWF      main_segment_L0+3
	MOVLW      91
	MOVWF      main_segment_L0+4
	MOVLW      0
	MOVWF      main_segment_L0+5
	MOVLW      79
	MOVWF      main_segment_L0+6
	MOVLW      0
	MOVWF      main_segment_L0+7
	MOVLW      102
	MOVWF      main_segment_L0+8
	MOVLW      0
	MOVWF      main_segment_L0+9
	MOVLW      109
	MOVWF      main_segment_L0+10
	MOVLW      0
	MOVWF      main_segment_L0+11
	MOVLW      124
	MOVWF      main_segment_L0+12
	MOVLW      0
	MOVWF      main_segment_L0+13
	MOVLW      7
	MOVWF      main_segment_L0+14
	MOVLW      0
	MOVWF      main_segment_L0+15
	MOVLW      127
	MOVWF      main_segment_L0+16
	MOVLW      0
	MOVWF      main_segment_L0+17
	MOVLW      111
	MOVWF      main_segment_L0+18
	MOVLW      0
	MOVWF      main_segment_L0+19
;SevenSegment.c,4 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;SevenSegment.c,5 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;SevenSegment.c,7 :: 		while(1){
L_main0:
;SevenSegment.c,8 :: 		for(i=0;i<10;i++){
	CLRF       R3+0
	CLRF       R3+1
L_main2:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      R3+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;SevenSegment.c,9 :: 		PORTC = segment[i];
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_segment_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;SevenSegment.c,10 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;SevenSegment.c,8 :: 		for(i=0;i<10;i++){
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;SevenSegment.c,11 :: 		}
	GOTO       L_main2
L_main3:
;SevenSegment.c,12 :: 		}
	GOTO       L_main0
;SevenSegment.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
