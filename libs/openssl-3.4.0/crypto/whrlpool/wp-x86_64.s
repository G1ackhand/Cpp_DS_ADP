.text	

.globl	_whirlpool_block

.p2align	4
_whirlpool_block:

	movq	%rsp,%rax

	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15


	subq	$128+40,%rsp
	andq	$-64,%rsp

	leaq	128(%rsp),%r10
	movq	%rdi,0(%r10)
	movq	%rsi,8(%r10)
	movq	%rdx,16(%r10)
	movq	%rax,32(%r10)

L$prologue:

	movq	%r10,%rbx
	leaq	L$table(%rip),%rbp

	xorq	%rcx,%rcx
	xorq	%rdx,%rdx
	movq	0(%rdi),%r8
	movq	8(%rdi),%r9
	movq	16(%rdi),%r10
	movq	24(%rdi),%r11
	movq	32(%rdi),%r12
	movq	40(%rdi),%r13
	movq	48(%rdi),%r14
	movq	56(%rdi),%r15
L$outerloop:
	movq	%r8,0(%rsp)
	movq	%r9,8(%rsp)
	movq	%r10,16(%rsp)
	movq	%r11,24(%rsp)
	movq	%r12,32(%rsp)
	movq	%r13,40(%rsp)
	movq	%r14,48(%rsp)
	movq	%r15,56(%rsp)
	xorq	0(%rsi),%r8
	xorq	8(%rsi),%r9
	xorq	16(%rsi),%r10
	xorq	24(%rsi),%r11
	xorq	32(%rsi),%r12
	xorq	40(%rsi),%r13
	xorq	48(%rsi),%r14
	xorq	56(%rsi),%r15
	movq	%r8,64+0(%rsp)
	movq	%r9,64+8(%rsp)
	movq	%r10,64+16(%rsp)
	movq	%r11,64+24(%rsp)
	movq	%r12,64+32(%rsp)
	movq	%r13,64+40(%rsp)
	movq	%r14,64+48(%rsp)
	movq	%r15,64+56(%rsp)
	xorq	%rsi,%rsi
	movq	%rsi,24(%rbx)
	jmp	L$round
