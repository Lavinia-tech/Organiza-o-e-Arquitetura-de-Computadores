.data
	fibonacci: .asciiz "fibonacci: \n"
	virgula: .asciiz ", "
	fim: .asciiz "\n fim"
	razao: .asciiz "\ndivisao: " 
	numero_de_ouro: .asciiz "\nNumero de ouro: \n"
.text
.globl main
main:
	li $t0, 1 
	li $t1, 1
	li $t2, 1
	li $t5, 0
	
	la $s0, virgula
	la $s1, fim
	la $s2, razao
	la $s3, fibonacci
	la $s4, numero_de_ouro
	
	li $v0, 4
	move $a0, $s3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	move $a0, $s0
	syscall
	
	L1:
		slti $t3, $t0, 20
		beq $t3, $t5, saida
		addi $t4, $t1, 0
		addi $t1, $t2, 0
		add $t2, $t2, $t4
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		move $a0, $s0
		syscall
		
		addi $t0, $t0, 1
		j L1
	saida: 
		li $v0, 4
		move $a0, $s1
		syscall
		
		
		
		
	li $t0, 1
    	li $t1, 1 
    	li $t2, 18         

li $v0, 4
move $a0, $s4
syscall

L2:
    add $t3, $t0, $t1

    mtc1 $t3, $f2
    mtc1 $t1, $f4
    cvt.s.w $f2, $f2
    cvt.s.w $f4, $f4

    div.s $f6, $f2, $f4

    li $v0, 4
    la $a0, razao
    syscall

    li $v0, 2
    mov.s $f12, $f6
    syscall

    li $v0, 4
    la $a0, virgula
    syscall

    move $t0, $t1
    move $t1, $t3

    sub $t2, $t2, 1
    bgtz $t2, L2

    li $v0, 10
    syscall
