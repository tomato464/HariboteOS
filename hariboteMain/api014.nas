[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api014.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_getkey

[SECTION .text]

_api_getkey:	;int	api_getkey(int mode);
		MOV		EDX,15
		MOV		EAX,[ESP+4]
		INT		0x40
		RET