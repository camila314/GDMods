	.const
__ZStL19piecewise_construct:
	.space 1
	.zerofill __DATA,__bss2,__ZN7cocos2dL11CCPointZeroE,8,2
	.zerofill __DATA,__bss2,__ZN7cocos2dL10CCSizeZeroE,8,2
	.zerofill __DATA,__bss4,__ZN7cocos2dL10CCRectZeroE,16,4
	.const
__ZStL13allocator_arg:
	.space 1
__ZStL6ignore:
	.space 1
	.static_data
__ZStL8__ioinit:
	.space	1
	.zerofill __DATA,__bss4,__ZN7cocos2d2uiL10MarginZeroE,16,4
	.globl _play
	.zerofill __DATA,__pu_bss3,_play,8,3
	.globl _base
	.zerofill __DATA,__pu_bss3,_base,8,3
	.globl _createOriginal
	.zerofill __DATA,__pu_bss3,_createOriginal,8,3
	.globl _createLabel
	.zerofill __DATA,__pu_bss3,_createLabel,8,3
	.cstring
LC0:
	.ascii "yoooo\0"
	.text
	.globl __Z6cringePN7cocos2d8CCObjectE
__Z6cringePN7cocos2d8CCObjectE:
LFB4722:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	leaq	LC0(%rip), %rdi
	call	_puts
	leave
LCFI2:
	ret
LFE4722:
	.cstring
LC1:
	.ascii "cringe lol\0"
LC2:
	.ascii "bigFont.fnt\0"
	.text
	.globl __Z7onetimePvRKN7cocos2d7CCPointE
__Z7onetimePvRKN7cocos2d7CCPointE:
LFB4723:
	pushq	%rbp
LCFI3:
	movq	%rsp, %rbp
