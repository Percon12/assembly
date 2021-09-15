	.data
overflow:	.asciiz "overflow\n"
	
	.text
main:
	li $v0, 5 # 1 para com sinal, 0 para sem sinal
	syscall 
	move $s0, $v0
	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s2, $v0
	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s3, $v0
	
	beq $s0, 1, cs
	bne $s0, 1, ss
	
	
cs:	addu $s1, $s2, $s3 # somando $s2 e $s3 e salvando em $s1 / com sinal / 1

	xor $s4, $s2, $s3 #verifica de o sinal é igual
	
	sltu $s4, $s4, $zero # if $t3 não for = a 0
	bne $s4, $zero, sof
	
	xor $s4, $s1, $s2 
	sltu $s4, $s4, $zero
	bne $s4, $zero, of
	
	
ss:	nor $s5, $s2, $zero #fazendo complemento a 2 de $s2
	sltu $s5, $s5, $s3 # verificando se $s2 < $s3
	
	bne $s5, $zero, of # se $s5 for igual a 0 ocorre overflow
	
	beq $s5, $zero, sofss # se $s5 for diferente de 0 nao ocorre overflow


sofss: 	addu $s1, $s2, $s3
	
	li $v0, 1
	move $a0, $s1
	syscall
	j exit
	
sof:	li $v0, 1
	move $a0, $s1
	syscall
	j exit

of:	li $v0, 4
	la $a0, overflow
	syscall
	j exit
	
exit:	li $v0, 10 #instrução para finalizar o programa
	syscall #finaliza o programa
