bits 	64
section	.text
global	my_memset

my_memset:
	push	rbp
	mov	rbp, rsp

	xchg	rdi, rsi
	mov	rax, rsi
	xor	rcx, rcx
next:
	cmp	rcx, rdx
	je	end
	mov	[rsi], dil
	inc 	rsi
	inc	rcx
	jmp	next
end:
	leave
	ret