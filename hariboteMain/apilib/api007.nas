[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api007.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_initmalloc

[SECTION .text]

_api_initmalloc:	;void api_initmalloc(void);
		PUSH	EBX
		MOV		EDX,8
		MOV		EBX,[CS:0x0020]	;�R�[�h�Z�O�����g�ɂ����Ă���.hrb�̌`������	malloc�p�̔Ԓn���擾
		MOV		EAX,EBX
		ADD		EAX,32*1024		;32KB�^�X
		MOV		ECX,[CS:0x0000]	;�����.hrb�̌`������f�[�^�Z�O�����g�̑傫��
		SUB		ECX,EAX
		INT		0x40
		POP		EBX
		RET