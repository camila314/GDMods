%include "gdlib.asm"
OBJID equ 69420
section .text
extern _createOriginal
extern _createLabel
global _addObject

_addObject:
    push       rbp                                         ; CODE XREF=_ZN8EditorUI12getCreateBtnEPvii+107, _ZN9PlayLayer4initEPvP11GJGameLevel+5437, _ZN16LevelEditorLayer12createObjectEPviN7cocos2d7CCPointEb+28, sub_1000a28c0+35, sub_10033b720+318
    mov        rbp, rsp
    push       r15
    push       r14
    push       rbx
    push       rax
    mov        r14d, edi
    relcall    0x3b2bc0           ; ObjectToolbox::sharedState()
    mov        rdi, rax                                    ; argument #1 for method _ZN13ObjectToolbox13intKeyToFrameEPvi
    mov        esi, r14d                                   ; argument #2 for method _ZN13ObjectToolbox13intKeyToFrameEPvi
    relcall    0x4173b0       ; ObjectToolbox::intKeyToFrame(void*, int)
    test       r14d, r14d
    je         .exit
    cmp        byte [rax], 0x0
    je .exit

    cmp r14d, 69420

    je .why

    jmp [rel _createOriginal]
.exit:
    xor        ebx, ebx                                    ; CODE XREF=_ZN10GameObject13createWithKeyEi+32, _ZN10GameObject13createWithKeyEi+41, _ZN10GameObject13createWithKeyEi+503
    mov        rax, rbx                                    ; CODE XREF=_ZN10GameObject13createWithKeyEi+512
    add        rsp, 0x8
    pop        rbx
    pop        r14
    pop        r15
    pop        rbp
    ret
.why:
	jmp [rel _createLabel]