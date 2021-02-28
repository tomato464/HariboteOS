[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "api009.nas"]				; ソースファイル名情報

		GLOBAL	_api_free

[SECTION .text]

_api_free:		;void	api_free(char *addr, int size);
		PUSH	EBX
		MOV		EDX,10
		MOV		EBX,[CS:0x0020]
		MOV		EAX,[ESP+8]
		MOV		ECX,[ESP+12]
		INT		0x40
		POP		EBX
		RET