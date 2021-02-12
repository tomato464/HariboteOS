[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "a_nask.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_putchar
		GLOBAL	_api_putstr0
		GLOBAL	_api_end
		GLOBAL	_api_openwin

[SECTION .text]

_api_putchar:	; void api_putchar(int c);
		MOV		EDX,1
		MOV		AL,[ESP+4]		; c
		INT		0x40
		RET

_api_putstr0;	; void api_putstr0(char *s);
		PUSH	EBX
		MOV		EDX,2
		MOV		EBX,[ESP+8]		;s
		INT		0x40
		POP		EBX
		RET

_api_end:		; void api_end(void)
		MOV		EDX,4
		INT		0x40

_api_openwin:	; void api_openwin(char *buf, int xsiz, int ysiz, int col_inv, char *title);
		PUSH	EDI
		PUSH	ESI
		PUSH	EBX
		MOV		EDX,5
		MOV		EBX,[ESP+16] ;edi,esi,ebx��(4 * 3 = 12)���ɐ������Ă��邩��
		MOV		ESI,[ESP+20]
		MOV		EDI,[ESP+24]
		MOV		EAX,[ESP+28]
		MOV		ECX,[ESP+32]
		INT		0x40
		POP		EBX
		POP		ESI
		POP		EDI
		RET
