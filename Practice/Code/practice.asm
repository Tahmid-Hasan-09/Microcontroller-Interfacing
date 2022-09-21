
_main:

;practice.c,1 :: 		void main(){
;practice.c,2 :: 		TRISb = 0x00;
	CLRF       TRISB+0
;practice.c,3 :: 		portb = 0x00;
	CLRF       PORTB+0
;practice.c,5 :: 		while(1){
L_main0:
;practice.c,7 :: 		if (PORTd.F0 == 1){
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;practice.c,8 :: 		PORTb.F0 = 1;
	BSF        PORTB+0, 0
;practice.c,9 :: 		PORTb.F1 = 1;
	BSF        PORTB+0, 1
;practice.c,10 :: 		}
L_main2:
;practice.c,11 :: 		if (PORTd.F0 == 0){
	BTFSC      PORTD+0, 0
	GOTO       L_main3
;practice.c,12 :: 		PORTb.F0 = 0;
	BCF        PORTB+0, 0
;practice.c,13 :: 		PORTb.F1 = 0;
	BCF        PORTB+0, 1
;practice.c,14 :: 		}
L_main3:
;practice.c,16 :: 		}
	GOTO       L_main0
;practice.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
