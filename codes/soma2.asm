	.data

	.text
main:	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s2, $v0
	
	li $v0, 5 # comando para ler um numero inteiro do teclado
	syscall 
	move $s3, $v0
	
	add $s1, $s2, $s3 # somando $s2 e $s3 e salvando em $s1
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 10 #instrução para finalizar o programa
	syscall #finaliza o programa