;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 03:03:11 2014
;--------------------------------------------------------
	.module string
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _div
	.globl _strlen
	.globl _strcpy
	.globl _strcat
	.globl _itos
	.globl _itoc
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
;mz80_lib\src\stdlib\string\string.c:3: int strlen(char * str){
;	---------------------------------
; Function strlen
; ---------------------------------
_strlen_start::
_strlen:
;mz80_lib\src\stdlib\string\string.c:5: while(*str++,len++);
	ld	hl,#0x0000
00101$:
	ld	d,l
	ld	e,h
	inc	hl
	ld	a,e
	or	a,d
	jr	NZ,00101$
;mz80_lib\src\stdlib\string\string.c:6: return len;
	ret
_strlen_end::
;mz80_lib\src\stdlib\string\string.c:9: char * strcpy(char *d, char *s){
;	---------------------------------
; Function strcpy
; ---------------------------------
_strcpy_start::
_strcpy:
;mz80_lib\src\stdlib\string\string.c:10: register char *d1 = d;
	pop	bc
	pop	de
	push	de
	push	bc
;mz80_lib\src\stdlib\string\string.c:11: while (	*d1++ = *s++);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a,(bc)
	inc	bc
	ld	(de),a
	inc	de
	or	a, a
	jr	NZ,00101$
;mz80_lib\src\stdlib\string\string.c:12: return d;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
_strcpy_end::
;mz80_lib\src\stdlib\string\string.c:15: char * strcat(char * dest,char *src){
;	---------------------------------
; Function strcat
; ---------------------------------
_strcat_start::
_strcat:
;mz80_lib\src\stdlib\string\string.c:16: char * cp = dest;
	pop	de
	pop	bc
	push	bc
	push	de
;mz80_lib\src\stdlib\string\string.c:17: while(*cp) cp++; 		// FIND END
00101$:
	ld	a,(bc)
	or	a, a
	jr	Z,00112$
	inc	bc
	jr	00101$
;mz80_lib\src\stdlib\string\string.c:18: while(*cp = *src++){cp++;} // COPY IT IN THE END OF 'DEST'
00112$:
	ld	hl, #4
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
00104$:
	ld	a,(de)
	inc	de
	ld	(bc),a
	or	a, a
	jr	Z,00106$
	inc	bc
	jr	00104$
00106$:
;mz80_lib\src\stdlib\string\string.c:19: return dest;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
_strcat_end::
;mz80_lib\src\stdlib\string\string.c:22: char * itos(unsigned char i,char * str,unsigned char radix){
;	---------------------------------
; Function itos
; ---------------------------------
_itos_start::
_itos:
;mz80_lib\src\stdlib\string\string.c:23: char * tmp = str;
	ld	hl, #3
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;mz80_lib\src\stdlib\string\string.c:24: unsigned char _i  = i;
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
;mz80_lib\src\stdlib\string\string.c:26: if(_i==0){ 
	ld	a,d
	or	a, a
	jr	NZ,00111$
;mz80_lib\src\stdlib\string\string.c:27: *tmp++='0'; *tmp = '\0';
	ld	a,#0x30
	ld	(bc),a
	inc	bc
	xor	a, a
	ld	(bc),a
	jr	00106$
;mz80_lib\src\stdlib\string\string.c:30: while(_i>0){
00111$:
00101$:
	ld	a,d
	or	a, a
	jr	Z,00103$
;mz80_lib\src\stdlib\string\string.c:31: *tmp++ = _i%radix+'0';
	push	bc
	push	de
	ld	hl, #9+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar_rrx_s
	pop	af
	ld	a,l
	pop	de
	pop	bc
	add	a, #0x30
	ld	(bc),a
	inc	bc
;mz80_lib\src\stdlib\string\string.c:32: _i=div(_i,radix);
	push	bc
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_div
	pop	af
	pop	bc
	ld	d,l
	jr	00101$
00103$:
;mz80_lib\src\stdlib\string\string.c:34: *tmp = '\0';
	xor	a, a
	ld	(bc),a
00106$:
;mz80_lib\src\stdlib\string\string.c:36: return str;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ret
_itos_end::
;mz80_lib\src\stdlib\string\string.c:39: char itoc(unsigned int i,char * ch){
;	---------------------------------
; Function itoc
; ---------------------------------
_itoc_start::
_itoc:
;mz80_lib\src\stdlib\string\string.c:40: char tmp = i+'0';
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	add	a, #0x30
	ld	d,a
;mz80_lib\src\stdlib\string\string.c:41: *ch = tmp;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl),d
;mz80_lib\src\stdlib\string\string.c:42: return tmp;
	ld	l,d
	ret
_itoc_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
