[FORMAT "WCOFF"]				; �I�u�W�F�N�g�t�@�C������郂�[�h	
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��
[FILE "api015.nas"]				; �\�[�X�t�@�C�������

		GLOBAL	_api_alloctimer

[SECTION .text]

_api_alloctimer:	;int api_alloctimer(void);
		MOV		EDX,16
		INT		0x40
		RET
