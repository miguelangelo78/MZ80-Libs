#ifndef HEAP_H
#define HEAP_H
#include "..\types\stddef.h"

extern int heap_head; // INDEX OF THE HEAP'S HEAD
extern void * global_base; // LAST BLOCK
extern void * sbrk(size_t size_incr);

#define META_SIZE sizeof(struct heap_meta)
struct heap_meta{
	size_t size;
	struct heap_meta * next;
	int free;
};

#endif