.p2align	4
L$round:
	movq	4096(%rbp,%rsi,8),%r8
	movl	0(%rsp),%eax
	movl	4(%rsp),%ebx
	movzbl	%al,%ecx
	movzbl	%ah,%edx
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r8
	movq	7(%rbp,%rdi,8),%r9
	movl	0+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	movq	6(%rbp,%rsi,8),%r10
	movq	5(%rbp,%rdi,8),%r11
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	movq	4(%rbp,%rsi,8),%r12
	movq	3(%rbp,%rdi,8),%r13
	movl	0+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	movq	2(%rbp,%rsi,8),%r14
	movq	1(%rbp,%rdi,8),%r15
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r9
	xorq	7(%rbp,%rdi,8),%r10
	movl	8+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r11
	xorq	5(%rbp,%rdi,8),%r12
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r13
	xorq	3(%rbp,%rdi,8),%r14
	movl	8+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r15
	xorq	1(%rbp,%rdi,8),%r8
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r10
	xorq	7(%rbp,%rdi,8),%r11
	movl	16+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r12
	xorq	5(%rbp,%rdi,8),%r13
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r14
	xorq	3(%rbp,%rdi,8),%r15
	movl	16+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r8
	xorq	1(%rbp,%rdi,8),%r9
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r11
	xorq	7(%rbp,%rdi,8),%r12
	movl	24+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r13
	xorq	5(%rbp,%rdi,8),%r14
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r15
	xorq	3(%rbp,%rdi,8),%r8
	movl	24+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r9
	xorq	1(%rbp,%rdi,8),%r10
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r12
	xorq	7(%rbp,%rdi,8),%r13
	movl	32+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r14
	xorq	5(%rbp,%rdi,8),%r15
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r8
	xorq	3(%rbp,%rdi,8),%r9
	movl	32+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r10
	xorq	1(%rbp,%rdi,8),%r11
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r13
	xorq	7(%rbp,%rdi,8),%r14
	movl	40+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r15
	xorq	5(%rbp,%rdi,8),%r8
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r9
	xorq	3(%rbp,%rdi,8),%r10
	movl	40+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r11
	xorq	1(%rbp,%rdi,8),%r12
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r14
	xorq	7(%rbp,%rdi,8),%r15
	movl	48+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r8
	xorq	5(%rbp,%rdi,8),%r9
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r10
	xorq	3(%rbp,%rdi,8),%r11
	movl	48+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r12
	xorq	1(%rbp,%rdi,8),%r13
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r15
	xorq	7(%rbp,%rdi,8),%r8
	movl	56+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r9
	xorq	5(%rbp,%rdi,8),%r10
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r11
	xorq	3(%rbp,%rdi,8),%r12
	movl	56+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r13
	xorq	1(%rbp,%rdi,8),%r14
	movq	%r8,0(%rsp)
	movq	%r9,8(%rsp)
	movq	%r10,16(%rsp)
	movq	%r11,24(%rsp)
	movq	%r12,32(%rsp)
	movq	%r13,40(%rsp)
	movq	%r14,48(%rsp)
	movq	%r15,56(%rsp)
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r8
	xorq	7(%rbp,%rdi,8),%r9
	movl	64+0+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r10
	xorq	5(%rbp,%rdi,8),%r11
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r12
	xorq	3(%rbp,%rdi,8),%r13
	movl	64+0+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r14
	xorq	1(%rbp,%rdi,8),%r15
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r9
	xorq	7(%rbp,%rdi,8),%r10
	movl	64+8+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r11
	xorq	5(%rbp,%rdi,8),%r12
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r13
	xorq	3(%rbp,%rdi,8),%r14
	movl	64+8+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r15
	xorq	1(%rbp,%rdi,8),%r8
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r10
	xorq	7(%rbp,%rdi,8),%r11
	movl	64+16+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r12
	xorq	5(%rbp,%rdi,8),%r13
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r14
	xorq	3(%rbp,%rdi,8),%r15
	movl	64+16+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r8
	xorq	1(%rbp,%rdi,8),%r9
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r11
	xorq	7(%rbp,%rdi,8),%r12
	movl	64+24+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r13
	xorq	5(%rbp,%rdi,8),%r14
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r15
	xorq	3(%rbp,%rdi,8),%r8
	movl	64+24+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r9
	xorq	1(%rbp,%rdi,8),%r10
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r12
	xorq	7(%rbp,%rdi,8),%r13
	movl	64+32+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r14
	xorq	5(%rbp,%rdi,8),%r15
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r8
	xorq	3(%rbp,%rdi,8),%r9
	movl	64+32+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r10
	xorq	1(%rbp,%rdi,8),%r11
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r13
	xorq	7(%rbp,%rdi,8),%r14
	movl	64+40+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r15
	xorq	5(%rbp,%rdi,8),%r8
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r9
	xorq	3(%rbp,%rdi,8),%r10
	movl	64+40+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r11
	xorq	1(%rbp,%rdi,8),%r12
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r14
	xorq	7(%rbp,%rdi,8),%r15
	movl	64+48+8(%rsp),%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r8
	xorq	5(%rbp,%rdi,8),%r9
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r10
	xorq	3(%rbp,%rdi,8),%r11
	movl	64+48+8+4(%rsp),%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r12
	xorq	1(%rbp,%rdi,8),%r13
	shrl	$16,%eax
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	0(%rbp,%rsi,8),%r15
	xorq	7(%rbp,%rdi,8),%r8

	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	6(%rbp,%rsi,8),%r9
	xorq	5(%rbp,%rdi,8),%r10
	shrl	$16,%ebx
	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%bl,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%bh,%edx
	xorq	4(%rbp,%rsi,8),%r11
	xorq	3(%rbp,%rdi,8),%r12

	leaq	(%rcx,%rcx,1),%rsi
	movzbl	%al,%ecx
	leaq	(%rdx,%rdx,1),%rdi
	movzbl	%ah,%edx
	xorq	2(%rbp,%rsi,8),%r13
	xorq	1(%rbp,%rdi,8),%r14
	leaq	128(%rsp),%rbx
	movq	24(%rbx),%rsi
	addq	$1,%rsi
	cmpq	$10,%rsi
	je	L$roundsdone

	movq	%rsi,24(%rbx)
	movq	%r8,64+0(%rsp)
	movq	%r9,64+8(%rsp)
	movq	%r10,64+16(%rsp)
	movq	%r11,64+24(%rsp)
	movq	%r12,64+32(%rsp)
	movq	%r13,64+40(%rsp)
	movq	%r14,64+48(%rsp)
	movq	%r15,64+56(%rsp)
	jmp	L$round
