[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api016.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_inittimer

[SECTION .text]

_api_inittimer:		;void api_inittimer(int timer, int data);
		PUSH	EBX
		MOV		EDX,17
		MOV		EBX,[ESP+8]
		MOV		EAX,[ESP+12]
		INT		0x40
		POP		EBX
		RET
