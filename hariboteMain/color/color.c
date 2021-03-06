#include "apilib.h"

void HariMain(void)
{
	char *buf;
	int win;
	int x, y;
	int r, g, b;

	api_initmalloc();
	buf = api_malloc(144*164);
	win = api_openwin(buf, 144, 164, -1, "color");
	for(y = 0; y < 128; y++){
		for(x = 0; x < 128; x++){
			r = x * 2;
			g = y * 2;
			b = 0;
			buf[ (y + 28) * 144 + (x + 8)] = 16 +  (r/43) + (g/43)*6 + (b/43)*36;
		}
	}
	api_refreshwin(win, 8, 28, 136, 156);
	api_getkey(1);//何かのキー入力を待つ	
	api_end();
}
