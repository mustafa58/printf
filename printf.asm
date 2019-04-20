global printf
section .text:
printf:

	mov	rsi, rdi	; use char from pointer
	xor	al, al		; clear al

L1:	mov	al, [rdi]	; check the length
	test	al, 0xFF	; is it null?
	jz	L2
	inc	rdi
	jmp	L1

L2:	sub	rdi, rsi	; if it is end then save length
	

	mov	rax, 1		; sys_write call number
	mov     rdx, rdi	; number of chars that will put to stdout
	mov	rdi, 1		; write to stdout (fd=1)
syscall
	ret
	;For more information visit:
	;https://stackoverflow.com/questions/8201613/printing-a-character-to-standard-output-in-assembly-x86#

