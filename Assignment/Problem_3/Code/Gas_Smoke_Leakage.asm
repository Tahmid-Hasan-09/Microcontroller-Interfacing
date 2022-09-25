
_Start_Signal:

;Gas_Smoke_Leakage.c,33 :: 		void Start_Signal(void) {
;Gas_Smoke_Leakage.c,34 :: 		DHT11_PIN_Direction = 0;                    // Configure connection pin as output
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Gas_Smoke_Leakage.c,35 :: 		DHT11_PIN = 0;                              // Connection pin output low
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Gas_Smoke_Leakage.c,36 :: 		delay_ms(25);                               // Wait 25 ms
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Start_Signal0:
	DECFSZ     R13+0, 1
	GOTO       L_Start_Signal0
	DECFSZ     R12+0, 1
	GOTO       L_Start_Signal0
	NOP
;Gas_Smoke_Leakage.c,37 :: 		DHT11_PIN = 1;                              // Connection pin output high
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Gas_Smoke_Leakage.c,38 :: 		delay_us(25);                               // Wait 25 us
	MOVLW      16
	MOVWF      R13+0
L_Start_Signal1:
	DECFSZ     R13+0, 1
	GOTO       L_Start_Signal1
	NOP
;Gas_Smoke_Leakage.c,39 :: 		DHT11_PIN_Direction = 1;                    // Configure connection pin as input
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Gas_Smoke_Leakage.c,40 :: 		}
L_end_Start_Signal:
	RETURN
; end of _Start_Signal

_Check_Response:

