bits 64	
section .text
global strlen

strlen:
	push	rbp
	mov	rbp, rsp

	xor 	rax, rax
	mov 	rsi, rdi
next:
	cmp	byte [rdi], 0
	je	end
	inc	rax
	inc	rdi
	jmp	next
end:
	leave
	ret