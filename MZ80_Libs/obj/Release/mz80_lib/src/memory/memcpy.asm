;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 01:34:29 2014
;--------------------------------------------------------
	.module memcpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
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
;mz80_lib\src\memory\memcpy.c:3: void * memcpy (void *dst, const void *src, size_t acount) {
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy_start::
_memcpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;mz80_lib\src\memory\memcpy.c:4: char *d = dst;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;mz80_lib\src\memory\memcpy.c:5: const char *s = src;
	ld	e,6 (ix)
	ld	d,7 (ix)
;mz80_lib\src\memory\memcpy.c:6: while (acount--){
	ld	c,8 (ix)
	ld	b,9 (ix)
00101$:
	ld	h,c
	ld	l,b
	dec	bc
	ld	a,l
	or	a,h
	jr	Z,00103$
;mz80_lib\src\memory\memcpy.c:7: *d++ = *s++;
	ld	a,(de)
	inc	de
	pop	hl
	push	hl
	ld	(hl),a
	inc	-2 (ix)
	jr	NZ,00101$
	inc	-1 (ix)
	jr	00101$
00103$:
;mz80_lib\src\memory\memcpy.c:9: return dst;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	sp, ix
	pop	ix
	ret
_memcpy_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
