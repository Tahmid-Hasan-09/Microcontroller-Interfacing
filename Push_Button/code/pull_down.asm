
_main:

;pull_down.c,1 :: 		void main() {
;pull_down.c,2 :: 		TRISB.F0 = 1;
	BSF        TRISB+0, 0
;pull_down.c,3 :: 		TRISB.F1 = 0;
	BCF        TRISB+0, 1
;pull_down.c,4 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;pull_down.c,5 :: 		while(1)
L_main0:
;pull_down.c,7 :: 		if(PORTB.F0 == 1)
	BTFSS      PORTB+0, 0
	GOTO       L_main2
;pull_down.c,9 :: 		PORTB.F1 = 1;
	BSF        PORTB+0, 1
;pull_down.c,10 :: 		}
	GOTO       L_main3
L_main2:
;pull_down.c,12 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;pull_down.c,13 :: 		}
L_main3:
;pull_down.c,14 :: 		}
	GOTO       L_main0
;pull_down.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
