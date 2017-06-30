bits	64
section	.text
global	my_memcpy

my_memcpy:
	push	rbp
	mov	rbp, rsp

	xor	rcx, rcx
	mov	rax, rdi
next:
	cmp	rcx, rdx
	je	end
	mov	r8b, [rsi]
	mov	[rdi], r8b
	inc	rdi
	inc	rsi
	inc	rcx
	jmp	next
end:
	leave
	ret