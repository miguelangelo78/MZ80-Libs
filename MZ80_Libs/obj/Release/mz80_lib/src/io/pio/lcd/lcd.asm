;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Apr  5 2014) (MINGW64)
; This file was generated Wed Dec 24 00:19:33 2014
;--------------------------------------------------------
	.module lcd
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _out
	.globl __y
	.globl __x
	.globl _times
	.globl _lcd_print_char
	.globl _lcd_print_str
	.globl _lcd_clrscr
	.globl _lcd_goto
	.globl _lcd_shift
	.globl _lcd_shift_cur
	.globl _lcd_scroll
	.globl _lcd_scroll_cur
	.globl _lcd_goto_orig
	.globl _lcd_change_dir
	.globl _lcd_reset
	.globl _lcd_toggle
	.globl _lcd_instruction
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_times::
	.ds 2
__x::
	.ds 2
__y::
	.ds 2
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
;mz80_lib\src\io\pio\lcd\lcd.c:3: void lcd_print_char(size_c data){
;	---------------------------------
; Function lcd_print_char
; ---------------------------------
_lcd_print_char_start::
_lcd_print_char:
;mz80_lib\src\io\pio\lcd\lcd.c:4: out(PIO_LCD_DAT,data);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x06
	push	de
	call	_out
	pop	af
	ret
_lcd_print_char_end::
;mz80_lib\src\io\pio\lcd\lcd.c:7: void lcd_print_str(size_c * str){
;	---------------------------------
; Function lcd_print_str
; ---------------------------------
_lcd_print_str_start::
_lcd_print_str:
;mz80_lib\src\io\pio\lcd\lcd.c:8: while(1)
	pop	bc
	pop	de
	push	de
	push	bc
00105$:
;mz80_lib\src\io\pio\lcd\lcd.c:9: if(*str=='\0') return;
	ld	a,(de)
	or	a, a
	ret	Z
;mz80_lib\src\io\pio\lcd\lcd.c:10: else out(PIO_LCD_DAT,*str++);
	inc	de
	push	de
	ld	d,a
	ld	e,#0x06
	push	de
	call	_out
	pop	af
	pop	de
	jr	00105$
	ret
_lcd_print_str_end::
;mz80_lib\src\io\pio\lcd\lcd.c:13: void lcd_clrscr(){
;	---------------------------------
; Function lcd_clrscr
; ---------------------------------
_lcd_clrscr_start::
_lcd_clrscr:
;mz80_lib\src\io\pio\lcd\lcd.c:14: lcd_reset(); // send instructions to clear the LCD / reset the LCD
	jp	_lcd_reset
_lcd_clrscr_end::
;mz80_lib\src\io\pio\lcd\lcd.c:18: void lcd_goto(size_c x,size_c y){
;	---------------------------------
; Function lcd_goto
; ---------------------------------
_lcd_goto_start::
_lcd_goto:
;mz80_lib\src\io\pio\lcd\lcd.c:19: _x = x;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#__x + 0),a
	ld	hl,#__x + 1
	ld	(hl), #0x00
;mz80_lib\src\io\pio\lcd\lcd.c:20: _y = y;
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	ld	(#__y + 0),a
	ld	hl,#__y + 1
	ld	(hl), #0x00
;mz80_lib\src\io\pio\lcd\lcd.c:21: if(_y==0) _y = 1;
	ld	a,(#__y + 1)
	ld	hl,#__y + 0
	or	a,(hl)
	jr	NZ,00102$
	ld	hl,#__y + 0
	ld	(hl), #0x01
	ld	hl,#__y + 1
	ld	(hl), #0x00
00102$:
;mz80_lib\src\io\pio\lcd\lcd.c:22: times = _x + _y * LCD_COLMAX;
	ld	bc,(__y)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	d,l
	ld	e,h
	ld	hl,#_times
	ld	a,(#__x + 0)
	add	a, d
	ld	(hl),a
	ld	a,(#__x + 1)
	adc	a, e
	inc	hl
	ld	(hl),a
;mz80_lib\src\io\pio\lcd\lcd.c:24: lcd_change_dir(LCD_RIGHT); // change write direction to right
	xor	a, a
	push	af
	inc	sp
	call	_lcd_change_dir
	inc	sp
;mz80_lib\src\io\pio\lcd\lcd.c:25: lcd_goto_orig();           // go to origin first
	call	_lcd_goto_orig
;mz80_lib\src\io\pio\lcd\lcd.c:28: while(times--) lcd_shift_cur(LCD_RIGHT);
00103$:
	ld	de,(_times)
	ld	hl,(_times)
	dec	hl
	ld	(_times),hl
	ld	a,d
	or	a,e
	ret	Z
	xor	a, a
	push	af
	inc	sp
	call	_lcd_shift_cur
	inc	sp
	jr	00103$
	ret
_lcd_goto_end::
;mz80_lib\src\io\pio\lcd\lcd.c:31: void lcd_shift(bool side){
;	---------------------------------
; Function lcd_shift
; ---------------------------------
_lcd_shift_start::
_lcd_shift:
;mz80_lib\src\io\pio\lcd\lcd.c:32: if(side)    lcd_instruction(LCD_DSHL); // SHIFT LEFT
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
	ld	a,#0x1C
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
00102$:
;mz80_lib\src\io\pio\lcd\lcd.c:33: else        lcd_instruction(LCD_DSHR); // SHIFT RIGHT
	ld	a,#0x18
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_shift_end::
;mz80_lib\src\io\pio\lcd\lcd.c:36: void lcd_shift_cur(bool side){
;	---------------------------------
; Function lcd_shift_cur
; ---------------------------------
_lcd_shift_cur_start::
_lcd_shift_cur:
;mz80_lib\src\io\pio\lcd\lcd.c:37: if(side)    lcd_instruction(LCD_SHR); // SHIFT RIGHT
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
	ld	a,#0x10
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
00102$:
;mz80_lib\src\io\pio\lcd\lcd.c:38: else        lcd_instruction(LCD_SHL); // SHIFT LEFT
	ld	a,#0x14
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_shift_cur_end::
;mz80_lib\src\io\pio\lcd\lcd.c:41: void lcd_scroll(bool side,size_c times){
;	---------------------------------
; Function lcd_scroll
; ---------------------------------
_lcd_scroll_start::
_lcd_scroll:
;mz80_lib\src\io\pio\lcd\lcd.c:43: size_c i,_times = times;
	ld	iy,#3
	add	iy,sp
	ld	h,0 (iy)
;mz80_lib\src\io\pio\lcd\lcd.c:45: for(i=0;i<_times;i++) lcd_shift(side);
	ld	l,#0x00
00103$:
	ld	a,l
	sub	a, h
	ret	NC
	push	hl
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_lcd_shift
	inc	sp
	pop	hl
	inc	l
	jr	00103$
	ret
_lcd_scroll_end::
;mz80_lib\src\io\pio\lcd\lcd.c:48: void lcd_scroll_cur(bool side,size_c times){
;	---------------------------------
; Function lcd_scroll_cur
; ---------------------------------
_lcd_scroll_cur_start::
_lcd_scroll_cur:
;mz80_lib\src\io\pio\lcd\lcd.c:50: size_c i,_times = times;
	ld	iy,#3
	add	iy,sp
	ld	h,0 (iy)
;mz80_lib\src\io\pio\lcd\lcd.c:51: for(i=0;i<_times;i++) lcd_shift_cur(side);
	ld	l,#0x00
00103$:
	ld	a,l
	sub	a, h
	ret	NC
	push	hl
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_lcd_shift_cur
	inc	sp
	pop	hl
	inc	l
	jr	00103$
	ret
_lcd_scroll_cur_end::
;mz80_lib\src\io\pio\lcd\lcd.c:54: void lcd_goto_orig(){
;	---------------------------------
; Function lcd_goto_orig
; ---------------------------------
_lcd_goto_orig_start::
_lcd_goto_orig:
;mz80_lib\src\io\pio\lcd\lcd.c:55: lcd_instruction(LCD_ORIGIN);
	ld	a,#0x02
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_goto_orig_end::
;mz80_lib\src\io\pio\lcd\lcd.c:58: void lcd_change_dir(bool side){
;	---------------------------------
; Function lcd_change_dir
; ---------------------------------
_lcd_change_dir_start::
_lcd_change_dir:
;mz80_lib\src\io\pio\lcd\lcd.c:59: if(side) lcd_instruction(LCD_DIRR); // WRITE RIGHT
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
	ld	a,#0x04
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
00102$:
;mz80_lib\src\io\pio\lcd\lcd.c:60: else lcd_instruction(LCD_DIRL);     // WRITE LEFT
	ld	a,#0x06
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_change_dir_end::
;mz80_lib\src\io\pio\lcd\lcd.c:63: void lcd_reset(){
;	---------------------------------
; Function lcd_reset
; ---------------------------------
_lcd_reset_start::
_lcd_reset:
;mz80_lib\src\io\pio\lcd\lcd.c:64: lcd_instruction(LCD_RESET);
	ld	a,#0x01
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_reset_end::
;mz80_lib\src\io\pio\lcd\lcd.c:67: void lcd_toggle(bool onoff){
;	---------------------------------
; Function lcd_toggle
; ---------------------------------
_lcd_toggle_start::
_lcd_toggle:
;mz80_lib\src\io\pio\lcd\lcd.c:68: if(onoff) lcd_instruction(LCD_ON);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00102$
	ld	a,#0x0C
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
00102$:
;mz80_lib\src\io\pio\lcd\lcd.c:69: else lcd_instruction(LCD_OFF);
	ld	a,#0x08
	push	af
	inc	sp
	call	_lcd_instruction
	inc	sp
	ret
_lcd_toggle_end::
;mz80_lib\src\io\pio\lcd\lcd.c:72: void lcd_instruction(size_c ins){
;	---------------------------------
; Function lcd_instruction
; ---------------------------------
_lcd_instruction_start::
_lcd_instruction:
;mz80_lib\src\io\pio\lcd\lcd.c:73: out(PIO_LCD_INS,ins);
	ld	hl, #2+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x02
	push	de
	call	_out
	pop	af
	ret
_lcd_instruction_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
