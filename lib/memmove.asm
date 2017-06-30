bits	64
section	.text
global	memmove
; void *memmove(void *dest, const void *src, size_t n);

memmove:
	push	rbp
	mov	rbp, rsp

	xor	rcx, rcx
	mov	rax, rdi ; save du debut

	cmp	rdx, 0x0
	je	exit
	dec	rdx
	add	rdi, rdx ; on va a la fin de la chaine pour remplir de la fin

while:
	mov	cl, [rsi]
	push	rcx ; PUSH du caractere
	cmp	rdx, 0
	je	destack
	inc	rsi ; on passe au caractere suivant 
	dec	rdx ; on decremente le compteur
	jmp	while

destack:
	pop	rsi
	mov	[rdi], sil
	cmp	rdi, rax
	je	exit
	dec	rdi
	jmp	destack

exit:
	leave
	ret