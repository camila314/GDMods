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
	.section __TEXT,__textcoal_nt,coalesced,pure_instructions
	.align 1
	.globl __ZN7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
	.weak_definition __ZN7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
__ZN7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb:
LFB3004:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	popq	%rbp
LCFI2:
	ret
LFE3004:
	.globl __ZThn352_N7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
	.weak_definition __ZThn352_N7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
__ZThn352_N7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb:
LFB5305:
	subq	$352, %rdi
	jmp	*__ZN7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb@GOTPCREL(%rip)
LFE5305:
	.align 1
	.globl __ZN7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
	.weak_definition __ZN7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
__ZN7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv:
LFB3005:
	pushq	%rbp
LCFI3:
	movq	%rsp, %rbp
LCFI4:
	movq	%rdi, -8(%rbp)
	movl	$0, %eax
	popq	%rbp
LCFI5:
	ret
LFE3005:
	.globl __ZThn352_N7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
	.weak_definition __ZThn352_N7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
__ZThn352_N7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv:
LFB5306:
	subq	$352, %rdi
	jmp	*__ZN7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv@GOTPCREL(%rip)
LFE5306:
	.zerofill __DATA,__bss4,__ZN7cocos2d2uiL10MarginZeroE,16,4
	.globl _play
	.zerofill __DATA,__pu_bss3,_play,8,3
	.globl _base
	.zerofill __DATA,__pu_bss3,_base,8,3
	.globl _createOriginal
	.zerofill __DATA,__pu_bss3,_createOriginal,8,3
	.globl _createLabel
	.zerofill __DATA,__pu_bss3,_createLabel,8,3
	.text
	.globl __Z7onetimePvRKN7cocos2d7CCPointE
__Z7onetimePvRKN7cocos2d7CCPointE:
LFB4721:
	pushq	%rbp
LCFI6:
	movq	%rsp, %rbp
LCFI7:
	pushq	%rbx
	subq	$520, %rsp
LCFI8:
	movq	%rdi, -520(%rbp)
	movq	%rsi, -528(%rbp)
	movq	_play(%rip), %rax
	movq	%rax, %rdi
