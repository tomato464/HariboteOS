[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api003.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_end

[SECTION .text]

_api_end:		; void api_end(void)
		MOV		EDX,4
		INT		0x40
