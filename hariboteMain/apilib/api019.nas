[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api019.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_beep

[SECTION .text]

_api_beep:		;void api_beep(int tone):
		MOV		EDX,20
		MOV		EAX,[ESP+4]
		INT		0x40
		RET
