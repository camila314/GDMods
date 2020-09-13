%include "gdlib.asm"
section .text
extern _mapKeys
extern __Z7getBasev
global _dispatchAsm
_dispatchAsm:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	call _mapKeys

	push rax

	call __Z7getBasev
	add rax, 0xe81a4
	
	pop rbx

	pop rdx
	pop rsi
	pop rdi
	pop rbp

	mov rsi, rbx

	push       rbp                                         ; CODE XREF=-[AppController ddhidJoystick:buttonDown:]+134, -[AppController ddhidJoystick:buttonUp:]+97, -[EAGLView keyDown:]+145, -[EAGLView keyUp:]+111
	mov        rbp, rsp
	push       r15
	push       r14
	push       r13
	push       r12
	push       rbx
	sub        rsp, 0x18
	mov r12d, edx

	jmp rax