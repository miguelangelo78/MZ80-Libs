;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 18:07:59 2014
;--------------------------------------------------------
	.module heap
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _global_base
	.globl _heap_head
	.globl _HEAP
	.globl _sbrk
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_HEAP::
	.ds 1024
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_heap_head::
	.ds 2
_global_base::
	.ds 2
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
;mz80_lib\src\memory\heap.c:11: void * sbrk(size_t size_incr){
;	---------------------------------
; Function sbrk
; ---------------------------------
_sbrk_start::
_sbrk:
;mz80_lib\src\memory\heap.c:12: void * tmp = &HEAP[heap_head];
	ld	de,#_HEAP+0
	ld	hl,(_heap_head)
	add	hl,de
	ld	d,l
	ld	e,h
;mz80_lib\src\memory\heap.c:13: heap_head += size_incr;
	ld	bc,(_heap_head)
	ld	a,c
	ld	hl,#2
	add	hl,sp
	ld	iy,#_heap_head
	add	a, (hl)
	ld	0 (iy),a
	ld	a,b
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy),a
;mz80_lib\src\memory\heap.c:14: return tmp;
	ld	l, d
	ld	h, e
	ret
_sbrk_end::
	.area _CODE
	.area _INITIALIZER
__xinit__heap_head:
	.dw #0x0000
__xinit__global_base:
	.dw #0x0000
	.area _CABS (ABS)
