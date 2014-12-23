;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 01:34:30 2014
;--------------------------------------------------------
	.module system
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _out
	.globl _init_pio
	.globl _init_lcd
	.globl _init_io
	.globl _init
	.globl _clock_throttle
	.globl _delay_ms
	.globl _delay_sec
	.globl _end
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
;mz80_lib\src\system\system.c:3: void init_pio(){
;	---------------------------------
; Function init_pio
; ---------------------------------
_init_pio_start::
_init_pio:
;mz80_lib\src\system\system.c:7: __endasm;
	LD A,#130
	OUT (#3),A
	ret
_init_pio_end::
;mz80_lib\src\system\system.c:10: void init_lcd(){
;	---------------------------------
; Function init_lcd
; ---------------------------------
_init_lcd_start::
_init_lcd:
;mz80_lib\src\system\system.c:16: __endasm;
	LD A,#0x0F
	OUT (#2),A
	LD A,#0
	OUT (#6 +8),A
	ret
_init_lcd_end::
;mz80_lib\src\system\system.c:19: void init_io(){
;	---------------------------------
; Function init_io
; ---------------------------------
_init_io_start::
_init_io:
;mz80_lib\src\system\system.c:20: init_pio();
	call	_init_pio
;mz80_lib\src\system\system.c:21: init_lcd();
	jp	_init_lcd
_init_io_end::
;mz80_lib\src\system\system.c:24: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init_start::
_init:
;mz80_lib\src\system\system.c:26: init_io();
	jp	_init_io
_init_end::
;mz80_lib\src\system\system.c:29: void clock_throttle(char option){
;	---------------------------------
; Function clock_throttle
; ---------------------------------
_clock_throttle_start::
_clock_throttle:
;mz80_lib\src\system\system.c:30: out(CLOCK_THROTTLE,option);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x1C
	push	de
	call	_out
	pop	af
	ret
_clock_throttle_end::
;mz80_lib\src\system\system.c:33: void delay_ms(char ms){
;	---------------------------------
; Function delay_ms
; ---------------------------------
_delay_ms_start::
_delay_ms:
;mz80_lib\src\system\system.c:35: for(i=0;i<ms;i++){} // THIS FUNCTION IS VERY INACCURATE
	ld	d,#0x00
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,d
	sub	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
	inc	d
	jr	00103$
	ret
_delay_ms_end::
;mz80_lib\src\system\system.c:38: void delay_sec(char sec){
;	---------------------------------
; Function delay_sec
; ---------------------------------
_delay_sec_start::
_delay_sec:
;mz80_lib\src\system\system.c:40: for(i=0;i<sec;i++) delay_ms(DELAY_1SEC);
	ld	d,#0x00
00103$:
	ld	hl,#2
	add	hl,sp
	ld	a,d
	sub	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
	push	de
	ld	a,#0x14
	push	af
	inc	sp
	call	_delay_ms
	inc	sp
	pop	de
	inc	d
	jr	00103$
	ret
_delay_sec_end::
;mz80_lib\src\system\system.c:43: void end(){
;	---------------------------------
; Function end
; ---------------------------------
_end_start::
_end:
00103$:
	jr	00103$
_end_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
