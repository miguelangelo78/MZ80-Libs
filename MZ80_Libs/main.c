#include "mz80_lib/include/system/system.h"
#include "mz80_lib/include/std/stdio.h"
#include "mz80_lib/include/memory/alloc.h"
#include "mz80_lib/include/std/stdlib.h"
#include "mz80_lib/include/std/string/string.h"

void main(){
    char * str;
	init();
	str = (char *) 0x2000;
    strcpy(str,"It's working, beach");

    lputs("smn");
}
