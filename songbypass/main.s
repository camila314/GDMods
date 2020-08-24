	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.intel_syntax noprefix
	.globl	__Z7getSongPvPNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6_S6_l ## -- Begin function _Z7getSongPvPNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6_S6_l
	.p2align	4, 0x90
__Z7getSongPvPNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6_S6_l: ## @_Z7getSongPvPNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6_S6_l
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 192
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], r8
	mov	rsi, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 32], rsi
	mov	rsi, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rip + __ZNSt3__14coutE@GOTPCREL]
	mov	qword ptr [rbp - 104], rdi ## 8-byte Spill
	mov	qword ptr [rbp - 112], rdx ## 8-byte Spill
	mov	qword ptr [rbp - 120], rcx ## 8-byte Spill
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPKv
	lea	rcx, [rip + __ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_]
	mov	rdi, rax
	mov	rsi, rcx
	mov	qword ptr [rbp - 128], rcx ## 8-byte Spill
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	mov	rsi, qword ptr [rbp - 32]
	mov	rdi, qword ptr [rbp - 104] ## 8-byte Reload
	mov	qword ptr [rbp - 136], rax ## 8-byte Spill
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPKv
	mov	rdi, rax
	mov	rsi, qword ptr [rbp - 128] ## 8-byte Reload
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	mov	rcx, qword ptr [rip + _original]
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 32]
	lea	rdx, [rbp - 56]
	mov	qword ptr [rbp - 144], rdi ## 8-byte Spill
	mov	rdi, rdx
	mov	rdx, qword ptr [rbp - 112] ## 8-byte Reload
	mov	qword ptr [rbp - 152], rsi ## 8-byte Spill
	mov	rsi, rdx
	mov	qword ptr [rbp - 160], rax ## 8-byte Spill
	mov	qword ptr [rbp - 168], rcx ## 8-byte Spill
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
Ltmp0:
	lea	rdi, [rbp - 80]
	mov	rsi, qword ptr [rbp - 120] ## 8-byte Reload
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_
Ltmp1:
	jmp	LBB0_1
LBB0_1:
	mov	r8, qword ptr [rbp - 24]
Ltmp2:
	lea	rdx, [rbp - 56]
	lea	rcx, [rbp - 80]
	mov	rdi, qword ptr [rbp - 144] ## 8-byte Reload
	mov	rsi, qword ptr [rbp - 152] ## 8-byte Reload
	mov	rax, qword ptr [rbp - 168] ## 8-byte Reload
	call	rax
Ltmp3:
	mov	qword ptr [rbp - 176], rax ## 8-byte Spill
	jmp	LBB0_2
LBB0_2:
Ltmp7:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp8:
	jmp	LBB0_3
LBB0_3:
	lea	rdi, [rbp - 56]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	mov	rax, qword ptr [rbp - 176] ## 8-byte Reload
	add	rsp, 192
	pop	rbp
	ret
LBB0_4:
Ltmp9:
	mov	ecx, edx
	mov	qword ptr [rbp - 88], rax
	mov	dword ptr [rbp - 92], ecx
	jmp	LBB0_7
LBB0_5:
Ltmp4:
	mov	ecx, edx
	mov	qword ptr [rbp - 88], rax
	mov	dword ptr [rbp - 92], ecx
Ltmp5:
	lea	rdi, [rbp - 80]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp6:
	jmp	LBB0_6
LBB0_6:
	jmp	LBB0_7
LBB0_7:
Ltmp10:
	lea	rdi, [rbp - 56]
	call	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp11:
	jmp	LBB0_8
LBB0_8:
	jmp	LBB0_9
LBB0_9:
	mov	rdi, qword ptr [rbp - 88]
	call	__Unwind_Resume
	ud2
