
_main:

;ADC.c,18 :: 		void main() {
;ADC.c,21 :: 		float adc_value = 0;
;ADC.c,22 :: 		ADC_Init();  // Initialize ADC module with default settings
	CALL       _ADC_Init+0
;ADC.c,24 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;ADC.c,25 :: 		TRISA.f0 = 1;
	BSF        TRISA+0, 0
;ADC.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ADC.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC.c,30 :: 		while(1){
L_main0:
;ADC.c,31 :: 		adc_value = ADC_Read(0);  // Read analog value from channel 0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;ADC.c,32 :: 		analog_volatage = adc_value * 5 / 1023 ; //10 bit adc used,5/1023 = resolution or,possible number of digital levels
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;ADC.c,34 :: 		FloatToStr_FixLen(analog_volatage, voltage_txt, 4);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      main_voltage_txt_L0+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      4
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;ADC.c,36 :: 		Lcd_Out(1, 3, "Analog Voltage:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADC+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC.c,37 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC.c,38 :: 		Lcd_Out(2, 8, voltage_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_voltage_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC.c,39 :: 		Delay_ms(100);
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
;ADC.c,40 :: 		}
	GOTO       L_main0
;ADC.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
