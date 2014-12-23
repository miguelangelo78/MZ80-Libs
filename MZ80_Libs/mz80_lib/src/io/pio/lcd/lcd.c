#include "..\..\..\..\include\io\lcd.h"

void lcd_print_char(size_c data){
	out(PIO_LCD_DAT,data);
}

void lcd_print_str(size_c * str){
	while(1)
		if(*str=='\0') return;
		else out(PIO_LCD_DAT,*str++);
}

void lcd_clrscr(){
	// send instructions to clear the LCD

}
