[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api008.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_malloc

[SECTION .text]

_api_malloc:		;char *api_malloc(int size);
		PUSH	EBX
		MOV		EDX,9
		MOV		EBX,[CS:0x0020]
		MOV		ECX,[ESP+8]	;PUSH��񂠂邩��1*4bit�����ɐ���
		INT		0x40
		POP		EBX
		RET
