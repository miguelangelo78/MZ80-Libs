#include "..\..\..\include\stdlib\string\string.h"

int strlen(char * str){
	register int len = 0;
	while(*str++,len++);
	return len;
}

char * strcpy(char *d, char *s){
	register char *d1 = d;
	while (	*d1++ = *s++);
  	return d;
}

char * strcat(char * dest,char *src){
	char * cp = dest;
	while(*cp) cp++; 		// FIND END
	while(*cp = *src++){cp++;} // COPY IT IN THE END OF 'DEST'
	return dest;
}

char * itos(unsigned char i,char * str,unsigned char radix){
	char * tmp = str;
	unsigned char _i  = i;
	
	if(_i==0){ 
		*tmp++='0'; *tmp = '\0';
	}else{
	
		while(_i>0){
				*tmp++ = _i%radix+'0';
				_i=div(_i,radix);
		}
		*tmp = '\0';
	}
	return str;
}

char itoc(unsigned int i,char * ch){
	char tmp = i+'0';
	*ch = tmp;
	return tmp;
}