
_StartSignal:

;Gas_Smoke_Leakage.c,19 :: 		void StartSignal(){
;Gas_Smoke_Leakage.c,20 :: 		TRISD.F2 = 0;    //Configure RD2 as output
	BCF        TRISD+0, 2
;Gas_Smoke_Leakage.c,21 :: 		PORTD.F2 = 0;    //RD2 sends 0 to the sensor
	BCF        PORTD+0, 2
;Gas_Smoke_Leakage.c,22 :: 		delay_ms(18);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_StartSignal0:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal0
	DECFSZ     R12+0, 1
	GOTO       L_StartSignal0
	NOP
	NOP
;Gas_Smoke_Leakage.c,23 :: 		PORTD.F2 = 1;    //RD2 sends 1 to the sensor
	BSF        PORTD+0, 2
;Gas_Smoke_Leakage.c,24 :: 		delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_StartSignal1:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal1
	NOP
	NOP
;Gas_Smoke_Leakage.c,25 :: 		TRISD.F2 = 1;    //Configure RD2 as input
	BSF        TRISD+0, 2
;Gas_Smoke_Leakage.c,26 :: 		}
L_end_StartSignal:
	RETURN
; end of _StartSignal

_CheckResponse:

;Gas_Smoke_Leakage.c,27 :: 		void CheckResponse(){
;Gas_Smoke_Leakage.c,28 :: 		a = 0;
	CLRF       _a+0
;Gas_Smoke_Leakage.c,29 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_CheckResponse2:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse2
	NOP
;Gas_Smoke_Leakage.c,30 :: 		if (PORTD.F2 == 0){
	BTFSC      PORTD+0, 2
	GOTO       L_CheckResponse3
;Gas_Smoke_Leakage.c,31 :: 		delay_us(80);
	MOVLW      53
	MOVWF      R13+0
L_CheckResponse4:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse4
;Gas_Smoke_Leakage.c,32 :: 		if (PORTD.F2 == 1)   a = 1;   delay_us(40);}
	BTFSS      PORTD+0, 2
	GOTO       L_CheckResponse5
	MOVLW      1
	MOVWF      _a+0
L_CheckResponse5:
	MOVLW      26
	MOVWF      R13+0
L_CheckResponse6:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse6
	NOP
L_CheckResponse3:
;Gas_Smoke_Leakage.c,33 :: 		}
L_end_CheckResponse:
	RETURN
; end of _CheckResponse

_ReadData:

;Gas_Smoke_Leakage.c,34 :: 		void ReadData(){
;Gas_Smoke_Leakage.c,35 :: 		for(b=0;b<8;b++){
	CLRF       _b+0
L_ReadData7:
	MOVLW      8
	SUBWF      _b+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ReadData8
;Gas_Smoke_Leakage.c,36 :: 		while(!PORTD.F2); //Wait until PORTD.F2 goes HIGH
L_ReadData10:
	BTFSC      PORTD+0, 2
	GOTO       L_ReadData11
	GOTO       L_ReadData10
L_ReadData11:
;Gas_Smoke_Leakage.c,37 :: 		delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_ReadData12:
	DECFSZ     R13+0, 1
	GOTO       L_ReadData12
	NOP
	NOP
;Gas_Smoke_Leakage.c,38 :: 		if(PORTD.F2 == 0)    i&=~(1<<(7-b));  //Clear bit (7-b)
	BTFSC      PORTD+0, 2
	GOTO       L_ReadData13
	MOVF       _b+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ReadData31:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadData32
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ReadData31
L__ReadData32:
	COMF       R0+0, 1
	MOVF       R0+0, 0
	ANDWF      _i+0, 1
	GOTO       L_ReadData14
L_ReadData13:
;Gas_Smoke_Leakage.c,40 :: 		i|= (1<<(7-b));               //Set bit (7-b)
	MOVF       _b+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ReadData33:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadData34
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ReadData33
L__ReadData34:
	MOVF       R0+0, 0
	IORWF      _i+0, 1
;Gas_Smoke_Leakage.c,41 :: 		while(PORTD.F2); //Wait until PORTD.F2 goes LOW
L_ReadData15:
	BTFSS      PORTD+0, 2
	GOTO       L_ReadData16
	GOTO       L_ReadData15
L_ReadData16:
;Gas_Smoke_Leakage.c,42 :: 		}
L_ReadData14:
;Gas_Smoke_Leakage.c,35 :: 		for(b=0;b<8;b++){
	INCF       _b+0, 1
;Gas_Smoke_Leakage.c,43 :: 		}
	GOTO       L_ReadData7
L_ReadData8:
;Gas_Smoke_Leakage.c,44 :: 		}
L_end_ReadData:
	RETURN
; end of _ReadData

_main:

