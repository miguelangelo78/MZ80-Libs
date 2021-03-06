#include "..\..\..\..\include\io\uart.h"

size_c uart_read_char(){
	__asm
		// WAIT FOR DATA TO BE ENTERED ON THE TERMINAL:
		IN A,(#UART_STATUS)
		BIT #UART_BUFF,A
		JR Z,_uart_read_char
		// FETCH THE DATA FROM THE BUFFER
		IN A,(#UART_DATA)
		LD L,A
		RET
	__endasm;
	return 0;
}

size_c * uart_read_str(){

	return "";
}

void uart_print_char(size_c data){
	data;
	__asm
		POP DE // POP THE DATA FROM THE STACK
		POP HL
		LD B,L // RETRIEVE IT
		PUSH HL
		PUSH DE
	uart_print_char_wait:
		IN A,(#UART_STATUS) 		// CHECK IF UART IS BUSY
		BIT #UART_BUSY,A   			// COMPARE 1ST BIT
		JR NZ,uart_print_char_wait  // IF NOT ZERO THEN IT'S BUSY, JUMP BACK
		LD A,B             			// ELSE IT'S AVAILABLE
		OUT (#UART_DATA),A 			// SEND THE BYTE
	__endasm;
}

void uart_print_str(size_c *str){
	uart_begin();
	while(1)
		if(*str=='\0') return;
        else uart_print_char(*str++);
	uart_end();
}

void uart_flush(){
	uart_print_char(UART_FLUSH_C);
}

void uart_clrscr(){
	// send specific data to the UART to signal a clrscr

}

void uart_begin(){
	clock_throttle(CLK_0041MHZ);
}
void uart_end(){
	clock_throttle(CLK_3MHZ);
}
