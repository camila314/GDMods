%include "gdlib.asm"
extern _profileJmp
extern _base
extern _extractDiscordTag
extern _callback
extern _strncpy
extern _createSprite

section .text
global _profileHook
global _popup
global _sexytag
_profileHook:
	pushall

	mov r14, [r12+0x288]
	mov r14, [r14+0x188] ; std string
	;mov r14, [r14] ; char const

	mov r11, rdi
	mov r12, rsi

	mov rdi, r14
	call _extractDiscordTag

	mov byte [rel has_disc], 0
	test rax, rax
	je _profileHook.exit

	mov byte [rel has_disc], 1

	lea rdi, [rel _sexytag]
	mov rsi, rax
	mov rdx, 20
	call _strncpy

	popall
	pushall

	 lea rdi, [rel icon] ; "btn_chatHistory_001.png", argument #1 for method _ZN7cocos2d8CCSprite25createWithSpriteFrameNameEPKc, CODE XREF=_ZN11ProfilePage20loadPageFromUserInfoEPvP11GJUserScore+3262, _ZN11ProfilePage20loadPageFromUserInfoEPvP11GJUserScore+3271
	 relcall 0x132dc0 ; cocos2d::CCSprite::createWithSpriteFrameName(char const*)
	 mov rdi, rax
	 call _createSprite
	 lea rcx, [rel _callback] ; argument #4 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	 xor esi, esi  ; argument #2 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	 xor r8d, r8d  ; argument #5 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	 mov rdi, rax  ; argument #1 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	 mov rdx, r12  ; argument #3 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	 relcall  0x1253c0 ; CCMenuItemSpriteExtra::create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, void (cocos2d::CCObject::*)(cocos2d::CCObject*))
	 mov rbx, rax
	 mov rdi, qword [r12+0x1f8]
	 mov rax, qword [rdi]
	 mov rsi, rbx
	 call  qword [rax+0x1b8]
	 mov rax, qword [rbx]
	 mov rax, qword [rax+0xb8]
	 mov qword [rbp-0x30], rax
     mov r14, qword [r12+0x1f8]
     mov r15, qword [r12+0x220]
     movss xmm0, dword [rbp-0x70]
     mulss xmm0, dword [rel float0] ; argument #2 for method _ZN7cocos2d7CCPointC2EPvff
     movss xmm1, dword [rbp-0x4C]
     mulss xmm1, dword [rel float1] ; argument #3 for method _ZN7cocos2d7CCPointC2EPvff
     lea r12, [rbp-0x68]
     mov rdi, r12  ; argument #1 for method _ZN7cocos2d7CCPointC2EPvff
     relcall  0x137000 ; cocos2d::CCPoint::CCPoint(void*, float, float)
	 lea r13, [rbp-0x40]
	 mov rdi, r13  ; argument #1 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	 mov rsi, r15  ; argument #2 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	 mov rdx, r12  ; argument #3 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	 mov r12, qword [rbp-0x48]
	 relcall  0x124790 ; cocos2d::CCNode::convertToWorldSpace(void*, cocos2d::CCPoint const&)
	 lea r15, [rbp-0x38]
	 mov rdi, r15  ; argument #1 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	 mov rsi, r14  ; argument #2 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	 mov rdx, r13  ; argument #3 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	 relcall  0x124750 ; cocos2d::CCNode::convertToNodeSpace(void*, cocos2d::CCPoint const&)
	 mov rdi, rbx
	 mov rsi, r15
	 call  qword [rbp-0x30]
	 mov rdi, qword [r12+0x2d8] ; argument #1 for method _ZN7cocos2d7CCArray9addObjectEPNS_8CCObjectE
	 mov rsi, rbx  ; argument #2 for method _ZN7cocos2d7CCArray9addObjectEPNS_8CCObjectE
	 relcall  0x419f90 ; cocos2d::CCArray::addObject(cocos2d::CCObject*)

.exit:
	popall

	movss xmm1, [rel OGf1]
	mulss xmm1, [rbp-0x54]
	lea rbx, [rbp-0x40]
	xorps xmm0, xmm0
	mov rdi, rbx
	jmp [rel _profileJmp]


_popup:
	push rbp
	mov rbp,rsp
	push r14
	push rbx
	sub rsp, 0x20

	mov r14,rdi
	mov rax, [rdi]
	mov rbx, [rax+0x1c0]

	lea rsi, [rel popupText]
	lea rdi, [rbp-0x28]
	lea rdx, [rbp-0x20]
	relcall 0x489fc0 ; stdstring
	lea rdi, [rbp-0x28]
	movss xmm0, [rel popup1]
	movss xmm1, [rel popup2]
	relcall 0x157080 ; TextAlertPopup::create(std::string, float, float)

	mov edx, 0x64
	mov rdi, r14
	mov rsi, rax
	call rbx

	mov rax, [rbp-0x28]
	lea rdi, [rax-0x18]
	
	; str cleanup
	mov        ecx, 0xffffffff
	lock xadd  dword [rax-8], ecx
	test       ecx, ecx
	jg .rt

	lea rsi, [rbp-0x18]
	relcall 0x489f78

_popup.rt:
	add rsp, 0x20
	pop rbx
	pop r14
	pop rbp
	ret

section .data

OGf1: dd -35.0

float0: dd 0.93
float1: dd 0.775

popup1: dd 0x3f000000
popup2: dd 0x3f19999a

; tmp
icon: db "gj_twIcon_001.png", 0
popupText: db "Copied Discord Tag", 0

section .bss
	_sexytag: resb 20
	has_disc: resb 1
