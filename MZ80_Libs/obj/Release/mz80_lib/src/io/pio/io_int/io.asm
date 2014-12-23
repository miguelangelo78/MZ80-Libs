;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 01:34:28 2014
;--------------------------------------------------------
	.module io
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _out
	.globl _out_array
	.globl _port_out
	.globl _port_out_array
	.globl _port_in
	.globl _port_in_array
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
;mz80_lib\src\io\pio\io_int\io.c:3: void out(char address,char data){
;	---------------------------------
; Function out
; ---------------------------------
_out_start::
_out:
;mz80_lib\src\io\pio\io_int\io.c:11: __endasm;
	PUSH BC
	LD B,D
	LD C,E
	OUT (C),B
	POP BC
	ret
_out_end::
;mz80_lib\src\io\pio\io_int\io.c:14: void out_array(char address,char * data,int length){
;	---------------------------------
; Function out_array
; ---------------------------------
_out_array_start::
_out_array:
;mz80_lib\src\io\pio\io_int\io.c:16: for(i=0;i<length;i++)
	ld	iy,#3
	add	iy,sp
	ld	e,0 (iy)
	ld	d,1 (iy)
	ld	bc,#0x0000
00103$:
	ld	hl,#5
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
;mz80_lib\src\io\pio\io_int\io.c:17: out(address,*data++);
	ld	a,(de)
	ld	h,a
	inc	de
	ld	iy,#3
	add	iy,sp
	ld	0 (iy),e
	ld	1 (iy),d
	push	bc
	push	de
	push	hl
	inc	sp
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_out
	pop	af
	pop	de
	pop	bc
;mz80_lib\src\io\pio\io_int\io.c:16: for(i=0;i<length;i++)
	inc	bc
	jr	00103$
	ret
_out_array_end::
;mz80_lib\src\io\pio\io_int\io.c:20: void port_out(char data){
;	---------------------------------
; Function port_out
; ---------------------------------
_port_out_start::
_port_out:
;mz80_lib\src\io\pio\io_int\io.c:24: __endasm;
	OUT (#0),A
	ret
_port_out_end::
;mz80_lib\src\io\pio\io_int\io.c:27: void port_out_array(char * data, int length){
;	---------------------------------
; Function port_out_array
; ---------------------------------
_port_out_array_start::
_port_out_array:
;mz80_lib\src\io\pio\io_int\io.c:29: for(i=0;i<length;i++)
	pop	bc
	pop	de
	push	de
	push	bc
	ld	bc,#0x0000
00103$:
	ld	hl,#4
	add	hl,sp
	ld	a,c
	sub	a, (hl)
	ld	a,b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00116$
	xor	a, #0x80
00116$:
	ret	P
;mz80_lib\src\io\pio\io_int\io.c:30: port_out(*data++);
	ld	a,(de)
	ld	h,a
	inc	de
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),e
	ld	1 (iy),d
	push	bc
	push	de
	push	hl
	inc	sp
	call	_port_out
	inc	sp
	pop	de
	pop	bc
;mz80_lib\src\io\pio\io_int\io.c:29: for(i=0;i<length;i++)
	inc	bc
	jr	00103$
	ret
_port_out_array_end::
;mz80_lib\src\io\pio\io_int\io.c:33: char port_in(){
;	---------------------------------
; Function port_in
; ---------------------------------
_port_in_start::
_port_in:
;mz80_lib\src\io\pio\io_int\io.c:38: __endasm;
	IN A,(1)
	LD L,A
	RET
;mz80_lib\src\io\pio\io_int\io.c:39: return 0; // This will not run
	ld	l,#0x00
	ret
_port_in_end::
;mz80_lib\src\io\pio\io_int\io.c:42: char* port_in_array(int length){
;	---------------------------------
; Function port_in_array
; ---------------------------------
_port_in_array_start::
_port_in_array:
;mz80_lib\src\io\pio\io_int\io.c:45: return "";
	ld	hl,#___str_0
	ret
_port_in_array_end::
___str_0:
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
