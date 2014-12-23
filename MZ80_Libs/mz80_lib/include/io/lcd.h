#ifndef LCD_H
#define LCD_H

#include "..\system\system.h"
#include "../std/stddef.h"

extern void lcd_print_char(size_c data);
extern void lcd_print_str(size_c * str);
extern void lcd_clrscr();

#endif
