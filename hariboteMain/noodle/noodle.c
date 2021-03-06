#include <stdio.h>

#include "apilib.h"
void HariMain(void)
{
	char *buf;
	int win, timer;
	int sec = 0, min = 0, hou = 0;
	char s[12];
	
	api_initmalloc();
	buf = api_malloc(150 * 50);
	win = api_openwin(buf, 150, 50, -1, "noodle");
	
	timer = api_alloctimer();
	api_inittimer(timer, 200);

	for(;;){
		sprintf(s, "%5d:%02d:%02d", hou, min, sec);
		api_boxfilwin(win, 28, 27, 115, 41, 7/* white */);
		api_putstrwin(win, 28, 27, 0, 11, s);
		api_settimer(timer, 100);//1sec

		if(api_getkey(1) != 200){
			break;
		}
		sec++;
		if(sec == 60){
			sec = 0;
			min ++;
			if(min == 60){
				min = 0;
				hou ++;
			}
		}
		
	}
	

	api_putstr0("Enjoy your noodle");
	api_end();
}
