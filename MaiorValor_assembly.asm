.data
	x: .word 0, 1, 12, 3, 5, 8, 15, 2, 1
	maior: .word 0
.text
.globl main
main:
	la $s0, x        
	la $s1, maior   
	li $t0, 0        #contador
	li $t1, 9        #tamanho do vetor
	lw $t5, 0($s0)   #inicializa maior com o primeiro elemento

	L1:slt $t2, $t0, $t1    #verifica se i < 9
	   beq $t2, $zero, fim  #se não, vai para fim
	
	    sll $t3, $t0, 2      #multiplica contador por 4
	    add $t3, $t3, $s0    #enderço certo pra $s0
	    lw $t4, 0($t3)       #$t4 recebe o valor de x[i]
	
	    slt $t6, $t5, $t4    #compara se maior é <x[i]
	    beq $t6, $zero, prox #se for menor proximo elemento do vetor
	    move $t5, $t4        #se for maior, $t5 recebe x[i]

	prox: addi $t0, $t0, 1
	          j L1

	fim: sw $t5, 0($s1) #salva maior no endereço da variável
