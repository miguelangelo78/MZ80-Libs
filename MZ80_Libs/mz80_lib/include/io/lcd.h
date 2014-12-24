#ifndef LCD_H
#define LCD_H

#include "..\system\system.h"
#include "../std/stddef.h"
#include "../std/stdbool.h"

// LCD CONSTANTS:
#define LCD_RESET   0b1
#define LCD_ORIGIN  0b10
#define LCD_OFF     0b1000
#define LCD_ON      0b1100
#define LCD_DIRL    0b110
#define LCD_DIRR    0b100
#define LCD_DSHL    0b11100
#define LCD_DSHR    0b11000
#define LCD_SHR     0b10000
#define LCD_SHL     0b10100
#define LCD_LEFT    1
#define LCD_RIGHT   0
#define LCD_COLMAX  20
#define LCD_ROWMAX  2

extern void lcd_print_char(size_c data);
extern void lcd_print_str(size_c * str);
extern void lcd_clrscr();
extern void lcd_goto(size_c x,size_c y);
extern void lcd_shift(bool side);
extern void lcd_shift_cur(bool side);
extern void lcd_scroll(bool side,size_c times);
extern void lcd_scroll_cur(bool side,size_c times);
extern void lcd_goto_orig();
extern void lcd_change_dir(bool side);
extern void lcd_reset();
extern void lcd_toggle(bool onoff);
extern void lcd_instruction(size_c ins);

#endif
