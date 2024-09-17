#line 1 "C:/Users/Sage K1/Desktop/project testing/proTesting/irrigationPro.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

unsigned int soil_moisture_value;
char display_text[16];


sbit RELAY at RC0_bit;
sbit RELAY_Direction at TRISC0_bit;

void main() {

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 ADCON1 = 0x80;
 TRISA = 0xFF;


 UART1_Init(9600);
 Delay_ms(100);


 Lcd_Out(1, 1, "SMART IRRIGATION SYSTEM");
 Lcd_Out(2, 1, "   SYSTEM    ");

 UART1_Write_Text("SMART IRRIGATION SYSEM BY GROUP F");
 UART1_Write(13);
 UART1_Write(10);

 Delay_ms(1000);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 RELAY_Direction = 0;
 RELAY = 0;


 while (1) {

 soil_moisture_value = ADC_Read(0);


 IntToStr(soil_moisture_value, display_text);


 Lcd_Out(1, 1, "Soil Moisture:");
 Lcd_Out(2, 1, display_text);


 UART1_Write_Text("Moisture: ");
 UART1_Write_Text(display_text);
 UART1_Write(13);
 UART1_Write(10);


 if (soil_moisture_value <= 40) {
 RELAY = 1;
 Lcd_Out(2, 10, "Pump ON ");
 delay_ms(500);
 } else {
 RELAY = 0;
 Lcd_Out(2, 10, "Pump OFF");
 }

 Delay_ms(1000);
 }
}
