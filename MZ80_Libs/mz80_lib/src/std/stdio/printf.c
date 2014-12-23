#include "../../../include/std/stdio.h"

unsigned char printf(const unsigned char * form, ...){
    // THIS GUN BE COMPLICATED...
    form;
    return 0;
}
unsigned char lprintf(const unsigned char * form, ...){
    // THIS GUN BE COMPLICATED...
    form;
    return 0;
}

void puts(unsigned char * str){
    uart_print_str(str);
}

void putsln(unsigned char * str){
    uart_print_str(str);
    uart_begin();
    uart_print_char(STR_NEWLINE);
    uart_end();
}

void putc(unsigned char c){
    uart_begin();
    uart_print_char(c);
    uart_end();
}

void putcln(unsigned char c){
    uart_begin();
    uart_print_char(c);
    uart_print_char(STR_NEWLINE);
    uart_end();
}

void lputs(unsigned char * str){
    lcd_print_str(str);
}

void lputsln(unsigned char * str){
    lcd_print_str(str);
    lcd_print_char(STR_NEWLINE);
}

void lputc(unsigned char c){
    lcd_print_char(c);
}
void lputcln(unsigned char c){
    lcd_print_char(c);
    lcd_print_char(STR_NEWLINE);
}
