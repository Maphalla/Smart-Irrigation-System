
_main:

;irrigationPro.c,23 :: 		void main() {
;irrigationPro.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;irrigationPro.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;irrigationPro.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;irrigationPro.c,30 :: 		ADCON1 = 0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;irrigationPro.c,31 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;irrigationPro.c,34 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;irrigationPro.c,35 :: 		Delay_ms(100);
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
;irrigationPro.c,38 :: 		Lcd_Out(1, 1, "SMART IRRIGATION SYSTEM");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_irrigationPro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,39 :: 		Lcd_Out(2, 1, "   SYSTEM    ");  // Adjust for alignment on LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_irrigationPro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,41 :: 		UART1_Write_Text("SMART IRRIGATION SYSEM BY GROUP F");  // Send to Bluetooth/Virtual Terminal
	MOVLW      ?lstr3_irrigationPro+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;irrigationPro.c,42 :: 		UART1_Write(13);  // Carriage return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;irrigationPro.c,43 :: 		UART1_Write(10);  // Newline
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;irrigationPro.c,45 :: 		Delay_ms(1000);  // 1-second delay before proceeding to main functionality
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;irrigationPro.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;irrigationPro.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;irrigationPro.c,51 :: 		RELAY_Direction = 0;  // Configure RC0 as output
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;irrigationPro.c,52 :: 		RELAY = 0;            // Initially turn off the relay (pump is off)
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;irrigationPro.c,55 :: 		while (1) {
L_main2:
;irrigationPro.c,57 :: 		soil_moisture_value = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _soil_moisture_value+0
	MOVF       R0+1, 0
	MOVWF      _soil_moisture_value+1
;irrigationPro.c,60 :: 		IntToStr(soil_moisture_value, display_text);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _display_text+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;irrigationPro.c,63 :: 		Lcd_Out(1, 1, "Soil Moisture:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_irrigationPro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,64 :: 		Lcd_Out(2, 1, display_text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _display_text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,67 :: 		UART1_Write_Text("Moisture: ");
	MOVLW      ?lstr5_irrigationPro+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;irrigationPro.c,68 :: 		UART1_Write_Text(display_text);
	MOVLW      _display_text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;irrigationPro.c,69 :: 		UART1_Write(13);  // Carriage return
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;irrigationPro.c,70 :: 		UART1_Write(10);  // Newline
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;irrigationPro.c,73 :: 		if (soil_moisture_value <= 40) {
	MOVF       _soil_moisture_value+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _soil_moisture_value+0, 0
	SUBLW      40
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;irrigationPro.c,74 :: 		RELAY = 1;  // Activate relay (turn on the water pump)
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;irrigationPro.c,75 :: 		Lcd_Out(2, 10, "Pump ON ");  // Display pump status on the LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_irrigationPro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,76 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;irrigationPro.c,77 :: 		} else {
	GOTO       L_main6
L_main4:
;irrigationPro.c,78 :: 		RELAY = 0;  // Deactivate relay (turn off the water pump)
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;irrigationPro.c,79 :: 		Lcd_Out(2, 10, "Pump OFF");  // Display pump status on the LCD
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_irrigationPro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;irrigationPro.c,80 :: 		}
L_main6:
;irrigationPro.c,82 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;irrigationPro.c,83 :: 		}
	GOTO       L_main2
;irrigationPro.c,84 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
