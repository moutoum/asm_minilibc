bits	64
section	.text
global	strncmp

strncmp:
	push	rbp
	mov	rbp, rsp
	xor	rax, rax

.while:
	cmp	rdx, 0x0
	je	.end
	dec	rdx
	mov	cl, [rdi]
	mov	ch, [rsi]
	inc	rdi
	inc	rsi
	cmp	cl, ch
	jne	.diff
	je	.while

.diff:
	jb	.inf
	jmp	.pos

.inf:
	sub	ch, cl
	mov	al, ch
	neg	rax
	jmp	.exit

.pos:
	sub	cl, ch
	mov	al, cl
	jmp	.exit

.end:
	mov	rax, 0x0
	jmp	.exit

.exit:
	leave
	ret