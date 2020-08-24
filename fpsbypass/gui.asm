%include "gdlib.asm"
section .text

extern _fpsCallback
extern _fpsOrig
extern _base

global _fpsSetup
_fpsSetup:
	lea        rdi, [rel text]                    ; "Back"
	movss      xmm0, dword [rel float1]
	mov        esi, 0x50
	xor        edx, edx
	mov        ecx, 0x1
	relcall    0x4fa40            ; ButtonSprite::create(char const*, int, int, float, bool)
	lea        rcx, [rel _fpsCallback]                  ; argument #4 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor        esi, esi                                    ; argument #2 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor        r8d, r8d                                    ; argument #5 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov        rdi, rax                                    ; argument #1 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov        rdx, r14                                    ; argument #3 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	relcall    0x1253c0 ; CCMenuItemSpriteExtra::create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, void (cocos2d::CCObject::*)(cocos2d::CCObject*))
	mov        rbx, rax
	mov        rdi, qword [r14+0x1f8]
	mov        rax, qword [rdi]
	mov        rsi, rbx
	call       qword [rax+0x1b8]
	jmp [rel _fpsOrig]

section .data
float1: dd 2.0
text: db "FPS", 0