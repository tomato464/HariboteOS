#include "apilib.h"

void HariMain(void)
{
	int timer,tone;

	timer = api_alloctimer();
	api_inittimer(timer, 200);
	for(tone = (20 * (10^6)); tone < (20 * (10^3)); tone--){
		//20KHz to 20Hz
		api_beep(tone);
		api_settimer(timer, 1);//0.01 sec
		if(api_getkey(1) != 200){
			break;//ƒ{ƒ^ƒ“‚È‚Ç‚ð‰Ÿ‚³‚ê‚½‚çI—¹
		}
	}
	api_beep(0);
	api_putstr0("did you hear beep enogh?");
	api_end();
}
