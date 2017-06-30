bits	64
section	.text
global	strcmp

strcmp:
	push	rbp
	mov	rbp, rsp
	xor	rcx, rcx
	xor	rax, rax
while:
	mov	cl, [rdi]
	mov	ch, [rsi] 
	cmp 	cl, ch
	je	true
	jmp	enddiff
true:
	cmp	cl, 0
	je	end
	inc	rdi
	inc	rsi
	jmp	while
end:
	mov	rax, 0
	jmp	exit
enddiff:
	cmp	cl, ch
	jb	endinf
	jmp	endpos
endinf:
	sub	ch, cl
	mov	al, ch
	neg	rax
	jmp	exit
endpos:
	sub	cl, ch
	mov	al, cl
	jmp	exit
exit:
	leave
	ret