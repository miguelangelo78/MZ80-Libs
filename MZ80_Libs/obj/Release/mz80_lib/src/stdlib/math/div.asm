;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 03:03:11 2014
;--------------------------------------------------------
	.module div
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _div
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
;mz80_lib\src\stdlib\math\div.c:3: unsigned char div(unsigned char x,unsigned char y){
;	---------------------------------
; Function div
; ---------------------------------
_div_start::
_div:
;mz80_lib\src\stdlib\math\div.c:5: _x = x,
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
;mz80_lib\src\stdlib\math\div.c:6: _y = y;
	ld	hl, #3+0
	add	hl, sp
	ld	e, (hl)
;mz80_lib\src\stdlib\math\div.c:8: while(_x>=_y){
	ld	b,#0x00
00101$:
;mz80_lib\src\stdlib\math\div.c:9: _x-=_y;
	ld	a,d
	cp	a,e
	jr	C,00103$
	sub	a, e
	ld	d,a
;mz80_lib\src\stdlib\math\div.c:10: quo++;
	inc	b
	jr	00101$
00103$:
;mz80_lib\src\stdlib\math\div.c:12: return quo;
	ld	l,b
	ret
_div_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
