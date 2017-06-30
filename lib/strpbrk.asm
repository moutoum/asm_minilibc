bits	64
section	.text
global	strpbrk
; char *strpbrk(const char *s, const char *accept);

extern	index

strpbrk:
	push	rbp
	mov	rbp, rsp

.while:
	cmp	[rdi], byte 0x0
	je	.fail

	push	rdi
	push	rsi
	mov	cl, [rdi]
	mov	rdi, rsi
	xor	rsi, rsi
	mov	sil, cl
	call	index wrt ..plt
	pop	rsi
	pop	rdi

	cmp	rax, 0x0
	jne	.find
	inc	rdi
	jmp	.while

.find:
	mov	rax, rdi
	jmp	.exit

.fail:
	mov	rax, 0x0
	jmp	.exit

.exit:
	leave
	ret