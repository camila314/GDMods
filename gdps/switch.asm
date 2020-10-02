section .text
%include "gdlib.asm"
extern __Z7getBasev
extern _sendHttp
extern _hookfunc

section .text
global _httpHook

_httpHook:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi

	call _sendHttp

	call __Z7getBasev
	add rax, 0x23e459

	pop rsi
	pop rdi
	pop rbp


	push rbp
	mov rbp, rsp
	push r14
	push rbx
	mov rbx, rsi

	mov r14, rax
	
	mov rax, [rel _hookfunc]
	call rax


	test rbx, rbx
	je .lol
	sub r14, 0x45

_httpHook.lol:
	jmp r14