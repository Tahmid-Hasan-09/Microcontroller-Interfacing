
_main:

;ADC.c,2 :: 		void main() {
;ADC.c,3 :: 		UART1_Init(4800);                         // initialize UART1 module
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ADC.c,4 :: 		Delay_ms(100);
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
;ADC.c,6 :: 		while (1) {
L_main1:
;ADC.c,7 :: 		if (UART1_Data_Ready() == 1) {          // if data is received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;ADC.c,8 :: 		UART1_Read_Text(output, "OK", 10);    // reads text until 'OK' is found
	MOVLW      _output+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_ADC+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      10
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;ADC.c,9 :: 		UART1_Write_Text(output);             // sends back text
	MOVLW      _output+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;ADC.c,10 :: 		}
L_main3:
;ADC.c,11 :: 		}
	GOTO       L_main1
;ADC.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
