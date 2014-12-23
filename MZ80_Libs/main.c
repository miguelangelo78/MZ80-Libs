#include "mz80_lib/include/system/system.h"
#include "mz80_lib/include/std/stdio.h"
#include "mz80_lib/include/memory/alloc.h"
#include "mz80_lib/include/std/stdlib.h"
#include "mz80_lib/include/std/string/string.h"
#include "mz80_lib/include/std/math/math.h"
#include "mz80_lib/include/std/stdarg.h"
#include "mz80_lib/include/std/stdbool.h"

void main(){
    char * str;
	unsigned char i = 1;
    init();
	str = (char *) 0x2000;
    strcpy(str,"COPIED");
    puts("testa");
    lcd_print_str("teste");
}