.p2align	4
L$roundsdone:
	movq	0(%rbx),%rdi
	movq	8(%rbx),%rsi
	movq	16(%rbx),%rax
	xorq	0(%rsi),%r8
	xorq	8(%rsi),%r9
	xorq	16(%rsi),%r10
	xorq	24(%rsi),%r11
	xorq	32(%rsi),%r12
	xorq	40(%rsi),%r13
	xorq	48(%rsi),%r14
	xorq	56(%rsi),%r15
	xorq	0(%rdi),%r8
	xorq	8(%rdi),%r9
	xorq	16(%rdi),%r10
	xorq	24(%rdi),%r11
	xorq	32(%rdi),%r12
	xorq	40(%rdi),%r13
	xorq	48(%rdi),%r14
	xorq	56(%rdi),%r15
	movq	%r8,0(%rdi)
	movq	%r9,8(%rdi)
	movq	%r10,16(%rdi)
	movq	%r11,24(%rdi)
	movq	%r12,32(%rdi)
	movq	%r13,40(%rdi)
	movq	%r14,48(%rdi)
	movq	%r15,56(%rdi)
	leaq	64(%rsi),%rsi
	subq	$1,%rax
	jz	L$alldone
	movq	%rsi,8(%rbx)
	movq	%rax,16(%rbx)
	jmp	L$outerloop
L$alldone:
	movq	32(%rbx),%rsi

	movq	-48(%rsi),%r15

	movq	-40(%rsi),%r14

	movq	-32(%rsi),%r13

	movq	-24(%rsi),%r12

	movq	-16(%rsi),%rbp

	movq	-8(%rsi),%rbx

	leaq	(%rsi),%rsp

L$epilogue:
	.byte	0xf3,0xc3



.section	__DATA,__const
.p2align	6

