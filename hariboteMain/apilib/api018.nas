[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api018.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_freetimer

[SECTION .text]

_api_freetimer:		;void api_freetimer(int timer);
		PUSH	EBX
		MOV		EDX,19
		MOV		EBX,[ESP+8]
		INT		0x40
		POP		EBX
		RET
