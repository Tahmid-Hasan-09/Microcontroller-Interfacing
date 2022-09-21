
_main:

;temparature_sensor_interfacing.c,16 :: 		void main()
;temparature_sensor_interfacing.c,20 :: 		trisb=0x00;
	CLRF       TRISB+0
;temparature_sensor_interfacing.c,21 :: 		trisa=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;temparature_sensor_interfacing.c,22 :: 		adcon1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;temparature_sensor_interfacing.c,23 :: 		lcd_init();
	CALL       _Lcd_Init+0
;temparature_sensor_interfacing.c,24 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temparature_sensor_interfacing.c,25 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;temparature_sensor_interfacing.c,26 :: 		while(1)
L_main0:
;temparature_sensor_interfacing.c,28 :: 		result=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;temparature_sensor_interfacing.c,29 :: 		volt=result*4.88;
	CALL       _word2double+0
	MOVLW      246
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;temparature_sensor_interfacing.c,30 :: 		temp=volt/10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      main_temp_L0+0
	MOVF       R0+1, 0
	MOVWF      main_temp_L0+1
	MOVF       R0+2, 0
	MOVWF      main_temp_L0+2
	MOVF       R0+3, 0
	MOVWF      main_temp_L0+3
;temparature_sensor_interfacing.c,31 :: 		lcd_out(1,1,"Temp = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_temparature_sensor_interfacing+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;temparature_sensor_interfacing.c,32 :: 		floattostr(temp,display);
	MOVF       main_temp_L0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       main_temp_L0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       main_temp_L0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       main_temp_L0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _display+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;temparature_sensor_interfacing.c,33 :: 		lcd_out_cp(display);
	MOVLW      _display+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;temparature_sensor_interfacing.c,34 :: 		lcd_chr(1,16,223); //print at pos(row=1,col=13) "°" =223 =0xdf
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temparature_sensor_interfacing.c,35 :: 		lcd_chr(2,1,'C'); //celcius
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;temparature_sensor_interfacing.c,36 :: 		}
	GOTO       L_main0
;temparature_sensor_interfacing.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
