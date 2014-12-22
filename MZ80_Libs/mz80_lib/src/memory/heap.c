#ifndef HEAP_SIZE
#define HEAP_SIZE 1024
#endif

#include "..\..\include\memory\heap.h"

char HEAP[HEAP_SIZE];
int heap_head = 0; // INDEX OF THE HEAP'S HEAD
void * global_base = NULL; // LAST BLOCK

void * sbrk(size_t size_incr){
	void * tmp = &HEAP[heap_head];
	heap_head += size_incr;
	return tmp;
}