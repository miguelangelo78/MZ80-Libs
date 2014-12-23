;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 18:07:59 2014
;--------------------------------------------------------
	.module system
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _out
	.globl _is_init
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
_is_init::
	.ds 1
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
;mz80_lib\src\system\system.c:5: void init_pio(){
;	---------------------------------
; Function init_pio
; ---------------------------------
_init_pio_start::
_init_pio:
;mz80_lib\src\system\system.c:9: __endasm;
	LD A,#130
	OUT (#3),A
	ret
_init_pio_end::
;mz80_lib\src\system\system.c:12: void init_lcd(){
;	---------------------------------
; Function init_lcd
; ---------------------------------
_init_lcd_start::
_init_lcd:
;mz80_lib\src\system\system.c:18: __endasm;
	LD A,#0x0F
	OUT (#2),A
	LD A,#0
	OUT (#6 +8),A
	ret
_init_lcd_end::
;mz80_lib\src\system\system.c:21: void init_io(){
;	---------------------------------
; Function init_io
; ---------------------------------
_init_io_start::
_init_io:
;mz80_lib\src\system\system.c:22: init_pio();
	call	_init_pio
;mz80_lib\src\system\system.c:23: init_lcd();
	jp	_init_lcd
_init_io_end::
;mz80_lib\src\system\system.c:26: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init_start::
_init:
;mz80_lib\src\system\system.c:28: is_init = true;
	ld	hl,#_is_init + 0
	ld	(hl), #0x01
;mz80_lib\src\system\system.c:29: init_io();
	jp	_init_io
_init_end::
;mz80_lib\src\system\system.c:32: void clock_throttle(char option){
;	---------------------------------
; Function clock_throttle
; ---------------------------------
_clock_throttle_start::
_clock_throttle:
;mz80_lib\src\system\system.c:33: out(CLOCK_THROTTLE,option);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x1C
	push	de
	call	_out
	pop	af
	ret
_clock_throttle_end::
;mz80_lib\src\system\system.c:36: void delay_ms(char ms){
;	---------------------------------
; Function delay_ms
; ---------------------------------
_delay_ms_start::
_delay_ms:
;mz80_lib\src\system\system.c:38: for(i=0;i<ms;i++){} // THIS FUNCTION IS VERY INACCURATE
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
;mz80_lib\src\system\system.c:41: void delay_sec(char sec){
;	---------------------------------
; Function delay_sec
; ---------------------------------
_delay_sec_start::
_delay_sec:
;mz80_lib\src\system\system.c:43: for(i=0;i<sec;i++) delay_ms(DELAY_1SEC);
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
;mz80_lib\src\system\system.c:46: void end(){
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
__xinit__is_init:
	.db #0x00	; 0
	.area _CABS (ABS)
