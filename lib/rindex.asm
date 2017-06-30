bits	64
section	.text
global	rindex
; char *rindex(const char *s, int c);

rindex:
	push 	rbp
	mov	rbp, rsp

	mov	rax, 0x0

.while:
	cmp	[rdi], byte 0x0
	pushf
	cmp	[rdi], sil
	jne	.while_back
	mov	rax, rdi
	
.while_back:
	popf
	je	.exit
	inc 	rdi
	jmp	.while

.exit:
	leave
	ret