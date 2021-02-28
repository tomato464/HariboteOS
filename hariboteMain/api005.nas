[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "api005.nas"]				; ソースファイル名情報

		GLOBAL	_api_putstrwin

[SECTION .text]

_api_putstrwin:	; void api_putstrwin(int win, int x, int y, int col, int len, char *str);
		PUSH	EDI
		PUSH	ESI
		PUSH	EBP
		PUSH	EBX
		MOV		EDX,6
		MOV		EBX,[ESP+20]	;4 * 4 = 16分下に成長してる(PUSHによって)
		MOV		ESI,[ESP+24]
		MOV		EDI,[ESP+28]
		MOV		EAX,[ESP+32]
		MOV		ECX,[ESP+36]
		MOV		EBP,[ESP+40]
		INT		0x40
		POP		EBX
		POP		EBP
		POP		ESI
		POP		EDI
		RET
