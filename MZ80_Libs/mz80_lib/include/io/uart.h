#ifndef UART_H
#define UART_H

#include "..\system\system.h"
#include "../std/stddef.h"

extern void uart_begin();
extern void uart_end();
extern size_c uart_read_char();
extern size_c * uart_read_str();
extern void uart_print_char(size_c data);
extern void uart_print_str(size_c *str);
extern void uart_flush();
extern void uart_clrscr();

#endif
