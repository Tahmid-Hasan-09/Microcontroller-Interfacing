
_main:

;LCD_Manual_Command.c,8 :: 		void main() {
;LCD_Manual_Command.c,9 :: 		TRISB = 0;
	CLRF       TRISB+0
;LCD_Manual_Command.c,10 :: 		TRISC = 0;
	CLRF       TRISC+0
;LCD_Manual_Command.c,12 :: 		lcd_cmd(0x38); // 8bit,2Line,5X7 dots
	MOVLW      56
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,13 :: 		lcd_cmd(0x0e); //Display on,Cursor On
	MOVLW      14
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,15 :: 		while(1){
L_main0:
;LCD_Manual_Command.c,16 :: 		lcd_cmd(0x01); //clear Display
	MOVLW      1
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,17 :: 		lcd_cmd(0x80); //1st row
	MOVLW      128
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,18 :: 		lcd_data('A');
	MOVLW      65
	MOVWF      FARG_lcd_data_ch+0
	CALL       _lcd_data+0
;LCD_Manual_Command.c,19 :: 		lcd_cmd(0xc0); //2nd row
	MOVLW      192
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,20 :: 		lcd_str("Welcome to PIC");
	MOVLW      ?lstr1_LCD_Manual_Command+0
	MOVWF      FARG_lcd_str_str+0
	CALL       _lcd_str+0
;LCD_Manual_Command.c,21 :: 		lcd_cmd(0x01); //clear Display
	MOVLW      1
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,22 :: 		lcd_cmd(0x80); //1st row
	MOVLW      128
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,23 :: 		lcd_str("My Name is");
	MOVLW      ?lstr2_LCD_Manual_Command+0
	MOVWF      FARG_lcd_str_str+0
	CALL       _lcd_str+0
;LCD_Manual_Command.c,24 :: 		lcd_cmd(0xc0); //2nd row
	MOVLW      192
	MOVWF      FARG_lcd_cmd_ch+0
	CALL       _lcd_cmd+0
;LCD_Manual_Command.c,25 :: 		lcd_str("Tahmid Hasan");
	MOVLW      ?lstr3_LCD_Manual_Command+0
	MOVWF      FARG_lcd_str_str+0
	CALL       _lcd_str+0
;LCD_Manual_Command.c,26 :: 		}
	GOTO       L_main0
;LCD_Manual_Command.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_lcd_str:

;LCD_Manual_Command.c,30 :: 		void lcd_str(unsigned char *str){
;LCD_Manual_Command.c,31 :: 		unsigned int loop = 0;
	CLRF       lcd_str_loop_L0+0
	CLRF       lcd_str_loop_L0+1
;LCD_Manual_Command.c,33 :: 		lcd_data(str[loop]);
	CLRF       lcd_str_loop_L0+0
	CLRF       lcd_str_loop_L0+1
L_lcd_str2:
	MOVF       lcd_str_loop_L0+0, 0
	ADDWF      FARG_lcd_str_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_str3
	MOVF       lcd_str_loop_L0+0, 0
	ADDWF      FARG_lcd_str_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_lcd_data_ch+0
	CALL       _lcd_data+0
	INCF       lcd_str_loop_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       lcd_str_loop_L0+1, 1
;LCD_Manual_Command.c,34 :: 		}
	GOTO       L_lcd_str2
L_lcd_str3:
;LCD_Manual_Command.c,36 :: 		}
L_end_lcd_str:
	RETURN
; end of _lcd_str

_lcd_cmd:

;LCD_Manual_Command.c,38 :: 		void lcd_cmd(unsigned char ch){
;LCD_Manual_Command.c,39 :: 		lcd_cmd_or_data = ch;
	MOVF       FARG_lcd_cmd_ch+0, 0
	MOVWF      PORTC+0
;LCD_Manual_Command.c,40 :: 		rs = 0; //cmd
	BCF        PORTB+0, 0
;LCD_Manual_Command.c,41 :: 		en = 1;
	BSF        PORTB+0, 1
;LCD_Manual_Command.c,42 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_lcd_cmd5:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_cmd5
	DECFSZ     R12+0, 1
	GOTO       L_lcd_cmd5
	NOP
;LCD_Manual_Command.c,43 :: 		en = 0;
	BCF        PORTB+0, 1
;LCD_Manual_Command.c,44 :: 		}
L_end_lcd_cmd:
	RETURN
; end of _lcd_cmd

_lcd_data:

;LCD_Manual_Command.c,46 :: 		void lcd_data(unsigned char ch){
;LCD_Manual_Command.c,47 :: 		lcd_cmd_or_data = ch;
	MOVF       FARG_lcd_data_ch+0, 0
	MOVWF      PORTC+0
;LCD_Manual_Command.c,48 :: 		rs = 1; //data
	BSF        PORTB+0, 0
;LCD_Manual_Command.c,49 :: 		en = 1;
	BSF        PORTB+0, 1
;LCD_Manual_Command.c,50 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_lcd_data6:
	DECFSZ     R13+0, 1
	GOTO       L_lcd_data6
	DECFSZ     R12+0, 1
	GOTO       L_lcd_data6
	NOP
;LCD_Manual_Command.c,51 :: 		en = 0;
	BCF        PORTB+0, 1
;LCD_Manual_Command.c,52 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data
