#include "apilib.h"

void HariMain(void)
{
	int win;
	char buf[150 * 50];
	win = api_openwin(buf, 150, 50, -1, "hello2");
	api_boxfilwin(win, 8, 36, 141, 43, 3/*yellow*/);
	api_putstrwin(win, 28, 28, 0, 12, "Im making OS");
	for(;;){
		if(api_getkey(1) == 0x0a){//enter
			break;
		}
	}
	api_end();
}
