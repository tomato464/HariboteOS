[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api009.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_free

[SECTION .text]

_api_free:		;void	api_free(char *addr, int size);
		PUSH	EBX
		MOV		EDX,10
		MOV		EBX,[CS:0x0020]
		MOV		EAX,[ESP+8]
		MOV		ECX,[ESP+12]
		INT		0x40
		POP		EBX
		RET