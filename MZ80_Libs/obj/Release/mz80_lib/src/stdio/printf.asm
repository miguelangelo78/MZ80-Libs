;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 16:42:33 2014
;--------------------------------------------------------
	.module printf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _printf
	.globl _lprintf
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
;mz80_lib\src\stdio\printf.c:3: unsigned char printf(const char * form, ...){
;	---------------------------------
; Function printf
; ---------------------------------
_printf_start::
_printf:
;mz80_lib\src\stdio\printf.c:5: }
	ret
_printf_end::
;mz80_lib\src\stdio\printf.c:6: unsigned char lprintf(const char * form, ...){
;	---------------------------------
; Function lprintf
; ---------------------------------
_lprintf_start::
_lprintf:
;mz80_lib\src\stdio\printf.c:8: }
	ret
_lprintf_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
