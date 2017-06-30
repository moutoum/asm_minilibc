bits	64
section	.text
global	strcspn
; size_t strcspn(const char *s, const char *reject);

extern	index

strcspn:
	push 	rbp
	mov	rbp, rsp

	xor	rcx, rcx

.while:
	cmp	[rdi], byte 0x0
	je	.exit

	push	rdi
	push	rsi
	push	rcx
	mov	cl, [rdi]
	mov	rdi, rsi
	xor	rsi, rsi
	mov	sil, cl
	call	index wrt ..plt
	pop	rcx
	pop	rsi
	pop	rdi

	cmp	rax, 0x0
	jne	.exit
	inc	rcx
	inc	rdi
	jmp	.while

.exit:
	mov	rax, rcx
	leave
	ret