LBB0_10:
Ltmp12:
	mov	rdi, rax
	mov	qword ptr [rbp - 184], rdx ## 8-byte Spill
	call	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0     ##   Call between Lfunc_begin0 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp9-Lfunc_begin0     ##     jumps to Ltmp9
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp2-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp3-Ltmp2            ##   Call between Ltmp2 and Ltmp3
	.uleb128 Ltmp4-Lfunc_begin0     ##     jumps to Ltmp4
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin0     ## >> Call Site 4 <<
	.uleb128 Ltmp8-Ltmp7            ##   Call between Ltmp7 and Ltmp8
	.uleb128 Ltmp9-Lfunc_begin0     ##     jumps to Ltmp9
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin0     ## >> Call Site 5 <<
	.uleb128 Ltmp5-Ltmp8            ##   Call between Ltmp8 and Ltmp5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp5-Lfunc_begin0     ## >> Call Site 6 <<
	.uleb128 Ltmp11-Ltmp5           ##   Call between Ltmp5 and Ltmp11
	.uleb128 Ltmp12-Lfunc_begin0    ##     jumps to Ltmp12
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp11-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Lfunc_end0-Ltmp11      ##   Call between Ltmp11 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E: ## @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rdi, qword ptr [rbp - 8]
	call	qword ptr [rbp - 16]
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_: ## @_ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax]
	mov	rcx, qword ptr [rcx - 24]
	add	rax, rcx
	mov	qword ptr [rbp - 16], rdi ## 8-byte Spill
	mov	rdi, rax
	mov	esi, 10
	call	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
	mov	rdi, qword ptr [rbp - 16] ## 8-byte Reload
	movsx	esi, al
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	mov	rdi, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 24], rax ## 8-byte Spill
	call	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 32], rax ## 8-byte Spill
	mov	rax, rcx
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	push	rax
	call	___cxa_begin_catch
	mov	qword ptr [rsp], rax    ## 8-byte Spill
	call	__ZSt9terminatev
                                        ## -- End function
	.globl	_inject                 ## -- Begin function inject
	.p2align	4, 0x90
_inject:                                ## @inject
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	call	_baseAddress
	lea	rcx, [rip + __Z7getSongPvPNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES6_S6_l]
	lea	rdx, [rip + _original]
	add	rax, 3073424
	mov	rdi, rax
	mov	rsi, rcx
	call	_rd_route
	mov	dword ptr [rbp - 4], eax ## 4-byte Spill
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc: ## @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	al, sil
	mov	qword ptr [rbp - 8], rdi
	mov	byte ptr [rbp - 9], al
	mov	rsi, qword ptr [rbp - 8]
	lea	rdi, [rbp - 24]
	mov	qword ptr [rbp - 48], rdi ## 8-byte Spill
	call	__ZNKSt3__18ios_base6getlocEv
Ltmp13:
	mov	rdi, qword ptr [rbp - 48] ## 8-byte Reload
	call	__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
Ltmp14:
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	jmp	LBB5_1
LBB5_1:
	movsx	esi, byte ptr [rbp - 9]
Ltmp15:
	mov	rdi, qword ptr [rbp - 56] ## 8-byte Reload
	call	__ZNKSt3__15ctypeIcE5widenEc
Ltmp16:
	mov	byte ptr [rbp - 57], al ## 1-byte Spill
	jmp	LBB5_2
LBB5_2:
	lea	rdi, [rbp - 24]
	call	__ZNSt3__16localeD1Ev
	mov	al, byte ptr [rbp - 57] ## 1-byte Reload
	movsx	eax, al
	add	rsp, 80
	pop	rbp
	ret
LBB5_3:
Ltmp17:
	mov	ecx, edx
	mov	qword ptr [rbp - 32], rax
	mov	dword ptr [rbp - 36], ecx
Ltmp18:
	lea	rdi, [rbp - 24]
	call	__ZNSt3__16localeD1Ev
Ltmp19:
	jmp	LBB5_4
LBB5_4:
	jmp	LBB5_5
LBB5_5:
	mov	rdi, qword ptr [rbp - 32]
	call	__Unwind_Resume
	ud2
LBB5_6:
Ltmp20:
	mov	rdi, rax
	mov	qword ptr [rbp - 72], rdx ## 8-byte Spill
	call	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp13-Lfunc_begin1    ##   Call between Lfunc_begin1 and Ltmp13
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp13-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp16-Ltmp13          ##   Call between Ltmp13 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin1    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp16-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Ltmp18-Ltmp16          ##   Call between Ltmp16 and Ltmp18
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin1    ## >> Call Site 4 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin1    ##     jumps to Ltmp20
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp19-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Lfunc_end1-Ltmp19      ##   Call between Ltmp19 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE: ## @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	rsi, qword ptr [rip + __ZNSt3__15ctypeIcE2idE@GOTPCREL]
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	__ZNKSt3__16locale9use_facetERNS0_2idE
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__15ctypeIcE5widenEc
__ZNKSt3__15ctypeIcE5widenEc:           ## @_ZNKSt3__15ctypeIcE5widenEc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	al, sil
	mov	qword ptr [rbp - 8], rdi
	mov	byte ptr [rbp - 9], al
	mov	rdi, qword ptr [rbp - 8]
	mov	al, byte ptr [rbp - 9]
	mov	rcx, qword ptr [rdi]
	movsx	esi, al
	call	qword ptr [rcx + 56]
	movsx	eax, al
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_original               ## @original
.zerofill __DATA,__common,_original,8,3
	.section	__DATA,__mod_init_func,mod_init_funcs
	.p2align	3
	.quad	_inject

.subsections_via_symbols
