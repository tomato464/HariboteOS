#include "apilib.h"

void HariMain(void)
{
	char *buf;
	int win;

	api_initmalloc();
	buf = api_malloc(150*100);
	win = api_openwin(buf, 150, 100, -1, "star1");
	api_boxfilwin(win, 10, 20, 140, 90, 0);
	api_point(win, 30, 40, 3);
	api_end();
}

