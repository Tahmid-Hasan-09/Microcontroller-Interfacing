
_main:

;Double_PWM.c,1 :: 		void main() {
;Double_PWM.c,3 :: 		TRISB = 0x00; // Set port B as output with 0V
	CLRF       TRISB+0
;Double_PWM.c,4 :: 		TRISC = 0x00; // Set port C as output with 0V
	CLRF       TRISC+0
;Double_PWM.c,6 :: 		PORTB = 0x00; //portb initialize
	CLRF       PORTB+0
;Double_PWM.c,7 :: 		PORTC = 0x00; //portc initialize
	CLRF       PORTC+0
;Double_PWM.c,9 :: 		PWM1_Init(5000); PWM1_Start(); //define PWM for motor 1 (clockwise)(right-side motor)
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	CALL       _PWM1_Start+0
;Double_PWM.c,10 :: 		PWM2_Init(5000); PWM2_Start(); //define PWM for motor 2 (anti-clockwise)(right-side motor)
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
	CALL       _PWM2_Start+0
;Double_PWM.c,12 :: 		PORTB.f0 = 1;//H-bridge for motor 1
	BSF        PORTB+0, 0
;Double_PWM.c,13 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;Double_PWM.c,15 :: 		PORTB.f2 = 1; // H-bridge for motor 2
	BSF        PORTB+0, 2
;Double_PWM.c,16 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;Double_PWM.c,18 :: 		PWM1_Set_Duty(255); //motor 1 with full speed
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Double_PWM.c,19 :: 		PWM2_Set_Duty(255); //motor 2 with full speed
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Double_PWM.c,20 :: 		Delay_ms(5000); //5 sec delay
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;Double_PWM.c,22 :: 		PORTB.f0 = 0; // motor 1 off
	BCF        PORTB+0, 0
;Double_PWM.c,23 :: 		Delay_ms(2000); //2 sec delay
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;Double_PWM.c,25 :: 		PORTB.f0 = 1;
	BSF        PORTB+0, 0
;Double_PWM.c,26 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;Double_PWM.c,27 :: 		PORTB.f2 = 1;
	BSF        PORTB+0, 2
;Double_PWM.c,28 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;Double_PWM.c,30 :: 		PWM1_Set_Duty(127); // motor 1 with half speed
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Double_PWM.c,31 :: 		PWM2_Set_Duty(127); //motor 2 with half speed
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Double_PWM.c,32 :: 		Delay_ms(5000); //5 sec delay
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;Double_PWM.c,34 :: 		PORTB.f0 = 0; // motor 1 off
	BCF        PORTB+0, 0
;Double_PWM.c,35 :: 		Delay_ms(2000); //2 sec delay
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Double_PWM.c,37 :: 		PORTB.f0 = 1;
	BSF        PORTB+0, 0
;Double_PWM.c,38 :: 		PORTB.f1 = 0;
	BCF        PORTB+0, 1
;Double_PWM.c,39 :: 		PORTB.f2 = 1;
	BSF        PORTB+0, 2
;Double_PWM.c,40 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;Double_PWM.c,42 :: 		PWM1_Set_Duty(127); // motor 1 with half speed
	MOVLW      127
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Double_PWM.c,43 :: 		PWM2_Set_Duty(127); //motor 2 with half speed
	MOVLW      127
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Double_PWM.c,44 :: 		Delay_ms(5000); //5 sec delay
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Double_PWM.c,46 :: 		PORTB = 0x00; // motor 1 & 2 stops
	CLRF       PORTB+0
;Double_PWM.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
