%include "gdlib.asm"

section .text
global _callback

extern _original2
extern _getSong
extern _getHTML

_callback:
	push rbp
	mov rbp, rsp
	push r15
	push r14
	push r13
	sub rsp, 0x18

	mov r13, rdi
	mov r14, rsi
	mov r15, rdx

	mov rdi, r15 ; it do be a song id tho
	relcall CCString.create

	mov rdi, rax
	relcall CCString.getCString

	mov rdi, rax
	call _getHTML

	mov [rbp-0x8], rax ; has processed data
	mov rdi, rax
	relcall strlen

	mov rdi, r14
	mov rsi, [rbp-0x8]
	mov rdx, rax
	relcall stdstring.assign_charconst

	mov rdi, r13
	mov rsi, r14
	mov rdx, r15
	call [rel _original2]

	add rsp, 0x18
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
