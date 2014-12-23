;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 01:34:29 2014
;--------------------------------------------------------
	.module uart
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clock_throttle
	.globl _uart_read_char
	.globl _uart_read_str
	.globl _uart_print_char
	.globl _uart_print_str
	.globl _uart_flush
	.globl _uart_clrscr
	.globl _uart_begin
	.globl _uart_end
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;mz80_lib\src\io\sio\uart\uart.c:3: char uart_read_char(){
;	---------------------------------
; Function uart_read_char
; ---------------------------------
_uart_read_char_start::
_uart_read_char:
;mz80_lib\src\io\sio\uart\uart.c:13: __endasm;
	IN A,(#(16 +8 +2))
	BIT #1,A
	JR Z,_uart_read_char
	IN A,(#(16 +8 +1))
	LD L,A
	RET
;mz80_lib\src\io\sio\uart\uart.c:14: return 0;
	ld	l,#0x00
	ret
_uart_read_char_end::
;mz80_lib\src\io\sio\uart\uart.c:17: char * uart_read_str(){
;	---------------------------------
; Function uart_read_str
; ---------------------------------
_uart_read_str_start::
_uart_read_str:
;mz80_lib\src\io\sio\uart\uart.c:19: return "";
	ld	hl,#___str_0
	ret
_uart_read_str_end::
___str_0:
	.db 0x00
;mz80_lib\src\io\sio\uart\uart.c:22: void uart_print_char(char data){
;	---------------------------------
; Function uart_print_char
; ---------------------------------
_uart_print_char_start::
_uart_print_char:
;mz80_lib\src\io\sio\uart\uart.c:36: __endasm;
	POP DE
	POP HL
	LD B,L
	PUSH HL
	PUSH DE
	 uart_print_char_wait:
	IN A,(#(16 +8 +2))
	BIT #0,A
	JR NZ,uart_print_char_wait
	LD A,B
	OUT (#(16 +8 +1)),A
	ret
_uart_print_char_end::
;mz80_lib\src\io\sio\uart\uart.c:39: void uart_print_str(char *str){
;	---------------------------------
; Function uart_print_str
; ---------------------------------
_uart_print_str_start::
_uart_print_str:
;mz80_lib\src\io\sio\uart\uart.c:40: uart_begin();
	call	_uart_begin
;mz80_lib\src\io\sio\uart\uart.c:41: while(1)
	pop	bc
	pop	hl
	push	hl
	push	bc
00105$:
;mz80_lib\src\io\sio\uart\uart.c:42: if(*str=='\0') return;
	ld	a,(hl)
	or	a, a
	ret	Z
;mz80_lib\src\io\sio\uart\uart.c:43: else uart_print_char(*str++);
	inc	hl
	push	hl
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
	pop	hl
	jr	00105$
;mz80_lib\src\io\sio\uart\uart.c:44: uart_end();
	ret
_uart_print_str_end::
;mz80_lib\src\io\sio\uart\uart.c:47: void uart_flush(){
;	---------------------------------
; Function uart_flush
; ---------------------------------
_uart_flush_start::
_uart_flush:
;mz80_lib\src\io\sio\uart\uart.c:48: uart_print_char(UART_FLUSH_C);
	ld	a,#0x18
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
	ret
_uart_flush_end::
;mz80_lib\src\io\sio\uart\uart.c:51: void uart_clrscr(){
;	---------------------------------
; Function uart_clrscr
; ---------------------------------
_uart_clrscr_start::
_uart_clrscr:
;mz80_lib\src\io\sio\uart\uart.c:54: }
	ret
_uart_clrscr_end::
;mz80_lib\src\io\sio\uart\uart.c:56: void uart_begin(){
;	---------------------------------
; Function uart_begin
; ---------------------------------
_uart_begin_start::
_uart_begin:
;mz80_lib\src\io\sio\uart\uart.c:57: clock_throttle(CLK_0041MHZ);
	ld	a,#0x01
	push	af
	inc	sp
	call	_clock_throttle
	inc	sp
	ret
_uart_begin_end::
;mz80_lib\src\io\sio\uart\uart.c:59: void uart_end(){
;	---------------------------------
; Function uart_end
; ---------------------------------
_uart_end_start::
_uart_end:
;mz80_lib\src\io\sio\uart\uart.c:60: clock_throttle(CLK_3MHZ);
	xor	a, a
	push	af
	inc	sp
	call	_clock_throttle
	inc	sp
	ret
_uart_end_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
