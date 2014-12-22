#ifndef LCD_H
#define LCD_H

#include "..\system\system.h"

extern void lcd_print_char(char data);
extern void lcd_print_str(char * str);
extern void lcd_clrscr();

#endif