;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Tue Dec 23 03:03:11 2014
;--------------------------------------------------------
	.module alloc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sbrk
	.globl _find_free_block
	.globl _request_space
	.globl _malloc
	.globl _get_block_ptr
	.globl _free
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
;mz80_lib\src\memory\alloc.c:5: struct heap_meta * find_free_block(struct heap_meta ** last,size_t size){
;	---------------------------------
; Function find_free_block
; ---------------------------------
_find_free_block_start::
_find_free_block:
	push	ix
	ld	ix,#0
	add	ix,sp
;mz80_lib\src\memory\alloc.c:6: struct heap_meta * curr = global_base;
	ld	de,(_global_base)
;mz80_lib\src\memory\alloc.c:7: while(curr && !(curr->free && curr->size >= size)){
00103$:
	ld	a,d
	or	a,e
	jr	Z,00105$
	push	de
	pop	iy
	ld	h,4 (iy)
	ld	a, 5 (iy)
	or	a,h
	jr	Z,00104$
	ld	l, e
	ld	h, d
	ld	b,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,b
	sub	a, 6 (ix)
	ld	a,h
	sbc	a, 7 (ix)
	jr	NC,00105$
00104$:
;mz80_lib\src\memory\alloc.c:8: *last = curr;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
;mz80_lib\src\memory\alloc.c:9: curr = curr->next;
	ex	de,hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jr	00103$
00105$:
;mz80_lib\src\memory\alloc.c:11: return curr;
	ex	de,hl
	pop	ix
	ret
_find_free_block_end::
;mz80_lib\src\memory\alloc.c:14: struct heap_meta * request_space(struct heap_meta * last,size_t size){
;	---------------------------------
; Function request_space
; ---------------------------------
_request_space_start::
_request_space:
	push	ix
	ld	ix,#0
	add	ix,sp
;mz80_lib\src\memory\alloc.c:16: block = sbrk(size+META_SIZE);
	ld	a,6 (ix)
	add	a, #0x06
	ld	l,a
	ld	a,7 (ix)
	adc	a, #0x00
	ld	h,a
	push	hl
	call	_sbrk
	pop	af
	ex	de,hl
;mz80_lib\src\memory\alloc.c:17: if (block == (void*) -1) return NULL;
	ld	a,e
	inc	a
	jr	NZ,00102$
	ld	a,d
	inc	a
	jr	NZ,00102$
	ld	hl,#0x0000
	jr	00105$
00102$:
;mz80_lib\src\memory\alloc.c:19: if (last) last->next = block;
	ld	a,5 (ix)
	or	a,4 (ix)
	jr	Z,00104$
	ld	l,4 (ix)
	ld	h,5 (ix)
	inc	hl
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
00104$:
;mz80_lib\src\memory\alloc.c:20: block->size = size;
	ld	l, e
	ld	h, d
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;mz80_lib\src\memory\alloc.c:21: block->next = NULL;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;mz80_lib\src\memory\alloc.c:22: block->free = 0;
	ld	hl,#0x0004
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;mz80_lib\src\memory\alloc.c:23: return block;
	ex	de,hl
00105$:
	pop	ix
	ret
_request_space_end::
;mz80_lib\src\memory\alloc.c:26: void * malloc(size_t size){
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc_start::
_malloc:
	push	af
;mz80_lib\src\memory\alloc.c:28: if(size<=0) return NULL;
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00102$
	ld	hl,#0x0000
	jp	00113$
00102$:
;mz80_lib\src\memory\alloc.c:30: if(!global_base){
	ld	a,(#_global_base + 1)
	ld	hl,#_global_base + 0
	or	a,(hl)
	jr	NZ,00111$
;mz80_lib\src\memory\alloc.c:31: block = request_space(NULL,size);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl,#0x0000
	push	hl
	call	_request_space
	pop	af
	pop	af
	ld	e, l
	ld	d, h
;mz80_lib\src\memory\alloc.c:32: if(!block) return NULL;
	ld	a,d
	or	a,e
	jr	NZ,00104$
	ld	hl,#0x0000
	jr	00113$
00104$:
;mz80_lib\src\memory\alloc.c:33: global_base = block;
	ld	(_global_base),de
	jr	00112$
00111$:
;mz80_lib\src\memory\alloc.c:35: struct heap_meta * last = global_base;
	ld	a,(#_global_base + 0)
	ld	iy,#0
	add	iy,sp
	ld	0 (iy),a
	ld	a,(#_global_base + 1)
	ld	iy,#0
	add	iy,sp
	ld	1 (iy),a
;mz80_lib\src\memory\alloc.c:36: block = find_free_block(&last,size);
	ld	hl,#0x0000
	add	hl,sp
	ld	iy,#4
	add	iy,sp
	ld	c,0 (iy)
	ld	b,1 (iy)
	push	bc
	push	hl
	call	_find_free_block
	pop	af
	pop	af
	ex	de,hl
;mz80_lib\src\memory\alloc.c:37: if(!block){
	ld	a,d
	or	a,e
	jr	NZ,00108$
;mz80_lib\src\memory\alloc.c:38: block = request_space(last,size);
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
	ld	c, a
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_request_space
	pop	af
	pop	af
	ex	de,hl
;mz80_lib\src\memory\alloc.c:39: if(!block) return NULL;
	ld	a,d
	or	a,e
	jr	NZ,00112$
	ld	hl,#0x0000
	jr	00113$
00108$:
;mz80_lib\src\memory\alloc.c:40: }else block->free = 0;
	ld	hl,#0x0004
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00112$:
;mz80_lib\src\memory\alloc.c:42: return (block+1);
	ld	hl,#0x0006
	add	hl,de
00113$:
	pop	af
	ret
_malloc_end::
;mz80_lib\src\memory\alloc.c:47: struct heap_meta * get_block_ptr(void * ptr){
;	---------------------------------
; Function get_block_ptr
; ---------------------------------
_get_block_ptr_start::
_get_block_ptr:
;mz80_lib\src\memory\alloc.c:48: return (struct heap_meta*) ptr-1;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a,c
	add	a,#0xFA
	ld	d,a
	ld	a,b
	adc	a,#0xFF
	ld	e,a
	ld	l, d
	ld	h, e
	ret
_get_block_ptr_end::
;mz80_lib\src\memory\alloc.c:51: void * free (void * ptr){
;	---------------------------------
; Function free
; ---------------------------------
_free_start::
_free:
;mz80_lib\src\memory\alloc.c:53: if(!ptr) return NULL;
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a,(hl)
	jr	NZ,00102$
	ld	hl,#0x0000
	ret
00102$:
;mz80_lib\src\memory\alloc.c:54: block_ptr = get_block_ptr(ptr);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_get_block_ptr
	pop	af
;mz80_lib\src\memory\alloc.c:55: block_ptr -> free = 0;
	ld	bc,#0x0004
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;mz80_lib\src\memory\alloc.c:56: return NULL;
	ld	hl,#0x0000
	ret
_free_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
