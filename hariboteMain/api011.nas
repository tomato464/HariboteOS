[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api011.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_refreshwin

[SECTION .text]

_api_refreshwin:	;void	api_refreshwin(int win, int x0, int y0, int x1, int y1);
		PUSH	EDI
		PUSH	ESI
		PUSH	EBX
		MOV		EDX,12
		MOV		EBX,[ESP+16] ;push�R�񕪉��ɐ������Ă��邩�� 3*4 = 12
		MOV		EAX,[ESP+20]
		MOV		ECX,[ESP+24]
		MOV		ESI,[ESP+28]
		MOV		EDI,[ESP+32]
		INT		0x40
		POP		EBX
		POP		ESI
		POP		EDI
		RET
