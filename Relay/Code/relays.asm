
_main:

;relays.c,1 :: 		void main() {
;relays.c,2 :: 		TRISB.f0 = 1;
	BSF        TRISB+0, 0
;relays.c,3 :: 		TRISB.f1 = 0;
	BCF        TRISB+0, 1
;relays.c,5 :: 		PORTB.f0 = 0;
	BCF        PORTB+0, 0
;relays.c,6 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;relays.c,8 :: 		while(1){
L_main0:
;relays.c,9 :: 		if(PORTB.f0 == 1){
	BTFSS      PORTB+0, 0
	GOTO       L_main2
;relays.c,10 :: 		PORTB.f1 = 1;
	BSF        PORTB+0, 1
;relays.c,11 :: 		}else{
	GOTO       L_main3
L_main2:
;relays.c,12 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;relays.c,13 :: 		}
L_main3:
;relays.c,14 :: 		}
	GOTO       L_main0
;relays.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
