#include "..\..\..\..\include\io\io.h"

void out(size_c address,size_c data){
	address,data;
	__asm
	    POP DE
        POP BC
        PUSH BC
        PUSH DE
		OUT (C),B
		RET
	__endasm;
}

void out_array(size_c address,size_c * data,int length){
	int i;
	for(i=0;i<length;i++)
		out(address,*data++);
}

void port_out(size_c data){
	data;
	__asm
		OUT (#PIO_OUT),A
	__endasm;
}

void port_out_array(size_c * data, int length){
	int i;
	for(i=0;i<length;i++)
		port_out(*data++);
}

size_c port_in(){
	__asm
		IN A,(PIO_IN)
		LD L,A
		RET
	__endasm;
	return 0; // This will not run
}

size_c* port_in_array(int length){
	length;
	// TODO: ALLOCATE MEMORY AND RETURN THE POINTER OF THE FIRST ELEMENT
	return "";
}
