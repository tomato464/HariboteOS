#include <stdio.h>
#include "apilib.h"

#define MAX 1000

void HariMain(void)
{
	char flag[MAX], s[8];
	int i, j;
	for(i = 0; i < MAX; i++){
		flag[i] = 0;
	}
	for(i = 2; i < MAX; i++){
		if(flag[i] == 0){//サインが無いので素数
			sprintf(s, "%d ", i);
			api_putstr0(s);
			for(j = i; j < MAX; j += i){
				flag[j] = i;//倍数にサインを付ける
			}
		}
	}
	api_end();
}
