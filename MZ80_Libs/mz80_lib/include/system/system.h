#ifndef SYSTEM_H
#define SYSTEM_H

#include "..\io\io.h" // USED FOR THE CLOCK THROTTLER
#include "../std/stdbool.h"
#include "../std/string/string.h"

// PIO CONSTANTS:
#define PIO_CONFIG 130
#define PIO_LCD_INS 2
#define PIO_LCD_DAT 6
#define PIO_LCD_DIS 8
#define PIO_LCD_NU PIO_LCD_DAT+PIO_LCD_DIS
#define PIO_OUT 0
#define PIO_IN 1
#define PIO_DISABLE 16

// UART CONSTANTS:
#define UART_DATA (PIO_DISABLE+PIO_LCD_DIS+1)
#define UART_STATUS (PIO_DISABLE+PIO_LCD_DIS+2)
#define UART_FLUSH_C 24
#define UART_BUSY 0
#define UART_BUFF 1
#define UART_DONE PIO_DISABLE

// MEMORY CONSTANTS:
#define RAM1BASE 0x2000
#define RAM2BASE 0x8000
#define RAM1SIZE RAM2BASE-RAM1BASE-1
#define RAM2SIZE 0xFFFF-RAM2BASE
#define ROMBASE 0
#define ROMSIZE RAM1BASE-1

// TIMING CONSTANTS:
#define CLK_3MHZ 0
#define CLK_0041MHZ 1
#define CLOCK_THROTTLE 0x4+PIO_DISABLE+PIO_LCD_DIS
#define DELAY_1SEC 20

// INITIALIZATION FUNCTIONS:

extern bool is_init;
extern void init();
extern void init_pio();
extern void init_lcd();
extern void init_io();
extern void clock_throttle(char option);
extern void delay_ms(char ms);
extern void delay_sec(char sec);
extern void end();

#endif
