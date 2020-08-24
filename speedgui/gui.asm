%include "gdlib.asm"
extern _base
extern _setSpeed
extern _pauseOriginal
section .text
global _addBtn

_addBtn:
	lea rdi, [rel img]                    ; "GJ_playBtn2_001.png", argument #1 for method _ZN7cocos2d8CCSprite25createWithSpriteFrameNameEPKc
	relcall       0x132dc0 ; cocos2d::CCSprite::createWithSpriteFrameName(char const*)
	lea        rcx, [rel _setSpeed]                  ; argument #4 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor        esi, esi                                    ; argument #2 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	xor        r8d, r8d                                    ; argument #5 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov        rdi, rax                                    ; argument #1 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	mov        rdx, r14                                    ; argument #3 for method _ZN21CCMenuItemSpriteExtra6createEPN7cocos2d6CCNodeES2_PNS0_8CCObjectEMS3_FvS4_E
	relcall       0x1253c0 ; CCMenuItemSpriteExtra::create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, void (cocos2d::CCObject::*)(cocos2d::CCObject*))
	mov        rcx, [r12]
	mov        rdi, r12
	;mov        qword [rbp+var_98], rax
	mov        rsi, rax
	call       qword [rcx+0x1b8]
	jmp [rel _pauseOriginal]

section .data
img: db "boost_04_001.png", 0