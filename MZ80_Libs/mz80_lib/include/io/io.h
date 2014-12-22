#ifndef IO_H
#define IO_H

#include "..\system\system.h"

extern void out(char address,char data); 	// OUTPUTS TO ANY PORT ON THE CIRCUIT
extern void out_array(char address,char * data,int length);
extern void port_out(char data); 			// OUTPUTS ONLY TO THE PORTB ON THE CIRCUIT
extern void port_out_array(char * data, int length);
extern char port_in(); 						// INPUTS FROM PORTA
extern char* port_in_array(int length);

#endif