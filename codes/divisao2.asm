#$a0 - dividendo - numero de cima - parte menos significativa do resto
#$a1 - divisor - numero de baixo - 32 bits - parte mais significativa do resto
#lo/$s0 - resultado da divisao - quociente - 32 bits
#hi/s1 - resto da divisao - 64 bits
#s1(0)/s2 - parte mais significativa do resto
#s1(8)/s3 - parte menos significativa do resto
#$t0 contador

divfac:	
	li $v0, 5 # comando para ler o dividendo
	syscall 
	move $a0, $v0
	
	li $v0, 5 # comando para ler o divisor
	syscall 
	move $a1, $v0
	
	addi $t0, $zero, 1 #criando o contador = 1
	
	lw  $s1, 8($a0) #salvando $a0 na parte menos sognificativa de $s1(8)
	lw  $s3, 8($a0) #salvando $s3 na parte menos sognificativa de $s1(8)
retorna:	
	sll $s1, $s1, 1 #deslocando $s1 1 bit para a esquerda
	
	lw $s1, 0($a0) #colocando $a0 na parte mais significativa de $s1(0)
	lw $s2, 0($a0) ##colocando $a0 na parte mais significativa de $s2
	
	sub $s2, $s2, $a1 # $s2 = $s2 - $a1
	lw $s1,0($s2) #Voltando o valor da parte mais significativa ($s2) para o resto 0($s1)
	
	sll $s0 ,$s0, 1 #deslocando $s0 1 bit a esquerda
	
	bge $s1, $zero, colocaum
	blt $s1, $zero, restaura
	
colocaum:
	sll $s0, $s0 , 1 #deslocando $s1 1 bit a esquerda
	addi $s0, $s0, 1 #somando 1 no bit menos significativo em $s1
	j verifica

restaura:
	add $s2, $s2, $a1 #$s2 = $s2 + $a1
	lw $s1,0($s2) #Voltando o valor da parte mais significativa ($s2) para o resto 0($s1)
	j verifica

verifica:
	addi $t0, $t0, 1 # $t0 = $t0 + 1
	blt $t0, 33 , retorna # Se $t0 < 33 vai para função retorna
	beq $t0, 33 , exit # Se %t0 = 33 vai pra função de saida

exit:   #finaliza o programa
	li $v0, 10
	syscall
