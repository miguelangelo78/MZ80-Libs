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
    lcd_reset(); // send instructions to clear the LCD / reset the LCD
}

unsigned int times,_x,_y;
void lcd_goto(size_c x,size_c y){
    _x = x;
    _y = y;
    if(_y==0) _y = 1;
    times = _x + _y * LCD_COLMAX;

    lcd_change_dir(LCD_RIGHT); // change write direction to right
    lcd_goto_orig();           // go to origin first

    // then start shifting
    while(times--) lcd_shift_cur(LCD_RIGHT);
}

void lcd_shift(bool side){
    if(side)    lcd_instruction(LCD_DSHL); // SHIFT LEFT
    else        lcd_instruction(LCD_DSHR); // SHIFT RIGHT
}

void lcd_shift_cur(bool side){
    if(side)    lcd_instruction(LCD_SHR); // SHIFT RIGHT
    else        lcd_instruction(LCD_SHL); // SHIFT LEFT
}

void lcd_scroll(bool side,size_c times){
    // SCROLL DISPLAY
    size_c i,_times = times;

    for(i=0;i<_times;i++) lcd_shift(side);
}

void lcd_scroll_cur(bool side,size_c times){
    // SCROLL CURSOR:
    size_c i,_times = times;
    for(i=0;i<_times;i++) lcd_shift_cur(side);
}

void lcd_goto_orig(){
    lcd_instruction(LCD_ORIGIN);
}

void lcd_change_dir(bool side){
    if(side) lcd_instruction(LCD_DIRR); // WRITE RIGHT
    else lcd_instruction(LCD_DIRL);     // WRITE LEFT
}

void lcd_reset(){
    lcd_instruction(LCD_RESET);
}

void lcd_toggle(bool onoff){
    if(onoff) lcd_instruction(LCD_ON);
    else lcd_instruction(LCD_OFF);
}

void lcd_instruction(size_c ins){
    out(PIO_LCD_INS,ins);
}
