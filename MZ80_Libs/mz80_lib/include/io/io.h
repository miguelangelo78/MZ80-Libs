#ifndef IO_H
#define IO_H

#include "..\system\system.h"
#include "../std/stddef.h"

extern void out(size_c address,size_c data); 	// OUTPUTS TO ANY PORT ON THE CIRCUIT
extern void out_array(size_c address,size_c * data,int length);
extern void port_out(size_c data); 			// OUTPUTS ONLY TO THE PORTB ON THE CIRCUIT
extern void port_out_array(size_c * data, int length);
extern size_c port_in(); 						// INPUTS FROM PORTA
extern size_c* port_in_array(int length);

#endif
