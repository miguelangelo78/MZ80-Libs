;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 03:03:37 2014
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _itos
	.globl _uart_print_str
	.globl _uart_print_char
	.globl _uart_end
	.globl _uart_begin
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
;main.c:8: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:12: str=  (char *)0x2000;
	ld	de,#0x2000
	ld	b,#0x01
00102$:
;main.c:15: itos(i,str,10);
	push	bc
	push	de
	ld	a,#0x0A
	push	af
	inc	sp
	push	de
	push	bc
	inc	sp
	call	_itos
	pop	af
	pop	af
	pop	de
	push	de
	push	de
	call	_uart_print_str
	pop	af
	call	_uart_begin
	ld	a,#0x0D
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
	call	_uart_end
	pop	de
	pop	bc
;main.c:14: for(;;i++){
	inc	b
	jr	00102$
_main_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
