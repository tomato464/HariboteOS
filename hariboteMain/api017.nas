[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api017.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_settimer

[SECTION .text]

_api_settimer:		;void api_settimer(int timer, int time);
		PUSH	EBX
		MOV		EDX,18
		MOV		EBX,[ESP+8]
		MOV		EAX,[ESP+12]
		INT		0x40
		POP		EBX
		RET