;Gas_Smoke_Leakage.c,42 :: 		unsigned short Check_Response() {
;Gas_Smoke_Leakage.c,43 :: 		TMR1H = 0;                                  // Reset Timer1
	CLRF       TMR1H+0
;Gas_Smoke_Leakage.c,44 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Gas_Smoke_Leakage.c,45 :: 		TMR1ON_bit = 1;                             // Enable Timer1 module
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Gas_Smoke_Leakage.c,46 :: 		while(!DHT11_PIN && TMR1L < 100);           // Wait until DHT11_PIN becomes high (cheking of 80µs low time response)
L_Check_Response2:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_Check_Response3
	MOVLW      100
	SUBWF      TMR1L+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Response3
L__Check_Response43:
	GOTO       L_Check_Response2
L_Check_Response3:
;Gas_Smoke_Leakage.c,47 :: 		if(TMR1L > 99)                              // If response time > 99µS  ==> Response error
	MOVF       TMR1L+0, 0
	SUBLW      99
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Response6
;Gas_Smoke_Leakage.c,48 :: 		return 0;                                 // Return 0 (Device has a problem with response)
	CLRF       R0+0
	GOTO       L_end_Check_Response
L_Check_Response6:
;Gas_Smoke_Leakage.c,49 :: 		else {    TMR1H = 0;                        // Reset Timer1
	CLRF       TMR1H+0
;Gas_Smoke_Leakage.c,50 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Gas_Smoke_Leakage.c,51 :: 		while(DHT11_PIN && TMR1L < 100);          // Wait until DHT11_PIN becomes low (cheking of 80µs high time response)
L_Check_Response8:
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_Check_Response9
	MOVLW      100
	SUBWF      TMR1L+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Response9
L__Check_Response42:
	GOTO       L_Check_Response8
L_Check_Response9:
;Gas_Smoke_Leakage.c,52 :: 		if(TMR1L > 99)                            // If response time > 99µS  ==> Response error
	MOVF       TMR1L+0, 0
	SUBLW      99
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Response12
;Gas_Smoke_Leakage.c,53 :: 		return 0;                               // Return 0 (Device has a problem with response)
	CLRF       R0+0
	GOTO       L_end_Check_Response
L_Check_Response12:
;Gas_Smoke_Leakage.c,55 :: 		return 1;                               // Return 1 (response OK)
	MOVLW      1
	MOVWF      R0+0
;Gas_Smoke_Leakage.c,57 :: 		}
L_end_Check_Response:
	RETURN
; end of _Check_Response

_Read_Data:

;Gas_Smoke_Leakage.c,59 :: 		unsigned short Read_Data(unsigned short* dht_data) {
;Gas_Smoke_Leakage.c,61 :: 		*dht_data = 0;
	MOVF       FARG_Read_Data_dht_data+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;Gas_Smoke_Leakage.c,62 :: 		for(i = 0; i < 8; i++){
	CLRF       R2+0
L_Read_Data14:
	MOVLW      128
	XORWF      R2+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      8
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Read_Data15
;Gas_Smoke_Leakage.c,63 :: 		TMR1H = 0;                                // Reset Timer1
	CLRF       TMR1H+0
;Gas_Smoke_Leakage.c,64 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Gas_Smoke_Leakage.c,65 :: 		while(!DHT11_PIN)                         // Wait until DHT11_PIN becomes high
L_Read_Data17:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_Read_Data18
;Gas_Smoke_Leakage.c,66 :: 		if(TMR1L > 100) {                       // If low time > 100  ==>  Time out error (Normally it takes 50µs)
	MOVF       TMR1L+0, 0
	SUBLW      100
	BTFSC      STATUS+0, 0
	GOTO       L_Read_Data19
;Gas_Smoke_Leakage.c,67 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_Read_Data
;Gas_Smoke_Leakage.c,68 :: 		}
L_Read_Data19:
	GOTO       L_Read_Data17
L_Read_Data18:
;Gas_Smoke_Leakage.c,69 :: 		TMR1H = 0;                                // Reset Timer1
	CLRF       TMR1H+0
;Gas_Smoke_Leakage.c,70 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Gas_Smoke_Leakage.c,71 :: 		while(DHT11_PIN)                          // Wait until DHT11_PIN becomes low
L_Read_Data20:
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_Read_Data21
;Gas_Smoke_Leakage.c,72 :: 		if(TMR1L > 100) {                       // If high time > 100  ==>  Time out error (Normally it takes 26-28µs for 0 and 70µs for 1)
	MOVF       TMR1L+0, 0
	SUBLW      100
	BTFSC      STATUS+0, 0
	GOTO       L_Read_Data22
;Gas_Smoke_Leakage.c,73 :: 		return 1;                             // Return 1 (timeout error)
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_Read_Data
;Gas_Smoke_Leakage.c,74 :: 		}
L_Read_Data22:
	GOTO       L_Read_Data20
L_Read_Data21:
;Gas_Smoke_Leakage.c,75 :: 		if(TMR1L > 50)                           // If high time > 50  ==>  Sensor sent 1
	MOVF       TMR1L+0, 0
	SUBLW      50
	BTFSC      STATUS+0, 0
	GOTO       L_Read_Data23
;Gas_Smoke_Leakage.c,76 :: 		*dht_data |= (1 << (7 - i));           // Set bit (7 - i)
	MOVF       R2+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__Read_Data48:
	BTFSC      STATUS+0, 2
	GOTO       L__Read_Data49
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Read_Data48
L__Read_Data49:
	MOVF       FARG_Read_Data_dht_data+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       FARG_Read_Data_dht_data+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_Read_Data23:
;Gas_Smoke_Leakage.c,62 :: 		for(i = 0; i < 8; i++){
	INCF       R2+0, 1
;Gas_Smoke_Leakage.c,77 :: 		}
	GOTO       L_Read_Data14
L_Read_Data15:
;Gas_Smoke_Leakage.c,78 :: 		return 0;                                   // Return 0 (data read OK)
	CLRF       R0+0
;Gas_Smoke_Leakage.c,79 :: 		}
L_end_Read_Data:
	RETURN
; end of _Read_Data

_main:

;Gas_Smoke_Leakage.c,81 :: 		void main() {
;Gas_Smoke_Leakage.c,84 :: 		trisd.f7 = 1;
	BSF        TRISD+0, 7
;Gas_Smoke_Leakage.c,85 :: 		TRISb.f1 = 0;
	BCF        TRISB+0, 1
;Gas_Smoke_Leakage.c,86 :: 		TRISb.f2 = 0;
	BCF        TRISB+0, 2
;Gas_Smoke_Leakage.c,87 :: 		PORTb.f1 = 0;
	BCF        PORTB+0, 1
;Gas_Smoke_Leakage.c,88 :: 		PORTb.f2 = 0;
	BCF        PORTB+0, 2
;Gas_Smoke_Leakage.c,90 :: 		T1CON = 0x10;                    // Set Timer1 clock source to internal with 1:2 prescaler (Timer1 clock = 1MHz)
	MOVLW      16
	MOVWF      T1CON+0
;Gas_Smoke_Leakage.c,91 :: 		TMR1H = 0;                       // Reset Timer1
	CLRF       TMR1H+0
;Gas_Smoke_Leakage.c,92 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Gas_Smoke_Leakage.c,93 :: 		Lcd_Init();                      // Initialize LCD module
	CALL       _Lcd_Init+0
;Gas_Smoke_Leakage.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);             // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,96 :: 		while(1) {
L_main24:
;Gas_Smoke_Leakage.c,99 :: 		if(PORTD.f7 == 1){
	BTFSS      PORTD+0, 7
	GOTO       L_main26
;Gas_Smoke_Leakage.c,100 :: 		for(loop = 0;loop<10;loop++){
	CLRF       _loop+0
	CLRF       _loop+1
L_main27:
	MOVLW      128
	XORWF      _loop+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      10
	SUBWF      _loop+0, 0
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;Gas_Smoke_Leakage.c,101 :: 		Portb.f2 = 1;
	BSF        PORTB+0, 2
;Gas_Smoke_Leakage.c,102 :: 		Portb.f1 = 1;
	BSF        PORTB+0, 1
;Gas_Smoke_Leakage.c,103 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
;Gas_Smoke_Leakage.c,104 :: 		Portb.f2 = 0;
	BCF        PORTB+0, 2
;Gas_Smoke_Leakage.c,105 :: 		Portb.f1 = 0;
	BCF        PORTB+0, 1
;Gas_Smoke_Leakage.c,106 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
;Gas_Smoke_Leakage.c,107 :: 		Portb.f2 = 1;
	BSF        PORTB+0, 2
;Gas_Smoke_Leakage.c,108 :: 		Portb.f1 = 1;
	BSF        PORTB+0, 1
;Gas_Smoke_Leakage.c,109 :: 		Portb.f2 = 0;
	BCF        PORTB+0, 2
;Gas_Smoke_Leakage.c,110 :: 		Portb.f1 = 0;
	BCF        PORTB+0, 1
;Gas_Smoke_Leakage.c,100 :: 		for(loop = 0;loop<10;loop++){
	INCF       _loop+0, 1
	BTFSC      STATUS+0, 2
	INCF       _loop+1, 1
;Gas_Smoke_Leakage.c,111 :: 		}
	GOTO       L_main27
L_main28:
;Gas_Smoke_Leakage.c,112 :: 		}
L_main26:
;Gas_Smoke_Leakage.c,113 :: 		if(PORTD.f7 == 0){
	BTFSC      PORTD+0, 7
	GOTO       L_main32
;Gas_Smoke_Leakage.c,114 :: 		Portb.f1 = 0;
	BCF        PORTB+0, 1
;Gas_Smoke_Leakage.c,115 :: 		Portb.f2 = 0;
	BCF        PORTB+0, 2
;Gas_Smoke_Leakage.c,116 :: 		}
L_main32:
;Gas_Smoke_Leakage.c,119 :: 		Start_Signal();                // Send start signal to the sensor
	CALL       _Start_Signal+0
;Gas_Smoke_Leakage.c,121 :: 		if(Check_Response()) {         // Check if there is a response from sensor (If OK start reding humidity and temperature data)
	CALL       _Check_Response+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main33
;Gas_Smoke_Leakage.c,123 :: 		if(Read_Data(&RH_byte1) || Read_Data(&RH_byte2) || Read_Data(&T_byte1) || Read_Data(&T_byte2) || Read_Data(&Checksum)) {
	MOVLW      _RH_byte1+0
	MOVWF      FARG_Read_Data_dht_data+0
	CALL       _Read_Data+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      _RH_byte2+0
	MOVWF      FARG_Read_Data_dht_data+0
	CALL       _Read_Data+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      _T_byte1+0
	MOVWF      FARG_Read_Data_dht_data+0
	CALL       _Read_Data+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      _T_byte2+0
	MOVWF      FARG_Read_Data_dht_data+0
	CALL       _Read_Data+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      _CheckSum+0
	MOVWF      FARG_Read_Data_dht_data+0
	CALL       _Read_Data+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	GOTO       L_main36
L__main44:
;Gas_Smoke_Leakage.c,124 :: 		Lcd_Cmd(_LCD_CLEAR);                               // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,125 :: 		lcd_out(1, 5, "Time out!");                        // Display "Time out!"
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Gas_Smoke_Leakage+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,126 :: 		}
	GOTO       L_main37
L_main36:
;Gas_Smoke_Leakage.c,128 :: 		if(CheckSum == ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF)) {
	MOVF       _RH_byte2+0, 0
	ADDWF      _RH_byte1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _T_byte1+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _T_byte2+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      255
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       R2+0, 0
	XORWF      _CheckSum+0, 0
L__main52:
	BTFSS      STATUS+0, 2
	GOTO       L_main38
;Gas_Smoke_Leakage.c,130 :: 		temperature[7]  = T_Byte1/10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _T_byte1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _temperature+7
;Gas_Smoke_Leakage.c,131 :: 		temperature[8]  = T_Byte1%10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _T_byte1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _temperature+8
;Gas_Smoke_Leakage.c,132 :: 		temperature[10] = T_Byte2/10  + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _T_byte2+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _temperature+10
;Gas_Smoke_Leakage.c,133 :: 		humidity[7]     = RH_Byte1/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _RH_byte1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _humidity+7
;Gas_Smoke_Leakage.c,134 :: 		humidity[8]     = RH_Byte1%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _RH_byte1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _humidity+8
;Gas_Smoke_Leakage.c,135 :: 		humidity[10]    = RH_Byte2/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _RH_byte2+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _humidity+10
;Gas_Smoke_Leakage.c,136 :: 		temperature[11] = 223;                      // Put degree symbol (°)
	MOVLW      223
	MOVWF      _temperature+11
;Gas_Smoke_Leakage.c,137 :: 		lcd_out(1, 1, temperature);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temperature+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,138 :: 		lcd_out(2, 1, humidity);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _humidity+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,139 :: 		}
	GOTO       L_main39
L_main38:
;Gas_Smoke_Leakage.c,142 :: 		Lcd_Cmd(_LCD_CLEAR);                        // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,143 :: 		lcd_out(1, 1, "Checksum Error!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Gas_Smoke_Leakage+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,144 :: 		}
L_main39:
;Gas_Smoke_Leakage.c,145 :: 		}
L_main37:
;Gas_Smoke_Leakage.c,146 :: 		}
	GOTO       L_main40
L_main33:
;Gas_Smoke_Leakage.c,149 :: 		Lcd_Cmd(_LCD_CLEAR);                 // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,150 :: 		lcd_out(1, 3, "No response");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Gas_Smoke_Leakage+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,151 :: 		lcd_out(2, 1, "from the sensor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Gas_Smoke_Leakage+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,152 :: 		}
L_main40:
;Gas_Smoke_Leakage.c,154 :: 		TMR1ON_bit = 0;                        // Disable Timer1 module
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Gas_Smoke_Leakage.c,155 :: 		delay_ms(1000);                        // Wait 1 second
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	NOP
;Gas_Smoke_Leakage.c,157 :: 		}
	GOTO       L_main24
;Gas_Smoke_Leakage.c,158 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
