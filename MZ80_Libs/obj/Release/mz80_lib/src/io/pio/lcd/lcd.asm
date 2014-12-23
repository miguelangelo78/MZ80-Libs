;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 18:07:58 2014
;--------------------------------------------------------
	.module lcd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _out
	.globl _lcd_print_char
	.globl _lcd_print_str
	.globl _lcd_clrscr
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
;mz80_lib\src\io\pio\lcd\lcd.c:3: void lcd_print_char(size_c data){
;	---------------------------------
; Function lcd_print_char
; ---------------------------------
_lcd_print_char_start::
_lcd_print_char:
;mz80_lib\src\io\pio\lcd\lcd.c:4: out(PIO_LCD_DAT,data);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x06
	push	de
	call	_out
	pop	af
	ret
_lcd_print_char_end::
;mz80_lib\src\io\pio\lcd\lcd.c:7: void lcd_print_str(size_c * str){
;	---------------------------------
; Function lcd_print_str
; ---------------------------------
_lcd_print_str_start::
_lcd_print_str:
;mz80_lib\src\io\pio\lcd\lcd.c:8: while(1)
	pop	bc
	pop	de
	push	de
	push	bc
00105$:
;mz80_lib\src\io\pio\lcd\lcd.c:9: if(*str=='\0') return;
	ld	a,(de)
	or	a, a
	ret	Z
;mz80_lib\src\io\pio\lcd\lcd.c:10: else out(PIO_LCD_DAT,*str++);
	inc	de
	push	de
	ld	d,a
	ld	e,#0x06
	push	de
	call	_out
	pop	af
	pop	de
	jr	00105$
	ret
_lcd_print_str_end::
;mz80_lib\src\io\pio\lcd\lcd.c:13: void lcd_clrscr(){
;	---------------------------------
; Function lcd_clrscr
; ---------------------------------
_lcd_clrscr_start::
_lcd_clrscr:
;mz80_lib\src\io\pio\lcd\lcd.c:16: }
	ret
_lcd_clrscr_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
