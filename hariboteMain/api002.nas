[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api002.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_putstr0

[SECTION .text]

_api_putstr0;	; void api_putstr0(char *s);
		PUSH	EBX
		MOV		EDX,2
		MOV		EBX,[ESP+8]		;s
		INT		0x40
		POP		EBX
		RET
