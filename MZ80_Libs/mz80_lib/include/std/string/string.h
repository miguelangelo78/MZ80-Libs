#ifndef STRING_H
#define STRING_H

#include "..\math\math.h"

#define STR_TERM 0
#define STR_NEWLINE 13

extern int strlen(char * str);
extern char * strcpy(char *d, char *s);
extern char * strcat(char * dst,char *src);

extern char * itos(unsigned char i, char * str,unsigned char radix);
extern char itoc(unsigned int i,char * ch);

#endif
