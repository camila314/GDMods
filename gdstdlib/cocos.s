	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__ZN7cocos2d8CCString16createWithFormatEPKcz ## -- Begin function _ZN7cocos2d8CCString16createWithFormatEPKcz
	.p2align	4, 0x90
__ZN7cocos2d8CCString16createWithFormatEPKcz: ## @_ZN7cocos2d8CCString16createWithFormatEPKcz
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN7cocos2d8CCString9boolValueEv ## -- Begin function _ZN7cocos2d8CCString9boolValueEv
	.p2align	4, 0x90
__ZN7cocos2d8CCString9boolValueEv:      ## @_ZN7cocos2d8CCString9boolValueEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movb	%al, %cl
	movq	%rdi, -8(%rbp)
	andb	$1, %cl
	movzbl	%cl, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
