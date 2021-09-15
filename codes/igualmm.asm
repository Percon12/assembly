	.data

	.text
main:	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s0, $v0 #armazena o que foi lido em s0
	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s1, $v0 #armazena o que foi lido em s1
	
	beq $s0, $s1, L1 # se $s0 for igual a $s1 vai para a isntrução L1
	
	slt $t0, $s0, $s1  # se $s0 for menor que $s1: $t0 = 1 else $t0 = 0
	beq $t0, $zero, L2 # se $t0 for igual a 0 vá para L2
	bne $t0, $zero, L3 # se $t0 for diferente de 0 vá para L3
	
L1: 	add $s2, $s0, $s1 # $s0 + $s1 = $s2
	move $a0, $s2
	li $v0, 1 #codigo da chamda ao sistema para print_int
	syscall #imprime o inteiro
	j exit
	
L2:	sub $s2, $s0, $s1 # $s0 - $s1 = $s2
	move $a0, $s2
	li $v0, 1 #codigo da chamda ao sistema para print_int
	syscall #imprime o inteiro
	j exit

L3:	sub $s2, $s1, $s0 # $s1 - $s0 = $s2
	move $a0, $s2
	li $v0, 1 #codigo da chamda ao sistema para print_int
	syscall #imprime o inteiro
	j exit
	
exit:	li $v0, 10
	syscall
