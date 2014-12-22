#include "..\..\..\include\stdlib\math\math.h"

unsigned char div(unsigned char x,unsigned char y){
	unsigned char quo = 0,
				  _x = x,
				  _y = y;

	while(_x>=_y){
		_x-=_y;
		quo++;
	}
	return quo;
}