bits	64
section	.text
global	strcasecmp
; int strcasecmp(const char *s1, const char *s2);

strcasecmp:
	push	rbp
	mov	rbp, rsp
	push	rdi
	push	rsi

	xor	rcx, rcx
	xor	rax, rax
.while:
	mov	cl, [rdi]
	mov	ch, [rsi]
	
	cmp	cl, 0x41
	jge	.changeS1

.next1:
	cmp	ch, 0x41
	jge	.changeS2

.next2:
	cmp 	cl, ch
	je	.true
	jmp	.enddiff

.changeS1:
	cmp	cl, 0x5A
	jg	.next1
	xor	cl, 0x20
	jmp	.next1

.changeS2:
	cmp	ch, 0x5A
	jg	.next2
	xor	ch, 0x20
	jmp	.next2

.true:
	cmp	cl, 0
	je	.end
	inc	rdi
	inc	rsi
	jmp	.while
.end:
	mov	rax, 0
	jmp	.exit
.enddiff:
	cmp	cl, ch
	jb	.endinf
	jmp	.endpos
.endinf:
	sub	ch, cl
	mov	al, ch
	neg	rax
	jmp	.exit
.endpos:
	sub	cl, ch
	mov	al, cl
	jmp	.exit

.exit:
	pop	rsi
	pop	rdi
	leave
	ret