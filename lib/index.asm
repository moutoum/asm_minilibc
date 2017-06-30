bits	64
section	.text
global	strcasecmp

index:
	push	rbp
	mov	rbp, rsp

while:
	cmp	[rdi], byte 0x0
	pushf
	cmp	[rdi], sil
	mov	rax, rdi
	je	exit
	popf
	mov	rax, 0x0
	je	exit
	jmp	while

exit:
	leave
	ret