#include "..\..\include\memory\alloc.h"

// MALLOC:

struct heap_meta * find_free_block(struct heap_meta ** last,size_t size){
	struct heap_meta * curr = global_base;
	while(curr && !(curr->free && curr->size >= size)){
		*last = curr;
		curr = curr->next;
	}
	return curr;
}

struct heap_meta * request_space(struct heap_meta * last,size_t size){
	struct heap_meta * block;
	block = sbrk(size+META_SIZE);
	if (block == (void*) -1) return NULL;

	if (last) last->next = block;
	block->size = size;
	block->next = NULL;
	block->free = 0;
	return block;
}

void * malloc(size_t size){
	struct heap_meta * block;
	if(size<=0) return NULL;

	if(!global_base){
		block = request_space(NULL,size);
		if(!block) return NULL;
		global_base = block;
	}else{
		struct heap_meta * last = global_base;
		block = find_free_block(&last,size);
		if(!block){
			block = request_space(last,size);
			if(!block) return NULL;
		}else block->free = 0;
	}
	return (block+1);
}

// FREE:

struct heap_meta * get_block_ptr(void * ptr){
	return (struct heap_meta*) ptr-1;
}

void * free (void * ptr){
	struct heap_meta * block_ptr;
	if(!ptr) return NULL;
	block_ptr = get_block_ptr(ptr);
	block_ptr -> free = 0;
	return NULL;
}