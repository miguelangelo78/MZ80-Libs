#include "..\..\include\stdlib\stdlib.h"

void * memcpy (void *dst, const void *src, size_t acount) {
  	char *d = dst;
  	const char *s = src;
	while (acount--){
		*d++ = *s++;
	}
  	return dst;
}