#include "mz80_lib/include/system/system.h"
#include "mz80_lib/include/io/stdio.h"
#include "mz80_lib/include/memory/alloc.h"
#include "mz80_lib/include/stdlib/stdlib.h"
#include "mz80_lib/include/stdlib/string/string.h"
#include "mz80_lib/include/stdlib/math/math.h"

void main(){
	char * str;
	unsigned char i = 0;

	char * c = 0x2000;
	strcpy(c,"TESTE");

	str=  0x2000;
	for(;;i++){
		itos(i,str,10);
		uart_print_str(str);
		uart_begin();
		uart_print_char(13);
		uart_end();
	}


	for(;;);
}
