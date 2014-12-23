#ifndef STDIO_H
#define STDIO_H

#include "../io/lcd.h"
#include "../io/io.h"
#include "../io/uart.h"
#include "stddef.h"

unsigned char printf(const size_c *, ...);
unsigned char lprintf(const size_c *, ...);
void puts(size_c *);
void putsln(size_c *);
void putc(size_c);
void putcln(size_c);
void lputs(size_c *);
void lputsln(size_c *);
void lputc(size_c);
void lputcln(size_c);

#endif
