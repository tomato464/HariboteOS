#include "apilib.h"

void HariMain(void)
{
	char *buf;
	int win;

	api_initmalloc();
	buf = api_malloc(150*50);
	win = api_openwin(buf, 150, 50, -1, "memoryman");
	api_boxfilwin(win, 8, 36, 141, 43, 6/*blue*/);
	api_putstrwin(win, 18,28, 0, 13, "manage memory");
	for(;;){
		if(api_getkey(1) == 0x0a){//enter
			break;
		}
	}
	api_end();
}
