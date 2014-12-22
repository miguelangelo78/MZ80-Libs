#ifndef UART_H
#define UART_H

#include "..\system\system.h"

extern void uart_begin();
extern void uart_end();
extern char uart_read_char();
extern char * uart_read_str();
extern void uart_print_char(char data);
extern void uart_print_str(char *str);
extern void uart_flush();
extern void uart_clrscr(); 

#endif