[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "api007.nas"]				; ソースファイル名情報

		GLOBAL	_api_initmalloc

[SECTION .text]

_api_initmalloc:	;void api_initmalloc(void);
		PUSH	EBX
		MOV		EDX,8
		MOV		EBX,[CS:0x0020]	;コードセグメントにおいてある.hrbの形式から	malloc用の番地を取得
		MOV		EAX,EBX
		ADD		EAX,32*1024		;32KBタス
		MOV		ECX,[CS:0x0000]	;これも.hrbの形式からデータセグメントの大きさ
		SUB		ECX,EAX
		INT		0x40
		POP		EBX
		RET