	.data
#$a0 - dividendo - numero de cima
#$a1 - divisor - numero de baixo
#lo - resultado da divisao - quociente
#hi - resto da divisao
barran:	.asciiz "\n"

	.text
main:
	li $v0, 5 # comando para ler o dividendo
	syscall 
	move $a0, $v0
	
	li $v0, 5 # comando para ler o divisor
	syscall 
	move $a1, $v0

divfac:	#função de divisão
	div $t0, $a0, $a1
	
	mflo $s0
	mfhi $s1
	
#Printando o Resultado	
	li $v0, 1
	move $a0, $s0
	syscall
		
	li $v0, 4
	la $a0, barran
	syscall
	
#Printando o Resto
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, barran
	syscall

#finaliza o programa
	li $v0, 10
	syscall
