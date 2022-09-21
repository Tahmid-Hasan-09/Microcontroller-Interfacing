
_main:

;LCD.c,18 :: 		void main() {
;LCD.c,19 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;LCD.c,20 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;LCD.c,22 :: 		lcd_init(); //Initializes Lcd module.
	CALL       _Lcd_Init+0
;LCD.c,23 :: 		lcd_cmd(_lcd_clear); //Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,24 :: 		lcd_cmd(_LCD_CURSOR_OFF); //Turn off Cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,25 :: 		while(1){
L_main0:
;LCD.c,26 :: 		Lcd_Cmd(_LCD_FIRST_ROW); //Move cursor to the 1st row
	MOVLW      128
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,27 :: 		Lcd_Chr(2, 3, 'T');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      84
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,28 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LCD.c,29 :: 		lcd_cmd(_lcd_clear); //Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,30 :: 		Lcd_Out_Cp("Welcome"); //Prints text on Lcd at current cursor position.
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;LCD.c,31 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;LCD.c,32 :: 		Lcd_Out(2, 3, "Tahmid Hasan");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,33 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;LCD.c,34 :: 		}
	GOTO       L_main0
;LCD.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
