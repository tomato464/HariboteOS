[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api013.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_closewin

[SECTION .text]

_api_closewin:	;void api_closewin(int win);
		PUSH	EBX
		MOV		EDX,14
		MOV		EBX,[ESP+8]
		INT		0x40
		POP		EBX
		RET
