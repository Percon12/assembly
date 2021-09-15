.data
    ovf: .asciiz "overflow"
    quebra: .asciiz "\n"
.text
    main:
    	# Primeira entrada ( 0 ou 1 )
    	li $v0, 5
	syscall 
	move $t3, $v0
    
    	# Pega o Primeiro Valor
	li $v0, 5
	syscall 
	move $t1, $v0
	
	# Pega o Segundo Valor
	li $v0, 5
	syscall
	move $t2, $v0
	
	# Soma os dois ignorando overflow
	addu $t0, $t1, $t2
	
	# Verifica o sinal dos operandos
	xor $t3, $t1, $t2
	slt $t3, $t3, $zero
	bne $t3, $zero, sem_overflow
	
	# Verifica o sinal dos operandos com o resultado
	xor $t3, $t0, $t1
	slt $t3, $t3, $zero
	bne $t3, $zero, overflow
	
	# Printa a soma caso não haja overflow
	sem_overflow:
	    li $v0, 1
	    move $a0, $t0
	    syscall 
	    
	    li $v0, 4
	    la $a0, quebra
	    syscall
	    
	    b exit
	    
	# Printa overflow caso haja
	overflow:
            li $v0, 4
	    la $a0, ovf
	    syscall
	    
	    li $v0, 4
	    la $a0, quebra
	    syscall
	    
    exit:
    	li $v0, 10
    	syscall