LEHB0:
	call	__ZN12ModContainer7disableEv
	call	__Z7getBasev
	leaq	1274320(%rax), %rdx
	movq	_play(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	__ZN12ModContainer11getOriginalEl
	movq	%rax, %rcx
	movq	-528(%rbp), %rdx
	movq	-520(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12FLAlertLayerC1Ev
LEHE0:
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
LEHB1:
	call	__ZN12FLAlertLayer4showEv
LEHE1:
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12FLAlertLayerD1Ev
	jmp	L7
L6:
	movq	%rax, %rbx
	leaq	-512(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12FLAlertLayerD1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
LEHB2:
	call	__Unwind_Resume
LEHE2:
L7:
	addq	$520, %rsp
	popq	%rbx
	popq	%rbp
LCFI9:
	ret
LFE4721:
	.section __DATA,__gcc_except_tab
GCC_except_table0:
LLSDA4721:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x27
	.set L$set$0,LEHB0-LFB4721
	.long L$set$0
	.set L$set$1,LEHE0-LEHB0
	.long L$set$1
	.long	0
	.byte	0
	.set L$set$2,LEHB1-LFB4721
	.long L$set$2
	.set L$set$3,LEHE1-LEHB1
	.long L$set$3
	.set L$set$4,L6-LFB4721
	.long L$set$4
	.byte	0
	.set L$set$5,LEHB2-LFB4721
	.long L$set$5
	.set L$set$6,LEHE2-LEHB2
	.long L$set$6
	.long	0
	.byte	0
	.text
	.cstring
LC0:
	.ascii "global\0"
LC1:
	.ascii "test\0"
LC2:
	.ascii "Custom Object\0"
	.text
	.globl __Z6injectv
__Z6injectv:
LFB4722:
	pushq	%rbp
LCFI10:
	movq	%rsp, %rbp
LCFI11:
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
LCFI12:
LEHB3:
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
LEHE3:
	movq	%rax, %rbx
	leaq	LC0(%rip), %rdx
	leaq	LC1(%rip), %rsi
	movq	%rbx, %rdi
LEHB4:
	call	__ZN12ModContainerC1EPKcS1_
LEHE4:
	movq	%rbx, _play(%rip)
LEHB5:
	call	__Z7getBasev
	leaq	1274320(%rax), %rcx
	movq	_play(%rip), %rax
	leaq	__Z7onetimePvRKN7cocos2d7CCPointE(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__ZN12ModContainer12registerHookElPFvvE
	movl	$40, %edi
	call	__Znwm
LEHE5:
	movq	%rax, %rbx
	leaq	LC0(%rip), %rdx
	leaq	LC2(%rip), %rsi
	movq	%rbx, %rdi
LEHB6:
	call	__ZN12ModContainerC1EPKcS1_
LEHE6:
	movq	%rbx, -24(%rbp)
LEHB7:
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
	jmp	L13
L11:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rax
	movq	%rax, %rdi
	call	__Unwind_Resume
L12:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	__ZdlPv
	movq	%r12, %rax
	movq	%rax, %rdi
	call	__Unwind_Resume
LEHE7:
L13:
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
LCFI13:
	ret
LFE4722:
	.section __DATA,__gcc_except_tab
GCC_except_table1:
LLSDA4722:
	.byte	0xff
	.byte	0xff
	.byte	0x3
	.byte	0x41
	.set L$set$7,LEHB3-LFB4722
	.long L$set$7
	.set L$set$8,LEHE3-LEHB3
	.long L$set$8
	.long	0
	.byte	0
	.set L$set$9,LEHB4-LFB4722
	.long L$set$9
	.set L$set$10,LEHE4-LEHB4
	.long L$set$10
	.set L$set$11,L11-LFB4722
	.long L$set$11
	.byte	0
	.set L$set$12,LEHB5-LFB4722
	.long L$set$12
	.set L$set$13,LEHE5-LEHB5
	.long L$set$13
	.long	0
	.byte	0
	.set L$set$14,LEHB6-LFB4722
	.long L$set$14
	.set L$set$15,LEHE6-LEHB6
	.long L$set$15
	.set L$set$16,L12-LFB4722
	.long L$set$16
	.byte	0
	.set L$set$17,LEHB7-LFB4722
	.long L$set$17
	.set L$set$18,LEHE7-LEHB7
	.long L$set$18
	.long	0
	.byte	0
	.text
	.globl __ZTV12FLAlertLayer
	.weak_definition __ZTV12FLAlertLayer
	.section __DATA,__const_coal,coalesced
	.align 6
__ZTV12FLAlertLayer:
	.quad	0
	.quad	__ZTI12FLAlertLayer
	.quad	__ZN7cocos2d9CCCopying12copyWithZoneEPNS_6CCZoneE
	.quad	__ZN12FLAlertLayerD1Ev
	.quad	__ZN12FLAlertLayerD0Ev
	.quad	__ZN7cocos2d8CCObject7isEqualEPKS0_
	.quad	__ZN7cocos2d8CCObject13acceptVisitorERNS_13CCDataVisitorE
	.quad	__ZN7cocos2d6CCNode6updateEf
	.quad	__ZN7cocos2d12CCLayerColor4initEv
	.quad	__ZN7cocos2d6CCNode9setZOrderEi
	.quad	__ZN7cocos2d6CCNode10_setZOrderEi
	.quad	__ZN7cocos2d6CCNode9getZOrderEv
	.quad	__ZN7cocos2d6CCNode10setVertexZEf
	.quad	__ZN7cocos2d6CCNode10getVertexZEv
	.quad	__ZN7cocos2d6CCNode9setScaleXEf
	.quad	__ZN7cocos2d6CCNode9getScaleXEv
	.quad	__ZN7cocos2d6CCNode9setScaleYEf
	.quad	__ZN7cocos2d6CCNode9getScaleYEv
	.quad	__ZN7cocos2d6CCNode8setScaleEf
	.quad	__ZN7cocos2d6CCNode8getScaleEv
	.quad	__ZN7cocos2d6CCNode8setScaleEff
	.quad	__ZN7cocos2d6CCNode11setPositionERKNS_7CCPointE
	.quad	__ZN7cocos2d6CCNode11getPositionEv
	.quad	__ZN7cocos2d6CCNode11setPositionEff
	.quad	__ZN7cocos2d6CCNode11getPositionEPfS1_
	.quad	__ZN7cocos2d6CCNode12setPositionXEf
	.quad	__ZN7cocos2d6CCNode12getPositionXEv
	.quad	__ZN7cocos2d6CCNode12setPositionYEf
	.quad	__ZN7cocos2d6CCNode12getPositionYEv
	.quad	__ZN7cocos2d6CCNode8setSkewXEf
	.quad	__ZN7cocos2d6CCNode8getSkewXEv
	.quad	__ZN7cocos2d6CCNode8setSkewYEf
	.quad	__ZN7cocos2d6CCNode8getSkewYEv
	.quad	__ZN7cocos2d6CCNode14setAnchorPointERKNS_7CCPointE
	.quad	__ZN7cocos2d6CCNode14getAnchorPointEv
	.quad	__ZN7cocos2d6CCNode22getAnchorPointInPointsEv
	.quad	__ZN7cocos2d12CCLayerColor14setContentSizeERKNS_6CCSizeE
	.quad	__ZNK7cocos2d6CCNode14getContentSizeEv
	.quad	__ZN7cocos2d6CCNode10setVisibleEb
	.quad	__ZN7cocos2d6CCNode9isVisibleEv
	.quad	__ZN7cocos2d6CCNode11setRotationEf
	.quad	__ZN7cocos2d6CCNode11getRotationEv
	.quad	__ZN7cocos2d6CCNode12setRotationXEf
	.quad	__ZN7cocos2d6CCNode12getRotationXEv
	.quad	__ZN7cocos2d6CCNode12setRotationYEf
	.quad	__ZN7cocos2d6CCNode12getRotationYEv
	.quad	__ZN7cocos2d6CCNode17setOrderOfArrivalEj
	.quad	__ZN7cocos2d6CCNode17getOrderOfArrivalEv
	.quad	__ZN7cocos2d6CCNode16setGLServerStateENS_15ccGLServerStateE
	.quad	__ZN7cocos2d6CCNode16getGLServerStateEv
	.quad	__ZN7cocos2d6CCNode28ignoreAnchorPointForPositionEb
	.quad	__ZN7cocos2d6CCNode30isIgnoreAnchorPointForPositionEv
	.quad	__ZN7cocos2d6CCNode8addChildEPS0_
	.quad	__ZN7cocos2d6CCNode8addChildEPS0_i
	.quad	__ZN7cocos2d6CCNode8addChildEPS0_ii
	.quad	__ZN7cocos2d6CCNode13getChildByTagEi
	.quad	__ZN7cocos2d6CCNode11getChildrenEv
	.quad	__ZNK7cocos2d6CCNode16getChildrenCountEv
	.quad	__ZN7cocos2d6CCNode9setParentEPS0_
	.quad	__ZN7cocos2d6CCNode9getParentEv
	.quad	__ZN7cocos2d6CCNode16removeFromParentEv
	.quad	__ZN7cocos2d6CCNode26removeFromParentAndCleanupEb
	.quad	__ZN7cocos2d6CCNode11removeChildEPS0_
	.quad	__ZN7cocos2d6CCNode11removeChildEPS0_b
	.quad	__ZN7cocos2d6CCNode16removeChildByTagEi
	.quad	__ZN7cocos2d6CCNode16removeChildByTagEib
	.quad	__ZN7cocos2d6CCNode17removeAllChildrenEv
	.quad	__ZN7cocos2d6CCNode28removeAllChildrenWithCleanupEb
	.quad	__ZN7cocos2d6CCNode12reorderChildEPS0_i
	.quad	__ZN7cocos2d6CCNode15sortAllChildrenEv
	.quad	__ZN7cocos2d6CCNode7getGridEv
	.quad	__ZN7cocos2d6CCNode7setGridEPNS_10CCGridBaseE
	.quad	__ZNK7cocos2d6CCNode6getTagEv
	.quad	__ZN7cocos2d6CCNode6setTagEi
	.quad	__ZN7cocos2d6CCNode11getUserDataEv
	.quad	__ZN7cocos2d6CCNode11setUserDataEPv
	.quad	__ZN7cocos2d6CCNode13getUserObjectEv
	.quad	__ZN7cocos2d6CCNode13setUserObjectEPNS_8CCObjectE
	.quad	__ZN7cocos2d6CCNode16getShaderProgramEv
	.quad	__ZN7cocos2d6CCNode16setShaderProgramEPNS_11CCGLProgramE
	.quad	__ZN7cocos2d6CCNode9getCameraEv
	.quad	__ZN7cocos2d6CCNode9isRunningEv
	.quad	__ZN7cocos2d6CCNode21registerScriptHandlerEi
	.quad	__ZN7cocos2d6CCNode23unregisterScriptHandlerEv
	.quad	__ZN7cocos2d7CCLayer7onEnterEv
	.quad	__ZN7cocos2d7CCLayer26onEnterTransitionDidFinishEv
	.quad	__ZN7cocos2d7CCLayer6onExitEv
	.quad	__ZN7cocos2d6CCNode24onExitTransitionDidStartEv
	.quad	__ZN7cocos2d6CCNode7cleanupEv
	.quad	__ZN7cocos2d12CCLayerColor4drawEv
	.quad	__ZN7cocos2d6CCNode5visitEv
	.quad	__ZN7cocos2d6CCNode11boundingBoxEv
	.quad	__ZN7cocos2d6CCNode16setActionManagerEPNS_15CCActionManagerE
	.quad	__ZN7cocos2d6CCNode16getActionManagerEv
	.quad	__ZN7cocos2d6CCNode12setSchedulerEPNS_11CCSchedulerE
	.quad	__ZN7cocos2d6CCNode12getSchedulerEv
	.quad	__ZN7cocos2d6CCNode15updateTransformEv
	.quad	__ZN7cocos2d6CCNode21nodeToParentTransformEv
	.quad	__ZN7cocos2d6CCNode21parentToNodeTransformEv
	.quad	__ZN7cocos2d6CCNode20nodeToWorldTransformEv
	.quad	__ZN7cocos2d6CCNode20worldToNodeTransformEv
	.quad	__ZN7cocos2d6CCNode12addComponentEPNS_11CCComponentE
	.quad	__ZN7cocos2d6CCNode15removeComponentEPKc
	.quad	__ZN7cocos2d6CCNode15removeComponentEPNS_11CCComponentE
	.quad	__ZN7cocos2d6CCNode19removeAllComponentsEv
	.quad	__ZN7cocos2d7CCLayer12ccTouchBeganEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer12ccTouchMovedEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer12ccTouchEndedEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer16ccTouchCancelledEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer14ccTouchesBeganEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer14ccTouchesMovedEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer14ccTouchesEndedEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer18ccTouchesCancelledEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZN7cocos2d7CCLayer13didAccelerateEPNS_14CCAccelerationE
	.quad	__ZN7cocos2d7CCLayer27registerWithTouchDispatcherEv
	.quad	__ZN7cocos2d7CCLayer26registerScriptTouchHandlerEibib
	.quad	__ZN7cocos2d7CCLayer28unregisterScriptTouchHandlerEv
	.quad	__ZN7cocos2d7CCLayer14isTouchEnabledEv
	.quad	__ZN7cocos2d7CCLayer15setTouchEnabledEb
	.quad	__ZN7cocos2d7CCLayer12setTouchModeENS_13ccTouchesModeE
	.quad	__ZN7cocos2d7CCLayer12getTouchModeEv
	.quad	__ZN7cocos2d7CCLayer16setTouchPriorityEi
	.quad	__ZN7cocos2d7CCLayer16getTouchPriorityEv
	.quad	__ZN7cocos2d7CCLayer22isAccelerometerEnabledEv
	.quad	__ZN7cocos2d7CCLayer23setAccelerometerEnabledEb
	.quad	__ZN7cocos2d7CCLayer24setAccelerometerIntervalEd
	.quad	__ZN7cocos2d7CCLayer15isKeypadEnabledEv
	.quad	__ZN7cocos2d7CCLayer16setKeypadEnabledEb
	.quad	__ZN7cocos2d7CCLayer14keyBackClickedEv
	.quad	__ZN7cocos2d7CCLayer14keyMenuClickedEv
	.quad	__ZN7cocos2d11CCLayerRGBA10getOpacityEv
	.quad	__ZN7cocos2d11CCLayerRGBA19getDisplayedOpacityEv
	.quad	__ZN7cocos2d12CCLayerColor10setOpacityEh
	.quad	__ZN7cocos2d11CCLayerRGBA22updateDisplayedOpacityEh
	.quad	__ZN7cocos2d11CCLayerRGBA23isCascadeOpacityEnabledEv
	.quad	__ZN7cocos2d11CCLayerRGBA24setCascadeOpacityEnabledEb
	.quad	__ZN7cocos2d11CCLayerRGBA8getColorEv
	.quad	__ZN7cocos2d11CCLayerRGBA17getDisplayedColorEv
	.quad	__ZN7cocos2d12CCLayerColor8setColorERKNS_10_ccColor3BE
	.quad	__ZN7cocos2d11CCLayerRGBA20updateDisplayedColorERKNS_10_ccColor3BE
	.quad	__ZN7cocos2d11CCLayerRGBA21isCascadeColorEnabledEv
	.quad	__ZN7cocos2d11CCLayerRGBA22setCascadeColorEnabledEb
	.quad	__ZN7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
	.quad	__ZN7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
	.quad	__ZN7cocos2d12CCLayerColor13initWithColorERKNS_10_ccColor4BEff
	.quad	__ZN7cocos2d12CCLayerColor13initWithColorERKNS_10_ccColor4BE
	.quad	__ZN7cocos2d12CCLayerColor12getBlendFuncEv
	.quad	__ZN7cocos2d12CCLayerColor12setBlendFuncENS_12_ccBlendFuncE
	.quad	__ZN7cocos2d12CCLayerColor11updateColorEv
	.quad	-288
	.quad	__ZTI12FLAlertLayer
	.quad	__ZThn288_N12FLAlertLayerD1Ev
	.quad	__ZThn288_N12FLAlertLayerD0Ev
	.quad	__ZThn288_N7cocos2d7CCLayer12ccTouchBeganEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer12ccTouchMovedEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer12ccTouchEndedEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer16ccTouchCancelledEPNS_7CCTouchEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer14ccTouchesBeganEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer14ccTouchesMovedEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer14ccTouchesEndedEPNS_5CCSetEPNS_7CCEventE
	.quad	__ZThn288_N7cocos2d7CCLayer18ccTouchesCancelledEPNS_5CCSetEPNS_7CCEventE
	.quad	-296
	.quad	__ZTI12FLAlertLayer
	.quad	__ZThn296_N7cocos2d7CCLayer13didAccelerateEPNS_14CCAccelerationE
	.quad	-304
	.quad	__ZTI12FLAlertLayer
	.quad	__ZThn304_N7cocos2d7CCLayer14keyBackClickedEv
	.quad	__ZThn304_N7cocos2d7CCLayer14keyMenuClickedEv
	.quad	-352
	.quad	__ZTI12FLAlertLayer
	.quad	__ZThn352_N7cocos2d12CCLayerColor8setColorERKNS_10_ccColor3BE
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA8getColorEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA17getDisplayedColorEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA19getDisplayedOpacityEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA10getOpacityEv
	.quad	__ZThn352_N7cocos2d12CCLayerColor10setOpacityEh
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA19setOpacityModifyRGBEb
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA18isOpacityModifyRGBEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA21isCascadeColorEnabledEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA22setCascadeColorEnabledEb
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA20updateDisplayedColorERKNS_10_ccColor3BE
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA23isCascadeOpacityEnabledEv
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA24setCascadeOpacityEnabledEb
	.quad	__ZThn352_N7cocos2d11CCLayerRGBA22updateDisplayedOpacityEh
	.quad	-376
	.quad	__ZTI12FLAlertLayer
	.quad	__ZThn376_N7cocos2d12CCLayerColor12setBlendFuncENS_12_ccBlendFuncE
	.quad	__ZThn376_N7cocos2d12CCLayerColor12getBlendFuncEv
	.text
__Z41__static_initialization_and_destruction_0ii:
LFB5291:
	pushq	%rbp
LCFI14:
	movq	%rsp, %rbp
LCFI15:
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	L14
	cmpl	$65535, -8(%rbp)
	jne	L14
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
L14:
	leave
LCFI16:
	ret
LFE5291:
	.section __TEXT,__textcoal_nt,coalesced,pure_instructions
	.align 1
	.globl __ZN12FLAlertLayerD1Ev
	.weak_definition __ZN12FLAlertLayerD1Ev
__ZN12FLAlertLayerD1Ev:
LFB5302:
	pushq	%rbp
LCFI17:
	movq	%rsp, %rbp
LCFI18:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	16(%rdx), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	1208(%rdx), %rdx
	movq	%rdx, 288(%rax)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	1304(%rdx), %rdx
	movq	%rdx, 296(%rax)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	1328(%rdx), %rdx
	movq	%rdx, 304(%rax)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	1360(%rdx), %rdx
	movq	%rdx, 352(%rax)
	movq	-8(%rbp), %rax
	movq	__ZTV12FLAlertLayer@GOTPCREL(%rip), %rdx
	leaq	1488(%rdx), %rdx
	movq	%rdx, 376(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN7cocos2d12CCLayerColorD2Ev
	movl	$0, %eax
	testl	%eax, %eax
	je	L16
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	__ZdlPv
L16:
	leave
LCFI19:
	ret
LFE5302:
	.globl __ZThn288_N12FLAlertLayerD1Ev
	.weak_definition __ZThn288_N12FLAlertLayerD1Ev
__ZThn288_N12FLAlertLayerD1Ev:
LFB5307:
	subq	$288, %rdi
	jmp	*__ZN12FLAlertLayerD1Ev@GOTPCREL(%rip)
LFE5307:
	.align 1
	.globl __ZN12FLAlertLayerD0Ev
	.weak_definition __ZN12FLAlertLayerD0Ev
__ZN12FLAlertLayerD0Ev:
LFB5303:
	pushq	%rbp
LCFI20:
	movq	%rsp, %rbp
LCFI21:
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	__ZN12FLAlertLayerD1Ev
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	__ZdlPv
	leave
LCFI22:
	ret
LFE5303:
	.globl __ZThn288_N12FLAlertLayerD0Ev
	.weak_definition __ZThn288_N12FLAlertLayerD0Ev
__ZThn288_N12FLAlertLayerD0Ev:
LFB5308:
	subq	$288, %rdi
	jmp	*__ZN12FLAlertLayerD0Ev@GOTPCREL(%rip)
LFE5308:
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
	.globl __ZTS12FLAlertLayer
	.weak_definition __ZTS12FLAlertLayer
	.section __TEXT,__const_coal,coalesced
__ZTS12FLAlertLayer:
	.ascii "12FLAlertLayer\0"
	.globl __ZTI12FLAlertLayer
	.weak_definition __ZTI12FLAlertLayer
	.section __DATA,__const_coal,coalesced
	.align 5
__ZTI12FLAlertLayer:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTS12FLAlertLayer
	.long	0
	.long	2
	.quad	__ZTIN7cocos2d12CCLayerColorE
	.quad	2
	.quad	__ZTI5GDObj
	.quad	2
	.globl __ZTS5GDObj
	.weak_definition __ZTS5GDObj
	.section __TEXT,__const_coal,coalesced
__ZTS5GDObj:
	.ascii "5GDObj\0"
	.globl __ZTI5GDObj
	.weak_definition __ZTI5GDObj
	.section __DATA,__const_coal,coalesced
	.align 4
__ZTI5GDObj:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTS5GDObj
	.text
__GLOBAL__sub_I_playObj.cpp:
LFB5304:
	pushq	%rbp
LCFI23:
	movq	%rsp, %rbp
LCFI24:
	movl	$65535, %esi
	movl	$1, %edi
	call	__Z41__static_initialization_and_destruction_0ii
	popq	%rbp
LCFI25:
	ret
LFE5304:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$19,LECIE1-LSCIE1
	.long L$set$19
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
	.set L$set$20,LEFDE1-LASFDE1
	.long L$set$20
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB3004-.
	.set L$set$21,LFE3004-LFB3004
	.quad L$set$21
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$22,LCFI0-LFB3004
	.long L$set$22
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$23,LCFI1-LCFI0
	.long L$set$23
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$24,LCFI2-LCFI1
	.long L$set$24
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$25,LEFDE3-LASFDE3
	.long L$set$25
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB5305-.
	.set L$set$26,LFE5305-LFB5305
	.quad L$set$26
	.byte	0x8
	.quad	0
	.align 3
LEFDE3:
LSFDE5:
	.set L$set$27,LEFDE5-LASFDE5
	.long L$set$27
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB3005-.
	.set L$set$28,LFE3005-LFB3005
	.quad L$set$28
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$29,LCFI3-LFB3005
	.long L$set$29
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$30,LCFI4-LCFI3
	.long L$set$30
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$31,LCFI5-LCFI4
	.long L$set$31
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE5:
LSFDE7:
	.set L$set$32,LEFDE7-LASFDE7
	.long L$set$32
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB5306-.
	.set L$set$33,LFE5306-LFB5306
	.quad L$set$33
	.byte	0x8
	.quad	0
	.align 3
LEFDE7:
LSFDE9:
	.set L$set$34,LEFDE9-LASFDE9
	.long L$set$34
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB4721-.
	.set L$set$35,LFE4721-LFB4721
	.quad L$set$35
	.byte	0x8
	.quad	LLSDA4721-.
	.byte	0x4
	.set L$set$36,LCFI6-LFB4721
	.long L$set$36
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$37,LCFI7-LCFI6
	.long L$set$37
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$38,LCFI8-LCFI7
	.long L$set$38
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$39,LCFI9-LCFI8
	.long L$set$39
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE9:
LSFDE11:
	.set L$set$40,LEFDE11-LASFDE11
	.long L$set$40
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB4722-.
	.set L$set$41,LFE4722-LFB4722
	.quad L$set$41
	.byte	0x8
	.quad	LLSDA4722-.
	.byte	0x4
	.set L$set$42,LCFI10-LFB4722
	.long L$set$42
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$43,LCFI11-LCFI10
	.long L$set$43
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$44,LCFI12-LCFI11
	.long L$set$44
	.byte	0x8c
	.byte	0x3
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$45,LCFI13-LCFI12
	.long L$set$45
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE11:
LSFDE13:
	.set L$set$46,LEFDE13-LASFDE13
	.long L$set$46
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB5291-.
	.set L$set$47,LFE5291-LFB5291
	.quad L$set$47
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$48,LCFI14-LFB5291
	.long L$set$48
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$49,LCFI15-LCFI14
	.long L$set$49
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$50,LCFI16-LCFI15
	.long L$set$50
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE13:
LSFDE15:
	.set L$set$51,LEFDE15-LASFDE15
	.long L$set$51
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB5302-.
	.set L$set$52,LFE5302-LFB5302
	.quad L$set$52
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$53,LCFI17-LFB5302
	.long L$set$53
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$54,LCFI18-LCFI17
	.long L$set$54
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$55,LCFI19-LCFI18
	.long L$set$55
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE15:
LSFDE17:
	.set L$set$56,LEFDE17-LASFDE17
	.long L$set$56
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB5307-.
	.set L$set$57,LFE5307-LFB5307
	.quad L$set$57
	.byte	0x8
	.quad	0
	.align 3
LEFDE17:
LSFDE19:
	.set L$set$58,LEFDE19-LASFDE19
	.long L$set$58
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB5303-.
	.set L$set$59,LFE5303-LFB5303
	.quad L$set$59
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$60,LCFI20-LFB5303
	.long L$set$60
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$61,LCFI21-LCFI20
	.long L$set$61
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$62,LCFI22-LCFI21
	.long L$set$62
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE19:
LSFDE21:
	.set L$set$63,LEFDE21-LASFDE21
	.long L$set$63
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB5308-.
	.set L$set$64,LFE5308-LFB5308
	.quad L$set$64
	.byte	0x8
	.quad	0
	.align 3
LEFDE21:
LSFDE23:
	.set L$set$65,LEFDE23-LASFDE23
	.long L$set$65
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB5304-.
	.set L$set$66,LFE5304-LFB5304
	.quad L$set$66
	.byte	0x8
	.quad	0
	.byte	0x4
	.set L$set$67,LCFI23-LFB5304
	.long L$set$67
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$68,LCFI24-LCFI23
	.long L$set$68
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$69,LCFI25-LCFI24
	.long L$set$69
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE23:
	.mod_init_func
	.align 3
	.quad	__Z6injectv
	.align 3
	.quad	__GLOBAL__sub_I_playObj.cpp
	.constructor
	.destructor
	.align 1
	.subsections_via_symbols
