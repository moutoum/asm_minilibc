bits	64
section	.text
global	my_strchr

my_strchr:
	push	rbp
	mov	rbp, rsp

	xchg	rdi, rsi
next:
	lodsb
	or	al, al
	jz	fail
	xor	al, dil
	jz	end
	jmp	next
end:
	dec	rsi
	mov 	rax, rsi
	
	leave
	ret
fail:
	mov	rax, 0
	leave
	ret