;Gas_Smoke_Leakage.c,45 :: 		void main() {
;Gas_Smoke_Leakage.c,47 :: 		trisd.f7 = 1;
	BSF        TRISD+0, 7
;Gas_Smoke_Leakage.c,48 :: 		TRISc = 0x00;
	CLRF       TRISC+0
;Gas_Smoke_Leakage.c,49 :: 		PORTc = 0x00;
	CLRF       PORTC+0
;Gas_Smoke_Leakage.c,51 :: 		TRISB = 0;        //Configure PORTB as output
	CLRF       TRISB+0
;Gas_Smoke_Leakage.c,52 :: 		PORTB = 0;        //Initial value of PORTB
	CLRF       PORTB+0
;Gas_Smoke_Leakage.c,53 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Gas_Smoke_Leakage.c,54 :: 		while(1){
L_main17:
;Gas_Smoke_Leakage.c,56 :: 		if(PORTD.f7 == 1){
	BTFSS      PORTD+0, 7
	GOTO       L_main19
;Gas_Smoke_Leakage.c,57 :: 		Portc.f7 = 1;
	BSF        PORTC+0, 7
;Gas_Smoke_Leakage.c,58 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
;Gas_Smoke_Leakage.c,59 :: 		Portc.f7 = 0;
	BCF        PORTC+0, 7
;Gas_Smoke_Leakage.c,60 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;Gas_Smoke_Leakage.c,61 :: 		Portc.f0 = 1;
	BSF        PORTC+0, 0
;Gas_Smoke_Leakage.c,62 :: 		}
L_main19:
;Gas_Smoke_Leakage.c,63 :: 		if(PORTD.f7 == 0){
	BTFSC      PORTD+0, 7
	GOTO       L_main22
;Gas_Smoke_Leakage.c,64 :: 		Portc.f0 = 0;
	BCF        PORTC+0, 0
;Gas_Smoke_Leakage.c,65 :: 		Portc.f7 = 0;
	BCF        PORTC+0, 7
;Gas_Smoke_Leakage.c,66 :: 		}
L_main22:
;Gas_Smoke_Leakage.c,68 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,69 :: 		Lcd_Cmd(_LCD_CLEAR);             // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,70 :: 		StartSignal();
	CALL       _StartSignal+0
;Gas_Smoke_Leakage.c,71 :: 		CheckResponse();
	CALL       _CheckResponse+0
;Gas_Smoke_Leakage.c,72 :: 		if(a == 1){
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;Gas_Smoke_Leakage.c,73 :: 		ReadData();
	CALL       _ReadData+0
;Gas_Smoke_Leakage.c,74 :: 		rh1 =i;
	MOVF       _i+0, 0
	MOVWF      _rh1+0
;Gas_Smoke_Leakage.c,75 :: 		ReadData();
	CALL       _ReadData+0
;Gas_Smoke_Leakage.c,76 :: 		rh2 =i;
	MOVF       _i+0, 0
	MOVWF      _rh2+0
;Gas_Smoke_Leakage.c,77 :: 		ReadData();
	CALL       _ReadData+0
;Gas_Smoke_Leakage.c,78 :: 		t1 =i;
	MOVF       _i+0, 0
	MOVWF      _t1+0
;Gas_Smoke_Leakage.c,79 :: 		ReadData();
	CALL       _ReadData+0
;Gas_Smoke_Leakage.c,80 :: 		t2 =i;
	MOVF       _i+0, 0
	MOVWF      _t2+0
;Gas_Smoke_Leakage.c,81 :: 		ReadData();
	CALL       _ReadData+0
;Gas_Smoke_Leakage.c,82 :: 		sum = i;
	MOVF       _i+0, 0
	MOVWF      _sum+0
;Gas_Smoke_Leakage.c,83 :: 		if(sum == rh1+rh2+t1+t2){
	MOVF       _rh2+0, 0
	ADDWF      _rh1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _t1+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _t2+0, 0
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R2+1
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVF       R2+0, 0
	XORWF      _i+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
;Gas_Smoke_Leakage.c,84 :: 		text = "Temp:  .0C";
	MOVLW      ?lstr1_Gas_Smoke_Leakage+0
	MOVWF      _text+0
;Gas_Smoke_Leakage.c,85 :: 		Lcd_Out(1,6,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,86 :: 		text = "Humidity:  .0%";
	MOVLW      ?lstr2_Gas_Smoke_Leakage+0
	MOVWF      _text+0
;Gas_Smoke_Leakage.c,87 :: 		Lcd_Out(2,2,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,88 :: 		ByteToStr(t1,mytext);
	MOVF       _t1+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _mytext+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Gas_Smoke_Leakage.c,89 :: 		Lcd_Out(1,11,Ltrim(mytext));
	MOVLW      _mytext+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,90 :: 		ByteToStr(rh1,mytext);
	MOVF       _rh1+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _mytext+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;Gas_Smoke_Leakage.c,91 :: 		Lcd_Out(2,11,Ltrim(mytext));
	MOVLW      _mytext+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,92 :: 		}
	GOTO       L_main25
L_main24:
;Gas_Smoke_Leakage.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);             // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Gas_Smoke_Leakage.c,96 :: 		text = "Check sum error";
	MOVLW      ?lstr3_Gas_Smoke_Leakage+0
	MOVWF      _text+0
;Gas_Smoke_Leakage.c,97 :: 		Lcd_Out(1,1,text);}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main25:
;Gas_Smoke_Leakage.c,98 :: 		}
	GOTO       L_main26
L_main23:
;Gas_Smoke_Leakage.c,100 :: 		text="No response";
	MOVLW      ?lstr4_Gas_Smoke_Leakage+0
	MOVWF      _text+0
;Gas_Smoke_Leakage.c,101 :: 		Lcd_Out(1,3,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,102 :: 		text = "from the sensor";
	MOVLW      ?lstr5_Gas_Smoke_Leakage+0
	MOVWF      _text+0
;Gas_Smoke_Leakage.c,103 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Gas_Smoke_Leakage.c,104 :: 		}
L_main26:
;Gas_Smoke_Leakage.c,105 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
;Gas_Smoke_Leakage.c,106 :: 		}
	GOTO       L_main17
;Gas_Smoke_Leakage.c,107 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
