#ifndef MALLOC_H
#define MALLOC_H

#include "../std/stddef.h"
#include "heap.h"


// MALLOC:

extern struct heap_meta * find_free_block(struct heap_meta ** last,size_t size);
extern struct heap_meta * request_space(struct heap_meta * last,size_t size);
extern void * malloc(size_t size);

// FREE:

extern struct heap_meta * get_block_ptr(void * ptr);
extern void * free (void * ptr);

#endif