LCFI4:
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	_play(%rip), %rax
	movq	%rax, %rdi
	call	__ZN12ModContainer7disableEv
	call	__Z7getBasev
	leaq	1274320(%rax), %rdx
	movq	_play(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	__ZN12ModContainer11getOriginalEl
	movq	%rax, %rcx
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
	call	__ZN7cocos2d10CCDirector14sharedDirectorEv
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	__ZN7cocos2d10CCDirector10getWinSizeEv
	call	__ZN21MoreVideoOptionsLayer6createEv
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$544, %esi
	movq	%rax, %rdi
	call	__ZN5GDObj9valOffsetEl
	movq	%rax, -16(%rbp)
	leaq	LC1(%rip), %rsi
	leaq	LC2(%rip), %rdi
	call	__ZN7cocos2d13CCLabelBMFont6createEPKcS2_
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %eax
	movl	LC3(%rip), %edx
	movd	%eax, %xmm0
	movd	%edx, %xmm2
	divss	%xmm2, %xmm0
	movl	LC4(%rip), %eax
	movd	%eax, %xmm1
	addss	%xmm0, %xmm1
	movl	-32(%rbp), %eax
	movl	LC3(%rip), %edx
	movd	%eax, %xmm0
	movd	%edx, %xmm3
	divss	%xmm3, %xmm0
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN7cocos2d7CCPointC1Eff
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	addq	$152, %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$400, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12FLAlertLayer4showEv
	leave
LCFI5:
	ret
LFE4723:
	.cstring
LC5:
	.ascii "global\0"
LC6:
	.ascii "test\0"
LC7:
	.ascii "Custom Object\0"
	.text
	.globl __Z6injectv
__Z6injectv:
LFB4724:
	pushq	%rbp
LCFI6:
	movq	%rsp, %rbp
LCFI7:
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
LCFI8:
LEHB0:
	call	__Z7getBasev
	movq	%rax, _base(%rip)
	call	__Z7getBasev
	addq	$3099919, %rax
	movq	%rax, _createOriginal(%rip)
	call	__Z7getBasev
	addq	$3100361, %rax
	movq	%rax, _createLabel(%rip)
	movl	$40, %edi
	call	__Znwm
LEHE0:
	movq	%rax, %rbx
	leaq	LC5(%rip), %rdx
	leaq	LC6(%rip), %rsi
	movq	%rbx, %rdi
LEHB1:
	call	__ZN12ModContainerC1EPKcS1_
LEHE1:
	movq	%rbx, _play(%rip)
LEHB2:
	call	__Z7getBasev
	leaq	1274320(%rax), %rcx
	movq	_play(%rip), %rax
	leaq	__Z7onetimePvRKN7cocos2d7CCPointE(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__ZN12ModContainer12registerHookElPFvvE
	movl	$40, %edi
	call	__Znwm
LEHE2:
	movq	%rax, %rbx
	leaq	LC5(%rip), %rdx
	leaq	LC7(%rip), %rsi
	movq	%rbx, %rdi
LEHB3:
	call	__ZN12ModContainerC1EPKcS1_
LEHE3:
	movq	%rbx, -24(%rbp)
LEHB4:
	call	__Z7getBasev
	leaq	3099872(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	_addObject@GOTPCREL(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__ZN12ModContainer12registerHookElPFvvE
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12ModContainer6enableEv
	movq	_play(%rip), %rax
	movq	%rax, %rdi
	call	__ZN12ModContainer6enableEv
	jmp	L8
L6:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rax
	movq	%rax, %rdi
	call	__Unwind_Resume
L7:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rax
	movq	%rax, %rdi
	call	__Unwind_Resume
LEHE4:
L8:
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
LCFI9:
	ret
LFE4724:
	.section __DATA,__gcc_except_tab
GCC_except_table0:
LLSDA4724:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$0,LEHB0-LFB4724
	.long L$set$0
	.set L$set$1,LEHE0-LEHB0
	.long L$set$1
	.long	0
	.byte	0
	.set L$set$2,LEHB1-LFB4724
	.long L$set$2
	.set L$set$3,LEHE1-LEHB1
	.long L$set$3
	.set L$set$4,L6-LFB4724
	.long L$set$4
	.byte	0
	.set L$set$5,LEHB2-LFB4724
	.long L$set$5
	.set L$set$6,LEHE2-LEHB2
	.long L$set$6
	.long	0
	.byte	0
	.set L$set$7,LEHB3-LFB4724
	.long L$set$7
	.set L$set$8,LEHE3-LEHB3
	.long L$set$8
	.set L$set$9,L7-LFB4724
	.long L$set$9
	.byte	0
	.set L$set$10,LEHB4-LFB4724
	.long L$set$10
	.set L$set$11,LEHE4-LEHB4
	.long L$set$11
	.long	0
	.byte	0
	.text
__Z41__static_initialization_and_destruction_0ii:
LFB5293:
	pushq	%rbp
LCFI10:
	movq	%rsp, %rbp
LCFI11:
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	L9
	cmpl	$65535, -8(%rbp)
	jne	L9
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	leaq	__ZN7cocos2dL11CCPointZeroE(%rip), %rdi
	call	__ZN7cocos2d7CCPointC1Eff
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	leaq	__ZN7cocos2dL10CCSizeZeroE(%rip), %rdi
	call	__ZN7cocos2d6CCSizeC1Eff
	pxor	%xmm3, %xmm3
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	leaq	__ZN7cocos2dL10CCRectZeroE(%rip), %rdi
	call	__ZN7cocos2d6CCRectC1Effff
	leaq	__ZStL8__ioinit(%rip), %rdi
	call	__ZNSt8ios_base4InitC1Ev
	leaq	___dso_handle(%rip), %rdx
	leaq	__ZStL8__ioinit(%rip), %rsi
	movq	__ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	___cxa_atexit
	leaq	__ZN7cocos2d2uiL10MarginZeroE(%rip), %rdi
	call	__ZN7cocos2d2ui6MarginC1Ev
L9:
	leave
LCFI12:
	ret
LFE5293:
	.const
	.align 2
__ZL20TIXML2_MAJOR_VERSION:
	.long	1
	.align 2
__ZL20TIXML2_MINOR_VERSION:
	.space 4
	.align 2
__ZL20TIXML2_PATCH_VERSION:
	.long	9
	.align 2
__ZN7cocos2dL10kMaxLogLenE:
	.long	16384
__ZN7cocos2dL7ccWHITEE:
	.byte	-1
	.byte	-1
	.byte	-1
__ZN7cocos2dL8ccYELLOWE:
	.byte	-1
	.byte	-1
	.byte	0
__ZN7cocos2dL6ccBLUEE:
	.byte	0
	.byte	0
	.byte	-1
__ZN7cocos2dL7ccGREENE:
	.byte	0
	.byte	-1
	.byte	0
__ZN7cocos2dL5ccREDE:
	.byte	-1
	.byte	0
	.byte	0
__ZN7cocos2dL9ccMAGENTAE:
	.byte	-1
	.byte	0
	.byte	-1
__ZN7cocos2dL7ccBLACKE:
	.space 3
__ZN7cocos2dL8ccORANGEE:
	.byte	-1
	.byte	127
	.byte	0
__ZN7cocos2dL6ccGRAYE:
	.byte	-90
	.byte	-90
	.byte	-90
	.align 2
__ZN7cocos2dL19kCCBlendFuncDisableE:
	.long	1
	.long	0
	.text
__GLOBAL__sub_I_playObj.cpp:
LFB5302:
	pushq	%rbp
LCFI13:
	movq	%rsp, %rbp
LCFI14:
	movl	$65535, %esi
	movl	$1, %edi
	call	__Z41__static_initialization_and_destruction_0ii
	popq	%rbp
LCFI15:
	ret
LFE5302:
	.literal4
	.align 2
LC3:
	.long	1073741824
	.align 2
LC4:
	.long	1122238464
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$12,LECIE1-LSCIE1
	.long L$set$12
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zPLR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x7
	.byte	0x9b
	.long	___gxx_personality_v0+4@GOTPCREL
	.byte	0x10
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$13,LEFDE1-LASFDE1
	.long L$set$13
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB4722-.
	.set L$set$14,LFE4722-LFB4722
	.quad L$set$14
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$15,LCFI0-LFB4722
	.long L$set$15
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$16,LCFI1-LCFI0
	.long L$set$16
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$17,LCFI2-LCFI1
	.long L$set$17
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$18,LEFDE3-LASFDE3
	.long L$set$18
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB4723-.
	.set L$set$19,LFE4723-LFB4723
	.quad L$set$19
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$20,LCFI3-LFB4723
	.long L$set$20
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$21,LCFI4-LCFI3
	.long L$set$21
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$22,LCFI5-LCFI4
	.long L$set$22
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$23,LEFDE5-LASFDE5
	.long L$set$23
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB4724-.
	.set L$set$24,LFE4724-LFB4724
	.quad L$set$24
	.byte	0x8
	.quad	LLSDA4724-.
	.byte	0x4
	.set L$set$25,LCFI6-LFB4724
	.long L$set$25
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$26,LCFI7-LCFI6
	.long L$set$26
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$27,LCFI8-LCFI7
	.long L$set$27
	.byte	0x8c
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$28,LCFI9-LCFI8
	.long L$set$28
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$29,LEFDE7-LASFDE7
	.long L$set$29
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB5293-.
	.set L$set$30,LFE5293-LFB5293
	.quad L$set$30
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$31,LCFI10-LFB5293
	.long L$set$31
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$32,LCFI11-LCFI10
	.long L$set$32
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$33,LCFI12-LCFI11
	.long L$set$33
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$34,LEFDE9-LASFDE9
	.long L$set$34
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB5302-.
	.set L$set$35,LFE5302-LFB5302
	.quad L$set$35
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$36,LCFI13-LFB5302
	.long L$set$36
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$37,LCFI14-LCFI13
	.long L$set$37
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$38,LCFI15-LCFI14
	.long L$set$38
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE9:
	.mod_init_func
	.align 3
	.quad	__Z6injectv
	.align 3
	.quad	__GLOBAL__sub_I_playObj.cpp
	.constructor
	.destructor
	.align 1
	.subsections_via_symbols
