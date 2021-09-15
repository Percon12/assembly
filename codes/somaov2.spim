.data
overflow:	.asciiz "overflow"
barran:   	.asciiz "\n"

.text

main:
# Verifica a entrada (1 ou 0) / 1 é com sinal e 0 é sem sinal
	li $v0, 5
	syscall 
	move $t4, $v0
    
# Syscall para escanear o primeiro inteiro
	li $v0, 5
	syscall 
	move $t1, $v0
	
# Syscall para escanear o segundo inteiro
	li $v0, 5
	syscall
	move $t2, $v0
	
# Soma caso nao haja overflow
	addu $t4, $t1, $t2
	
# Verificando o sinal dos operadores caso nao haja overflow
	xor $t3, $t1, $t2
	slt $t3, $t3, $zero
	bne $t3, $zero, sovf
	
# Verificando o sinal com o reultado para saber se há overflow
	xor $t3, $t4, $t1
	slt $t3, $t3, $zero
	bne $t3, $zero, ovf
	
# Se não ouver overflow, faz o print da soma
sovf:
	li $v0, 1
	move $a0, $t4
	syscall 
	    
	li $v0, 4
	la $a0, barran
	syscall
	    
	j exit
	    
# Se tiver overflow faz o print
ovf:
	li $v0, 4
	la $a0, overflow
	syscall
	    
	li $v0, 4
	la $a0, barran
	syscall
	    
exit:
	li $v0, 10
	syscall
