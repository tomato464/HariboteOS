[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "api010.nas"]				; ソースファイル名情報

		GLOBAL	_api_point

[SECTION .text]

_api_point:		;void api_point(int win, int x, int y, int col);
		PUSH	EDI
		PUSH	ESI
		PUSH	EBX
		MOV		EDX,11
		MOV		EBX,[ESP+16]
		MOV		ESI,[ESP+20]
		MOV		EDI,[ESP+24]
		MOV		EAX,[ESP+28]
		INT		0x40
		POP		EBX
		POP		ESI
		POP		EDI
		RET
