#include "..\..\..\..\include\io\io.h"

void out(char address,char data){
	address,data;
	__asm
		PUSH BC
		LD B,D
		LD C,E
		OUT (C),B
		POP BC
	__endasm;
}

void out_array(char address,char * data,int length){
	int i;
	for(i=0;i<length;i++)
		out(address,*data++);
}

void port_out(char data){
	data;
	__asm
		OUT (#PIO_OUT),A
	__endasm;
}

void port_out_array(char * data, int length){
	int i;
	for(i=0;i<length;i++)
		port_out(*data++);
}

char port_in(){
	__asm
		IN A,(PIO_IN)
		LD L,A
		RET
	__endasm;
	return 0; // This will not run
}

char* port_in_array(int length){
	length;
	// TODO: ALLOCATE MEMORY AND RETURN THE POINTER OF THE FIRST ELEMENT
	return "";
}