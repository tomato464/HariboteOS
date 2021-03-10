#include"apilib.h"

#include <stdio.h>

int strtol(char *s, char **endp, int base);//標準関数 (stdlib.h)

char *skipspace(char *p);

void textview(int win, int w, int h, int xskip, char *p, int tab, int lang);
char *lineview(int win, int w, int y, int xskip, unsigned char *p, int tab, int lang);
int puttab(int x, int w, int xskip, char *s, int tab);

void HariMain(void)
{
	char winbuf[1024 * 757], txtbuf[240 * 1024];
	int w = 30, h = 10, t = 4, spd_x = 1, spd_y = 1;
	int win, i, j, lang = api_getlang(), xskip = 0;
	char s[30], *p, *q = 0, *r = 0;

	api_cmdline(s, 30);
	for(p = s; *p > ' '; p++){//spaceが来るまで飛ばす
	}

	//コマンドライン解析
	for(; *p != 0 ;){
		p = skipspace(p);
		if(*p == '-'){
			if(p[1] == 'w'){
				w = strtol(p + 2, &p, 0);
				if(w < 20){
					w = 20;
				}
				if(w > 126){
					w = 126;
				}
			}else if(p[1] == 'h'){
				h = strtol(p + 2, &p, 0);
				if(h < 1){
					h = 1;
				}
				if(h > 45){
					h = 45;
				}
			}else if(p[1] == 't'){
				t = strtol(p + 2, &p, 0);
				if(t < 1){
					t = 4;
				}
			}else {
err:
				api_putstr0(" >tview file [-w30 -h10 -t4]\n ");
				api_end();
			}
		}else{//ファイル名発見
			if(q != 0){
				goto err;
			}
			q = p;//qをファイル名の先頭に
			for(; *p > ' '; p++){
				//spaceが来るまで飛ばす
			}
			r = p;//ファイル名直後のspaceにr
		}
	}
	if(q == 0){//ファイル名が無かった
		goto err;
	}

	//windowの準備
	win = api_openwin(winbuf, w * 8 + 16, h * 16 + 37, -1, "tview");
	api_boxfilwin(win, 6, 27, w * 8 + 9, h * 16 + 30, 7);

	//ファイルの読み込み
	*r = 0;
	i = api_fopen(q);

	if(i == 0){
		api_putstr0("file open err.\n");
		api_end();
	}
	j = api_fsize(i,0);

	if(j >= 240 * 1024 - 1){
		j = 240 * 1024 - 2;
	}

	txtbuf[0] = 0x0a;//番兵用の改行コード
	api_fread(txtbuf + 1, j, i);//txtbufにファイルを読み込む
	api_fclose(i);
	txtbuf[j + 1] = 0;//fileの最後を0にしてる
	q = txtbuf + 1;//fileの先頭

	for(p = txtbuf + 1; *p != 0; p++){//処理の簡単のため0x0dを消す
		if(*p != 0x0d){
			*q = *p;
			q++;
		}
	}
	*q = 0;

	p = txtbuf + 1;
	//Main
	for(;;){
		textview(win, w, h, xskip, p, t, 0);//lang = 0
		i = api_getkey(1);
		if(i == 0x0a){
			break;
		}
	}
	api_end();
}

char *skipspace(char *p)
{
	for(;*p == ' '; p++){
		//spaceを飛ばす
	}
	return p;
}

void textview(int win, int w, int h, int xskip, char *p, int tab, int lang)
{
	int i;
	api_boxfilwin(win + 1, 8, 29, w * 8 + 7, h * 16 + 28, 7);
	for(i = 0; i < h; i++){
		p = lineview(win, w, i * 16 + 29, xskip, p, tab, lang);
	}
	api_refreshwin(win, 8, 29, w * 8 + 8, h * 16 + 29);
	return;
}

char *lineview(int win, int w, int y, int xskip, unsigned char *p, int tab, int lang)
{//１行の描写を担当する
	int x = - xskip;//xは描写位置
	char s[130];

	for(;;){
		if(*p == 0){//fileの最後
			break;
		}
		if(*p == 0x0a){//enterの改行
			p++;
			break;
		}
		
		if(lang == 0){//ASCII
			if(*p == 0x09){
				x = puttab(x, w, xskip, s, tab);
			} else {
				if(0 <= x && x < w){
					s[x] = *p;
				}
				s[x] = "a";
				x++;
			}
			p++;
		}

		if(lang == 1){//SJIS
			p ++;
		}
	
		if(lang == 2){
			p++;
		}
	}

	if(x > w){
		x = w;
	}

	if(x > 0){
		s[x] = 0;
		api_putstrwin(win + 1, 8, y, 0, x, s);
	}

	return p;
}

int puttab(int x, int w, int xskip, char *s, int tab)
{
	for(;;){
		if(0 <= x && x < w){
			s[x] = ' ';
		}
		x++;
		if((x + xskip) % tab == 0){
			break;
		}
	}
	return x;
}
