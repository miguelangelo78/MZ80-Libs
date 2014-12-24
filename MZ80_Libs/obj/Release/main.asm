;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Dec 24 00:26:13 2014
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _lputs
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
;main.c:7: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;main.c:9: init();
	call	_init
;main.c:11: strcpy(str,"It's working, beach");
	ld	hl,#___str_0
	push	hl
	ld	hl,#0x2000
	push	hl
	call	_strcpy
	pop	af
;main.c:13: lputs("smn");
	ld	hl, #___str_1
	ex	(sp),hl
	call	_lputs
	pop	af
	ret
_main_end::
___str_0:
	.ascii "It's working, beach"
	.db 0x00
___str_1:
	.ascii "smn"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
