bits	64
section	.text
global	strstr
; char *strstr(const char *haystack, const char *needle);

extern	strlen
extern	strncmp

strstr:
	push	rbp
	mov	rbp, rsp

.while:
	cmp	[rdi], byte 0x0
	je	.fail

	
	push	rdi
	push	rsi
	xchg	rdi, rsi
	call	strlen wrt ..plt
	pop	rsi
	pop	rdi
	
	push	rdi
	push	rsi
	mov	rdx, rax
	call	strncmp wrt ..plt
	pop	rsi
	pop	rdi
	
	cmp	rax, 0x0
	je	.find

	; push	rdi
	; push	rsi
	; push	rax
	; mov	rdx, 5		; message length
	; mov	rsi, str		; message to write
	; mov	rdi, 1			; file descriptor (stdout)
	; mov	rax, 1			; system call number (sys_write)
	; syscall
	; pop	rax
	; pop	rsi
	; pop 	rdi

	inc	rdi
	jmp	.while

.find:
	mov	rax, rdi
	jmp	.exit

.fail:
	mov	rax, 0x0
	jmp	.exit

.exit:
	leave
	ret