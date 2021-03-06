#include "apilib.h"

void HariMain(void)
{
	int fh;
	char cmdline[30], c, *p;

	api_cmdline(cmdline, 30);
	for(p = cmdline; *p > ' '; p++){
		//スペースが来るまで呼び飛ばす
	}
	for(; *p == ' '; p++){
		//スペースを読み飛ばす
	}
	fh = api_fopen(p);
	if(fh != 0){
		for(;;){
			if(api_fread(&c, 1, fh) == 0){
				break;
			}
			api_putchar(c);
		}
	}else{
		api_putstr0("can't find file\n");
	}
	api_end();
}
