
_main:

;tem_sensor.c,18 :: 		void main() {
;tem_sensor.c,19 :: 		float adc_value = 0;
;tem_sensor.c,20 :: 		float backtoanalog_value = 0;
;tem_sensor.c,21 :: 		float temperature = 0;
;tem_sensor.c,22 :: 		char display[16]="";
	CLRF       main_display_L0+0
	CLRF       main_display_L0+1
	CLRF       main_display_L0+2
	CLRF       main_display_L0+3
	CLRF       main_display_L0+4
	CLRF       main_display_L0+5
	CLRF       main_display_L0+6
	CLRF       main_display_L0+7
	CLRF       main_display_L0+8
	CLRF       main_display_L0+9
	CLRF       main_display_L0+10
	CLRF       main_display_L0+11
	CLRF       main_display_L0+12
	CLRF       main_display_L0+13
	CLRF       main_display_L0+14
	CLRF       main_display_L0+15
;tem_sensor.c,24 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;tem_sensor.c,25 :: 		TRISA.f0 = 1;
	BSF        TRISA+0, 0
;tem_sensor.c,27 :: 		adcon1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;tem_sensor.c,28 :: 		ADC_Init(); // Initialize ADC module with default settings
	CALL       _ADC_Init+0
;tem_sensor.c,29 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;tem_sensor.c,30 :: 		Lcd_Init(); // Initialize LCD
	CALL       _Lcd_Init+0
;tem_sensor.c,31 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;tem_sensor.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;tem_sensor.c,35 :: 		Lcd_Out(1,1,"Learning");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_tem_sensor+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;tem_sensor.c,36 :: 		Lcd_Out(2,2,"Microcontrollers");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_tem_sensor+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;tem_sensor.c,37 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;tem_sensor.c,38 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;tem_sensor.c,40 :: 		while(1){
L_main3:
;tem_sensor.c,41 :: 		adc_value = ADC_Read(0);  // Read analog value from channel 0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
;tem_sensor.c,42 :: 		backtoanalog_value = (adc_value*5 / 1023);//10bit,resolution=5/1023
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
;tem_sensor.c,43 :: 		temperature = backtoanalog_value*100; // 1 degree = 10mv
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
;tem_sensor.c,46 :: 		FloatToStr_FixLen(temperature, display, 4);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      main_display_L0+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      4
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;tem_sensor.c,52 :: 		Lcd_Out(1,1,"Temp = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_tem_sensor+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;tem_sensor.c,53 :: 		lcd_out_cp(display);
	MOVLW      main_display_L0+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;tem_sensor.c,54 :: 		lcd_chr(1,12,0xdf); //print at pos(row=1,col=16) "°" =223 =0xdf
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;tem_sensor.c,55 :: 		lcd_out_cp(" C"); //celcius
	MOVLW      ?lstr4_tem_sensor+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;tem_sensor.c,56 :: 		}
	GOTO       L_main3
;tem_sensor.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