L$table:
.byte	24,24,96,24,192,120,48,216,24,24,96,24,192,120,48,216
.byte	35,35,140,35,5,175,70,38,35,35,140,35,5,175,70,38
.byte	198,198,63,198,126,249,145,184,198,198,63,198,126,249,145,184
.byte	232,232,135,232,19,111,205,251,232,232,135,232,19,111,205,251
.byte	135,135,38,135,76,161,19,203,135,135,38,135,76,161,19,203
.byte	184,184,218,184,169,98,109,17,184,184,218,184,169,98,109,17
.byte	1,1,4,1,8,5,2,9,1,1,4,1,8,5,2,9
.byte	79,79,33,79,66,110,158,13,79,79,33,79,66,110,158,13
.byte	54,54,216,54,173,238,108,155,54,54,216,54,173,238,108,155
.byte	166,166,162,166,89,4,81,255,166,166,162,166,89,4,81,255
.byte	210,210,111,210,222,189,185,12,210,210,111,210,222,189,185,12
.byte	245,245,243,245,251,6,247,14,245,245,243,245,251,6,247,14
.byte	121,121,249,121,239,128,242,150,121,121,249,121,239,128,242,150
.byte	111,111,161,111,95,206,222,48,111,111,161,111,95,206,222,48
.byte	145,145,126,145,252,239,63,109,145,145,126,145,252,239,63,109
.byte	82,82,85,82,170,7,164,248,82,82,85,82,170,7,164,248
.byte	96,96,157,96,39,253,192,71,96,96,157,96,39,253,192,71
.byte	188,188,202,188,137,118,101,53,188,188,202,188,137,118,101,53
.byte	155,155,86,155,172,205,43,55,155,155,86,155,172,205,43,55
.byte	142,142,2,142,4,140,1,138,142,142,2,142,4,140,1,138
.byte	163,163,182,163,113,21,91,210,163,163,182,163,113,21,91,210
.byte	12,12,48,12,96,60,24,108,12,12,48,12,96,60,24,108
.byte	123,123,241,123,255,138,246,132,123,123,241,123,255,138,246,132
.byte	53,53,212,53,181,225,106,128,53,53,212,53,181,225,106,128
.byte	29,29,116,29,232,105,58,245,29,29,116,29,232,105,58,245
.byte	224,224,167,224,83,71,221,179,224,224,167,224,83,71,221,179
.byte	215,215,123,215,246,172,179,33,215,215,123,215,246,172,179,33
.byte	194,194,47,194,94,237,153,156,194,194,47,194,94,237,153,156
.byte	46,46,184,46,109,150,92,67,46,46,184,46,109,150,92,67
.byte	75,75,49,75,98,122,150,41,75,75,49,75,98,122,150,41
.byte	254,254,223,254,163,33,225,93,254,254,223,254,163,33,225,93
.byte	87,87,65,87,130,22,174,213,87,87,65,87,130,22,174,213
.byte	21,21,84,21,168,65,42,189,21,21,84,21,168,65,42,189
.byte	119,119,193,119,159,182,238,232,119,119,193,119,159,182,238,232
.byte	55,55,220,55,165,235,110,146,55,55,220,55,165,235,110,146
.byte	229,229,179,229,123,86,215,158,229,229,179,229,123,86,215,158
.byte	159,159,70,159,140,217,35,19,159,159,70,159,140,217,35,19
.byte	240,240,231,240,211,23,253,35,240,240,231,240,211,23,253,35
.byte	74,74,53,74,106,127,148,32,74,74,53,74,106,127,148,32
.byte	218,218,79,218,158,149,169,68,218,218,79,218,158,149,169,68
.byte	88,88,125,88,250,37,176,162,88,88,125,88,250,37,176,162
.byte	201,201,3,201,6,202,143,207,201,201,3,201,6,202,143,207
.byte	41,41,164,41,85,141,82,124,41,41,164,41,85,141,82,124
.byte	10,10,40,10,80,34,20,90,10,10,40,10,80,34,20,90
.byte	177,177,254,177,225,79,127,80,177,177,254,177,225,79,127,80
.byte	160,160,186,160,105,26,93,201,160,160,186,160,105,26,93,201
.byte	107,107,177,107,127,218,214,20,107,107,177,107,127,218,214,20
.byte	133,133,46,133,92,171,23,217,133,133,46,133,92,171,23,217
.byte	189,189,206,189,129,115,103,60,189,189,206,189,129,115,103,60
.byte	93,93,105,93,210,52,186,143,93,93,105,93,210,52,186,143
.byte	16,16,64,16,128,80,32,144,16,16,64,16,128,80,32,144
.byte	244,244,247,244,243,3,245,7,244,244,247,244,243,3,245,7
.byte	203,203,11,203,22,192,139,221,203,203,11,203,22,192,139,221
.byte	62,62,248,62,237,198,124,211,62,62,248,62,237,198,124,211
.byte	5,5,20,5,40,17,10,45,5,5,20,5,40,17,10,45
.byte	103,103,129,103,31,230,206,120,103,103,129,103,31,230,206,120
.byte	228,228,183,228,115,83,213,151,228,228,183,228,115,83,213,151
.byte	39,39,156,39,37,187,78,2,39,39,156,39,37,187,78,2
.byte	65,65,25,65,50,88,130,115,65,65,25,65,50,88,130,115
.byte	139,139,22,139,44,157,11,167,139,139,22,139,44,157,11,167
.byte	167,167,166,167,81,1,83,246,167,167,166,167,81,1,83,246
.byte	125,125,233,125,207,148,250,178,125,125,233,125,207,148,250,178
.byte	149,149,110,149,220,251,55,73,149,149,110,149,220,251,55,73
.byte	216,216,71,216,142,159,173,86,216,216,71,216,142,159,173,86
.byte	251,251,203,251,139,48,235,112,251,251,203,251,139,48,235,112
.byte	238,238,159,238,35,113,193,205,238,238,159,238,35,113,193,205
.byte	124,124,237,124,199,145,248,187,124,124,237,124,199,145,248,187
.byte	102,102,133,102,23,227,204,113,102,102,133,102,23,227,204,113
.byte	221,221,83,221,166,142,167,123,221,221,83,221,166,142,167,123
.byte	23,23,92,23,184,75,46,175,23,23,92,23,184,75,46,175
.byte	71,71,1,71,2,70,142,69,71,71,1,71,2,70,142,69
.byte	158,158,66,158,132,220,33,26,158,158,66,158,132,220,33,26
.byte	202,202,15,202,30,197,137,212,202,202,15,202,30,197,137,212
.byte	45,45,180,45,117,153,90,88,45,45,180,45,117,153,90,88
.byte	191,191,198,191,145,121,99,46,191,191,198,191,145,121,99,46
.byte	7,7,28,7,56,27,14,63,7,7,28,7,56,27,14,63
.byte	173,173,142,173,1,35,71,172,173,173,142,173,1,35,71,172
.byte	90,90,117,90,234,47,180,176,90,90,117,90,234,47,180,176
.byte	131,131,54,131,108,181,27,239,131,131,54,131,108,181,27,239
.byte	51,51,204,51,133,255,102,182,51,51,204,51,133,255,102,182
.byte	99,99,145,99,63,242,198,92,99,99,145,99,63,242,198,92
.byte	2,2,8,2,16,10,4,18,2,2,8,2,16,10,4,18
.byte	170,170,146,170,57,56,73,147,170,170,146,170,57,56,73,147
.byte	113,113,217,113,175,168,226,222,113,113,217,113,175,168,226,222
.byte	200,200,7,200,14,207,141,198,200,200,7,200,14,207,141,198
.byte	25,25,100,25,200,125,50,209,25,25,100,25,200,125,50,209
.byte	73,73,57,73,114,112,146,59,73,73,57,73,114,112,146,59
.byte	217,217,67,217,134,154,175,95,217,217,67,217,134,154,175,95
.byte	242,242,239,242,195,29,249,49,242,242,239,242,195,29,249,49
.byte	227,227,171,227,75,72,219,168,227,227,171,227,75,72,219,168
.byte	91,91,113,91,226,42,182,185,91,91,113,91,226,42,182,185
.byte	136,136,26,136,52,146,13,188,136,136,26,136,52,146,13,188
.byte	154,154,82,154,164,200,41,62,154,154,82,154,164,200,41,62
.byte	38,38,152,38,45,190,76,11,38,38,152,38,45,190,76,11
.byte	50,50,200,50,141,250,100,191,50,50,200,50,141,250,100,191
.byte	176,176,250,176,233,74,125,89,176,176,250,176,233,74,125,89
.byte	233,233,131,233,27,106,207,242,233,233,131,233,27,106,207,242
.byte	15,15,60,15,120,51,30,119,15,15,60,15,120,51,30,119
.byte	213,213,115,213,230,166,183,51,213,213,115,213,230,166,183,51
.byte	128,128,58,128,116,186,29,244,128,128,58,128,116,186,29,244
.byte	190,190,194,190,153,124,97,39,190,190,194,190,153,124,97,39
.byte	205,205,19,205,38,222,135,235,205,205,19,205,38,222,135,235
.byte	52,52,208,52,189,228,104,137,52,52,208,52,189,228,104,137
.byte	72,72,61,72,122,117,144,50,72,72,61,72,122,117,144,50
.byte	255,255,219,255,171,36,227,84,255,255,219,255,171,36,227,84
.byte	122,122,245,122,247,143,244,141,122,122,245,122,247,143,244,141
.byte	144,144,122,144,244,234,61,100,144,144,122,144,244,234,61,100
.byte	95,95,97,95,194,62,190,157,95,95,97,95,194,62,190,157
.byte	32,32,128,32,29,160,64,61,32,32,128,32,29,160,64,61
.byte	104,104,189,104,103,213,208,15,104,104,189,104,103,213,208,15
.byte	26,26,104,26,208,114,52,202,26,26,104,26,208,114,52,202
.byte	174,174,130,174,25,44,65,183,174,174,130,174,25,44,65,183
.byte	180,180,234,180,201,94,117,125,180,180,234,180,201,94,117,125
.byte	84,84,77,84,154,25,168,206,84,84,77,84,154,25,168,206
.byte	147,147,118,147,236,229,59,127,147,147,118,147,236,229,59,127
.byte	34,34,136,34,13,170,68,47,34,34,136,34,13,170,68,47
.byte	100,100,141,100,7,233,200,99,100,100,141,100,7,233,200,99
.byte	241,241,227,241,219,18,255,42,241,241,227,241,219,18,255,42
.byte	115,115,209,115,191,162,230,204,115,115,209,115,191,162,230,204
.byte	18,18,72,18,144,90,36,130,18,18,72,18,144,90,36,130
.byte	64,64,29,64,58,93,128,122,64,64,29,64,58,93,128,122
.byte	8,8,32,8,64,40,16,72,8,8,32,8,64,40,16,72
.byte	195,195,43,195,86,232,155,149,195,195,43,195,86,232,155,149
.byte	236,236,151,236,51,123,197,223,236,236,151,236,51,123,197,223
.byte	219,219,75,219,150,144,171,77,219,219,75,219,150,144,171,77
.byte	161,161,190,161,97,31,95,192,161,161,190,161,97,31,95,192
.byte	141,141,14,141,28,131,7,145,141,141,14,141,28,131,7,145
.byte	61,61,244,61,245,201,122,200,61,61,244,61,245,201,122,200
.byte	151,151,102,151,204,241,51,91,151,151,102,151,204,241,51,91
.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byte	207,207,27,207,54,212,131,249,207,207,27,207,54,212,131,249
.byte	43,43,172,43,69,135,86,110,43,43,172,43,69,135,86,110
.byte	118,118,197,118,151,179,236,225,118,118,197,118,151,179,236,225
.byte	130,130,50,130,100,176,25,230,130,130,50,130,100,176,25,230
.byte	214,214,127,214,254,169,177,40,214,214,127,214,254,169,177,40
.byte	27,27,108,27,216,119,54,195,27,27,108,27,216,119,54,195
.byte	181,181,238,181,193,91,119,116,181,181,238,181,193,91,119,116
.byte	175,175,134,175,17,41,67,190,175,175,134,175,17,41,67,190
.byte	106,106,181,106,119,223,212,29,106,106,181,106,119,223,212,29
.byte	80,80,93,80,186,13,160,234,80,80,93,80,186,13,160,234
.byte	69,69,9,69,18,76,138,87,69,69,9,69,18,76,138,87
.byte	243,243,235,243,203,24,251,56,243,243,235,243,203,24,251,56
.byte	48,48,192,48,157,240,96,173,48,48,192,48,157,240,96,173
.byte	239,239,155,239,43,116,195,196,239,239,155,239,43,116,195,196
.byte	63,63,252,63,229,195,126,218,63,63,252,63,229,195,126,218
.byte	85,85,73,85,146,28,170,199,85,85,73,85,146,28,170,199
.byte	162,162,178,162,121,16,89,219,162,162,178,162,121,16,89,219
.byte	234,234,143,234,3,101,201,233,234,234,143,234,3,101,201,233
.byte	101,101,137,101,15,236,202,106,101,101,137,101,15,236,202,106
.byte	186,186,210,186,185,104,105,3,186,186,210,186,185,104,105,3
.byte	47,47,188,47,101,147,94,74,47,47,188,47,101,147,94,74
.byte	192,192,39,192,78,231,157,142,192,192,39,192,78,231,157,142
.byte	222,222,95,222,190,129,161,96,222,222,95,222,190,129,161,96
.byte	28,28,112,28,224,108,56,252,28,28,112,28,224,108,56,252
.byte	253,253,211,253,187,46,231,70,253,253,211,253,187,46,231,70
.byte	77,77,41,77,82,100,154,31,77,77,41,77,82,100,154,31
.byte	146,146,114,146,228,224,57,118,146,146,114,146,228,224,57,118
.byte	117,117,201,117,143,188,234,250,117,117,201,117,143,188,234,250
.byte	6,6,24,6,48,30,12,54,6,6,24,6,48,30,12,54
.byte	138,138,18,138,36,152,9,174,138,138,18,138,36,152,9,174
.byte	178,178,242,178,249,64,121,75,178,178,242,178,249,64,121,75
.byte	230,230,191,230,99,89,209,133,230,230,191,230,99,89,209,133
.byte	14,14,56,14,112,54,28,126,14,14,56,14,112,54,28,126
.byte	31,31,124,31,248,99,62,231,31,31,124,31,248,99,62,231
.byte	98,98,149,98,55,247,196,85,98,98,149,98,55,247,196,85
.byte	212,212,119,212,238,163,181,58,212,212,119,212,238,163,181,58
.byte	168,168,154,168,41,50,77,129,168,168,154,168,41,50,77,129
.byte	150,150,98,150,196,244,49,82,150,150,98,150,196,244,49,82
.byte	249,249,195,249,155,58,239,98,249,249,195,249,155,58,239,98
.byte	197,197,51,197,102,246,151,163,197,197,51,197,102,246,151,163
.byte	37,37,148,37,53,177,74,16,37,37,148,37,53,177,74,16
.byte	89,89,121,89,242,32,178,171,89,89,121,89,242,32,178,171
.byte	132,132,42,132,84,174,21,208,132,132,42,132,84,174,21,208
.byte	114,114,213,114,183,167,228,197,114,114,213,114,183,167,228,197
.byte	57,57,228,57,213,221,114,236,57,57,228,57,213,221,114,236
.byte	76,76,45,76,90,97,152,22,76,76,45,76,90,97,152,22
.byte	94,94,101,94,202,59,188,148,94,94,101,94,202,59,188,148
.byte	120,120,253,120,231,133,240,159,120,120,253,120,231,133,240,159
.byte	56,56,224,56,221,216,112,229,56,56,224,56,221,216,112,229
.byte	140,140,10,140,20,134,5,152,140,140,10,140,20,134,5,152
.byte	209,209,99,209,198,178,191,23,209,209,99,209,198,178,191,23
.byte	165,165,174,165,65,11,87,228,165,165,174,165,65,11,87,228
.byte	226,226,175,226,67,77,217,161,226,226,175,226,67,77,217,161
.byte	97,97,153,97,47,248,194,78,97,97,153,97,47,248,194,78
.byte	179,179,246,179,241,69,123,66,179,179,246,179,241,69,123,66
.byte	33,33,132,33,21,165,66,52,33,33,132,33,21,165,66,52
.byte	156,156,74,156,148,214,37,8,156,156,74,156,148,214,37,8
.byte	30,30,120,30,240,102,60,238,30,30,120,30,240,102,60,238
.byte	67,67,17,67,34,82,134,97,67,67,17,67,34,82,134,97
.byte	199,199,59,199,118,252,147,177,199,199,59,199,118,252,147,177
.byte	252,252,215,252,179,43,229,79,252,252,215,252,179,43,229,79
.byte	4,4,16,4,32,20,8,36,4,4,16,4,32,20,8,36
.byte	81,81,89,81,178,8,162,227,81,81,89,81,178,8,162,227
.byte	153,153,94,153,188,199,47,37,153,153,94,153,188,199,47,37
.byte	109,109,169,109,79,196,218,34,109,109,169,109,79,196,218,34
.byte	13,13,52,13,104,57,26,101,13,13,52,13,104,57,26,101
.byte	250,250,207,250,131,53,233,121,250,250,207,250,131,53,233,121
.byte	223,223,91,223,182,132,163,105,223,223,91,223,182,132,163,105
.byte	126,126,229,126,215,155,252,169,126,126,229,126,215,155,252,169
.byte	36,36,144,36,61,180,72,25,36,36,144,36,61,180,72,25
.byte	59,59,236,59,197,215,118,254,59,59,236,59,197,215,118,254
.byte	171,171,150,171,49,61,75,154,171,171,150,171,49,61,75,154
.byte	206,206,31,206,62,209,129,240,206,206,31,206,62,209,129,240
.byte	17,17,68,17,136,85,34,153,17,17,68,17,136,85,34,153
.byte	143,143,6,143,12,137,3,131,143,143,6,143,12,137,3,131
.byte	78,78,37,78,74,107,156,4,78,78,37,78,74,107,156,4
.byte	183,183,230,183,209,81,115,102,183,183,230,183,209,81,115,102
.byte	235,235,139,235,11,96,203,224,235,235,139,235,11,96,203,224
.byte	60,60,240,60,253,204,120,193,60,60,240,60,253,204,120,193
.byte	129,129,62,129,124,191,31,253,129,129,62,129,124,191,31,253
.byte	148,148,106,148,212,254,53,64,148,148,106,148,212,254,53,64
.byte	247,247,251,247,235,12,243,28,247,247,251,247,235,12,243,28
.byte	185,185,222,185,161,103,111,24,185,185,222,185,161,103,111,24
.byte	19,19,76,19,152,95,38,139,19,19,76,19,152,95,38,139
.byte	44,44,176,44,125,156,88,81,44,44,176,44,125,156,88,81
.byte	211,211,107,211,214,184,187,5,211,211,107,211,214,184,187,5
.byte	231,231,187,231,107,92,211,140,231,231,187,231,107,92,211,140
.byte	110,110,165,110,87,203,220,57,110,110,165,110,87,203,220,57
.byte	196,196,55,196,110,243,149,170,196,196,55,196,110,243,149,170
.byte	3,3,12,3,24,15,6,27,3,3,12,3,24,15,6,27
.byte	86,86,69,86,138,19,172,220,86,86,69,86,138,19,172,220
.byte	68,68,13,68,26,73,136,94,68,68,13,68,26,73,136,94
.byte	127,127,225,127,223,158,254,160,127,127,225,127,223,158,254,160
.byte	169,169,158,169,33,55,79,136,169,169,158,169,33,55,79,136
.byte	42,42,168,42,77,130,84,103,42,42,168,42,77,130,84,103
.byte	187,187,214,187,177,109,107,10,187,187,214,187,177,109,107,10
.byte	193,193,35,193,70,226,159,135,193,193,35,193,70,226,159,135
.byte	83,83,81,83,162,2,166,241,83,83,81,83,162,2,166,241
.byte	220,220,87,220,174,139,165,114,220,220,87,220,174,139,165,114
.byte	11,11,44,11,88,39,22,83,11,11,44,11,88,39,22,83
.byte	157,157,78,157,156,211,39,1,157,157,78,157,156,211,39,1
.byte	108,108,173,108,71,193,216,43,108,108,173,108,71,193,216,43
.byte	49,49,196,49,149,245,98,164,49,49,196,49,149,245,98,164
.byte	116,116,205,116,135,185,232,243,116,116,205,116,135,185,232,243
.byte	246,246,255,246,227,9,241,21,246,246,255,246,227,9,241,21
.byte	70,70,5,70,10,67,140,76,70,70,5,70,10,67,140,76
.byte	172,172,138,172,9,38,69,165,172,172,138,172,9,38,69,165
.byte	137,137,30,137,60,151,15,181,137,137,30,137,60,151,15,181
.byte	20,20,80,20,160,68,40,180,20,20,80,20,160,68,40,180
.byte	225,225,163,225,91,66,223,186,225,225,163,225,91,66,223,186
.byte	22,22,88,22,176,78,44,166,22,22,88,22,176,78,44,166
.byte	58,58,232,58,205,210,116,247,58,58,232,58,205,210,116,247
.byte	105,105,185,105,111,208,210,6,105,105,185,105,111,208,210,6
.byte	9,9,36,9,72,45,18,65,9,9,36,9,72,45,18,65
.byte	112,112,221,112,167,173,224,215,112,112,221,112,167,173,224,215
.byte	182,182,226,182,217,84,113,111,182,182,226,182,217,84,113,111
.byte	208,208,103,208,206,183,189,30,208,208,103,208,206,183,189,30
.byte	237,237,147,237,59,126,199,214,237,237,147,237,59,126,199,214
.byte	204,204,23,204,46,219,133,226,204,204,23,204,46,219,133,226
.byte	66,66,21,66,42,87,132,104,66,66,21,66,42,87,132,104
.byte	152,152,90,152,180,194,45,44,152,152,90,152,180,194,45,44
.byte	164,164,170,164,73,14,85,237,164,164,170,164,73,14,85,237
.byte	40,40,160,40,93,136,80,117,40,40,160,40,93,136,80,117
.byte	92,92,109,92,218,49,184,134,92,92,109,92,218,49,184,134
.byte	248,248,199,248,147,63,237,107,248,248,199,248,147,63,237,107
.byte	134,134,34,134,68,164,17,194,134,134,34,134,68,164,17,194
.byte	24,35,198,232,135,184,1,79
.byte	54,166,210,245,121,111,145,82
.byte	96,188,155,142,163,12,123,53
.byte	29,224,215,194,46,75,254,87
.byte	21,119,55,229,159,240,74,218
.byte	88,201,41,10,177,160,107,133
.byte	189,93,16,244,203,62,5,103
.byte	228,39,65,139,167,125,149,216
.byte	251,238,124,102,221,23,71,158
.byte	202,45,191,7,173,90,131,51
