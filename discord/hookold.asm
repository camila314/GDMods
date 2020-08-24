%include "gdlib.asm"
extern _profileOg
extern _base
extern _extractDiscordTag
extern _callback
extern _strncpy

section .text
global _profileHook
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

	lea rdi, [rel sexytag]
	mov rsi, rax
	mov rdx, 20
	call _strncpy

	popall
	pushall

	movss xmm1, dword [rel value_m35p0] ; CODE XREF=_ZN11ProfilePage20loadPageFromUserInfoEPvP11GJUserScore+3705
	mulss xmm1, dword [rbp-0x54] ; argument #3 for method _ZN7cocos2d7CCPointC2EPvff
	lea rbx, [rbp-0x40]
	movss xmm0, xmm1 ; argument #2 for method _ZN7cocos2d7CCPointC2EPvff
	mov rdi, rbx ; argument #1 for method _ZN7cocos2d7CCPointC2EPvff
	relcall 0x137000 ; cocos2d::CCPoint::CCPoint(void*, float, float)
	lea r14, [rbp-0x38]
	lea rsi, [rbp-0x70] ; argument #2 for method _ZNK7cocos2d7CCPointplERKS0_
	mov rdi, r14 ; argument #1 for method _ZNK7cocos2d7CCPointplERKS0_
	mov rdx, rbx ; argument #3 for method _ZNK7cocos2d7CCPointplERKS0_
	relcall 0x1370f0 ; cocos2d::CCPoint::operator+(cocos2d::CCPoint const&) const
	movss xmm0, dword [rbp-0x54]
	addss xmm0, dword [rel value_1p0]
	movss dword [rbp-0x54], xmm0
	lea rdi, [rel icon] ; "gj_twitchIcon_001.png", argument #1 for method _ZN7cocos2d8CCSprite25createWithSpriteFrameNameEPKc
	relcall 0x132dc0 ; cocos2d::CCSprite::createWithSpriteFrameName(char const*)
	lea rcx, [rel _callback] ; argument #4 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor esi, esi ; argument #2 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor r8d, r8d ; argument #5 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov rdi, rax ; argument #1 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov rdx, r12 ; argument #3 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	relcall 0x1253c0 ; CCMenuItemSpriteExtra::create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, void (cocos2d::CCObject::*)(cocos2d::CCObject*))
	mov rbx, rax
	mov rdi, [r12+0x1f8]
	mov rax, [rdi]
	mov rsi, rbx
	call [rax+0x1b8]
	mov rax, [rbx]
	mov r13, [rax+0xb8]
	mov r15, [r12+0x1f8]
	mov rsi, [r12+0x220] ; argument #2 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	lea r12, [rbp-0x68]
	mov rdi, r12 ; argument #1 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	mov rdx, r14 ; argument #3 for method _ZN7cocos2d6CCNode19convertToWorldSpaceEPvRKNS_7CCPointE
	relcall 0x124790 ; cocos2d::CCNode::convertToWorldSpace(void*, cocos2d::CCPoint const&)
	lea r14, [rbp-0x40]
	mov rdi, r14 ; argument #1 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	mov rsi, r15 ; argument #2 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	mov rdx, r12 ; argument #3 for method _ZN7cocos2d6CCNode18convertToNodeSpaceEPvRKNS_7CCPointE
	mov r12, [rbp-0x48]
	relcall 0x124750 ; cocos2d::CCNode::convertToNodeSpace(void*, cocos2d::CCPoint const&)
	mov rdi, rbx
	mov rsi, r14
	call r13
	mov rdi, [r12+0x2d8] ; argument #1 for method _ZN7cocos2d7CCArray9addObjectEPNS_8CCObjectE
	mov rsi, rbx ; argument #2 for method _ZN7cocos2d7CCArray9addObjectEPNS_8CCObjectE
	relcall 0x419f90

.exit:
	popall
	jmp [rel _profileOg]

section .data
value_m35p0: dq -35.00
value_1p0: dq 2.0

; tmp
icon: db "gj_twIcon_001.png", 0

section .bss
	sexytag: resb 20
	has_disc: resb 1
