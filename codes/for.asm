	.data
barran: .asciiz "\n"
	# i = $s0
	# resultado = $s1
	# n = $s2
	# valor = $s3

	.text
	
	li $v0, 5 # Comando para ler o teclado (n)
	syscall
	move $s2, $v0
	
	addi $s1, $zero, 0 # Resultado = 0
	addi $s0, $zero, 0 # i = 0

loop:	slt $t2, $s0, $s2 # Verifica se i < n
	beq $t2, $zero, exit # Se i ! < 0, sai do loop
	
	li $v0, 5 # Comando para ler o teclado (valor)
	syscall
	move $s3, $v0
	
	add $s1, $s1, $s3 # resultado += valor
	addi $s0, $s0, 1 # i++
	j loop
	
exit:	li $v0, 1 #Comando para printar Inteiro
	move $a0, $s1
	syscall
	
	li $v0, 4 #comando parar printar String
	la $a0, barran
	syscall
	
	li $v0, 10 # Comando de saida
	syscall