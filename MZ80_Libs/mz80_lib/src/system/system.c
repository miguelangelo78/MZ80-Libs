#include "..\..\include\system\system.h"

bool is_init = false;

void init_pio(){
    __asm
		LD A,#PIO_CONFIG
		OUT (#3),A
	__endasm;
}

void init_lcd(){
	__asm
		LD A,#0x0F
		OUT (#PIO_LCD_INS),A
		LD A,#0
		OUT (#PIO_LCD_NU),A
	__endasm;
}

void init_io(){
	init_pio();
	init_lcd();
}

void init(){
	// INITIALIZE EVERYTHING HERE:
	is_init = true;
	init_io();
}

void clock_throttle(char option){
	out(CLOCK_THROTTLE,option);
}

void delay_ms(char ms){
	char i;
	for(i=0;i<ms;i++){} // THIS FUNCTION IS VERY INACCURATE
}

void delay_sec(char sec){
	char i;
	for(i=0;i<sec;i++) delay_ms(DELAY_1SEC);
}

void end(){
	for(;;){}
}
