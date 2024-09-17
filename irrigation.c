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

void main() {
    // Initialize LCD
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    // Initialize ADC for soil moisture sensor
    ADCON1 = 0x80;
    TRISA = 0xFF;

    // Initialize UART1 for Bluetooth (9600 baud rate)
    UART1_Init(9600);
    Delay_ms(100);

    while (1) {
        // Read soil moisture sensor value from AN0
        soil_moisture_value = ADC_Read(0);

        // Convert value to string for display
        IntToStr(soil_moisture_value, display_text);

        // Display on LCD
        Lcd_Out(1, 1, "Soil Moisture:");
        Lcd_Out(2, 1, display_text);

        // Send soil moisture value via Bluetooth
        UART1_Write_Text("Moisture: ");
        UART1_Write_Text(display_text);
        UART1_Write(13);  // Carriage return
        UART1_Write(10);  // Newline

        Delay_ms(1000);
    }
}
