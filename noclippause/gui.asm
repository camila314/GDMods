%macro getaddr 1
	mov r11, [rel _base]
	add r11,  %1
%endmacro
%macro relcall 1
	getaddr %1
	call r11
%endmacro

section .text
global _addNoclip
extern _base
extern _onToggle
extern _ogNoclip

_addNoclip:
    lea        rsi, [rel title]                    ; "Progress Bar", CODE XREF=_ZN10PauseLayer11customSetupEPv+3137, _ZN10PauseLayer11customSetupEPv+3152
    lea        rdi, [rbp-0x70]
    lea        rdx, [rbp-0x50]
    relcall       0x489fc0             ; std::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&)
    relcall       0x1c2b30             ; GameManager::sharedState()

    lea rsi, [rel gvar]
    mov rdi, rax
    relcall 0x1cccd0 ; GameManager::getGameVariable(void**, char const)
    mov ebx, eax

    movss      xmm0, dword [rbp-0x38]
    addss      xmm0, dword [rel float1]
    addss      xmm0, dword [rel float2]                   ; argument #2 for method _ZN7cocos2d7CCPointC2EPvff
    lea        r14, [rbp-0xA8]
    mov        rdi, r14                                    ; argument #1 for method _ZN7cocos2d7CCPointC2EPvff
    movss      xmm1, dword [rbp-0x5C]                    ; argument #3 for method _ZN7cocos2d7CCPointC2EPvff
    relcall       0x137000                  ; cocos2d::CCPoint::CCPoint(void*, float, float)

    xor        bl, 0x1
    movzx      r8d, bl      ; argument #5 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    mov        [rsp+0xf0-0xF0], r14                ; argument #7 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    lea        rdx, [rel _onToggle]                  ; argument #3 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    lea        rsi, [rbp-0x70]                     ; argument #2 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    xor        ecx, ecx                                    ; argument #4 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    mov        rdi, [rbp-0x40]                     ; argument #1 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    mov        r9, r13                                     ; argument #6 for method _ZN10PauseLayer18createToggleButtonEPvSsMN7cocos2d8CCObjectEFvPS1_EbPNS0_6CCMenuENS0_7CCPointE
    relcall       0x20c890 ; PauseLayer::createToggleButton(void*, std::string, void (cocos2d::CCObject::*)(cocos2d*), bool, void*::CCMenu*, void*::CCPoint)
    mov        rax, [rbp-0x70]
    lea        rdi, [rax-0x18]
    ;cmp        rdi, [__ZNSs4_Rep20_S_empty_rep_storageE_1006030d0]
    ;jne        loc_10020bf55

    mov        ecx, 0xffffffff
    lock xadd  dword [rax-8], ecx
    test       ecx, ecx
    jg .rt

    lea        rsi, [rbp-0x30]
    relcall 0x489f78 ; stdstring destroy
_addNoclip.rt:
	jmp [rel _ogNoclip]

section .data
title: db "Noclip", 0
gvar: db "0420", 0

float1: dd 0x43200000
float2: dd 0x42480000


