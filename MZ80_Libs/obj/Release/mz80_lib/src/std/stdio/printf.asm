;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 18:07:59 2014
;--------------------------------------------------------
	.module printf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _uart_print_str
	.globl _uart_print_char
	.globl _uart_end
	.globl _uart_begin
	.globl _lcd_print_str
	.globl _lcd_print_char
	.globl _printf
	.globl _lprintf
	.globl _puts
	.globl _putsln
	.globl _putc
	.globl _putcln
	.globl _lputs
	.globl _lputsln
	.globl _lputc
	.globl _lputcln
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
;mz80_lib\src\std\stdio\printf.c:3: unsigned char printf(const unsigned char * form, ...){
;	---------------------------------
; Function printf
; ---------------------------------
_printf_start::
_printf:
;mz80_lib\src\std\stdio\printf.c:6: return 0;
	ld	l,#0x00
	ret
_printf_end::
;mz80_lib\src\std\stdio\printf.c:8: unsigned char lprintf(const unsigned char * form, ...){
;	---------------------------------
; Function lprintf
; ---------------------------------
_lprintf_start::
_lprintf:
;mz80_lib\src\std\stdio\printf.c:11: return 0;
	ld	l,#0x00
	ret
_lprintf_end::
;mz80_lib\src\std\stdio\printf.c:14: void puts(unsigned char * str){
;	---------------------------------
; Function puts
; ---------------------------------
_puts_start::
_puts:
;mz80_lib\src\std\stdio\printf.c:15: uart_print_str(str);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_uart_print_str
	pop	af
	ret
_puts_end::
;mz80_lib\src\std\stdio\printf.c:18: void putsln(unsigned char * str){
;	---------------------------------
; Function putsln
; ---------------------------------
_putsln_start::
_putsln:
;mz80_lib\src\std\stdio\printf.c:19: uart_print_str(str);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_uart_print_str
	pop	af
;mz80_lib\src\std\stdio\printf.c:20: uart_begin();
	call	_uart_begin
;mz80_lib\src\std\stdio\printf.c:21: uart_print_char(STR_NEWLINE);
	ld	a,#0x0D
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
;mz80_lib\src\std\stdio\printf.c:22: uart_end();
	jp	_uart_end
_putsln_end::
;mz80_lib\src\std\stdio\printf.c:25: void putc(unsigned char c){
;	---------------------------------
; Function putc
; ---------------------------------
_putc_start::
_putc:
;mz80_lib\src\std\stdio\printf.c:26: uart_begin();
	call	_uart_begin
;mz80_lib\src\std\stdio\printf.c:27: uart_print_char(c);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
;mz80_lib\src\std\stdio\printf.c:28: uart_end();
	jp	_uart_end
_putc_end::
;mz80_lib\src\std\stdio\printf.c:31: void putcln(unsigned char c){
;	---------------------------------
; Function putcln
; ---------------------------------
_putcln_start::
_putcln:
;mz80_lib\src\std\stdio\printf.c:32: uart_begin();
	call	_uart_begin
;mz80_lib\src\std\stdio\printf.c:33: uart_print_char(c);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
;mz80_lib\src\std\stdio\printf.c:34: uart_print_char(STR_NEWLINE);
	ld	a,#0x0D
	push	af
	inc	sp
	call	_uart_print_char
	inc	sp
;mz80_lib\src\std\stdio\printf.c:35: uart_end();
	jp	_uart_end
_putcln_end::
;mz80_lib\src\std\stdio\printf.c:38: void lputs(unsigned char * str){
;	---------------------------------
; Function lputs
; ---------------------------------
_lputs_start::
_lputs:
;mz80_lib\src\std\stdio\printf.c:39: lcd_print_str(str);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_lcd_print_str
	pop	af
	ret
_lputs_end::
;mz80_lib\src\std\stdio\printf.c:42: void lputsln(unsigned char * str){
;	---------------------------------
; Function lputsln
; ---------------------------------
_lputsln_start::
_lputsln:
;mz80_lib\src\std\stdio\printf.c:43: lcd_print_str(str);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_lcd_print_str
;mz80_lib\src\std\stdio\printf.c:44: lcd_print_char(STR_NEWLINE);
	ld	h,#0x0D
	ex	(sp),hl
	inc	sp
	call	_lcd_print_char
	inc	sp
	ret
_lputsln_end::
;mz80_lib\src\std\stdio\printf.c:47: void lputc(unsigned char c){
;	---------------------------------
; Function lputc
; ---------------------------------
_lputc_start::
_lputc:
;mz80_lib\src\std\stdio\printf.c:48: lcd_print_char(c);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_lcd_print_char
	inc	sp
	ret
_lputc_end::
;mz80_lib\src\std\stdio\printf.c:50: void lputcln(unsigned char c){
;	---------------------------------
; Function lputcln
; ---------------------------------
_lputcln_start::
_lputcln:
;mz80_lib\src\std\stdio\printf.c:51: lcd_print_char(c);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_lcd_print_char
	inc	sp
;mz80_lib\src\std\stdio\printf.c:52: lcd_print_char(STR_NEWLINE);
	ld	a,#0x0D
	push	af
	inc	sp
	call	_lcd_print_char
	inc	sp
	ret
_lputcln_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
