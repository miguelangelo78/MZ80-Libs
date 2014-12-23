;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 18:07:57 2014
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _puts
	.globl _lcd_print_str
	.globl _init
	.globl _strcpy
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
;main.c:10: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:13: init();
	call	_init
;main.c:15: strcpy(str,"COPIED");
	ld	hl,#___str_0
	push	hl
	ld	hl,#0x2000
	push	hl
	call	_strcpy
	pop	af
;main.c:16: puts("testa");
	ld	hl, #___str_1
	ex	(sp),hl
	call	_puts
;main.c:17: lcd_print_str("teste");
	ld	hl, #___str_2
	ex	(sp),hl
	call	_lcd_print_str
	pop	af
	ret
_main_end::
___str_0:
	.ascii "COPIED"
	.db 0x00
___str_1:
	.ascii "testa"
	.db 0x00
___str_2:
	.ascii "teste"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
