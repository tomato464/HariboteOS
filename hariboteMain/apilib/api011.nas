[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "api011.nas"]				; ソースファイル名情報

		GLOBAL	_api_refreshwin

[SECTION .text]

_api_refreshwin:	;void	api_refreshwin(int win, int x0, int y0, int x1, int y1);
		PUSH	EDI
		PUSH	ESI
		PUSH	EBX
		MOV		EDX,12
		MOV		EBX,[ESP+16] ;push３回分下に成長しているから 3*4 = 12
		MOV		EAX,[ESP+20]
		MOV		ECX,[ESP+24]
		MOV		ESI,[ESP+28]
		MOV		EDI,[ESP+32]
		INT		0x40
		POP		EBX
		POP		ESI
		POP		EDI
		RET
