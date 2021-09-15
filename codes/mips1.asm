	.data
str:	.asciiz "The answer is = "
	.text
main:
	li $v0, 8 #codigo de chamada para ler string
	syscall
	
	li $v0, 4 #codigo de chamada ao sistema para print_str
	la $a0, str #endereço da string a imprimir
	syscall #imprime a string
	
	li $v0, 5 #codigo de chamada para ler int
	syscall
	
	li $v0, 1 #codigo da chamda ao sistema para print_int
	li $a0, 5 #inteiro a imprimir
	syscall #imprime o inteiro

	li $v0, 10 #comando para a saida do sistema
	syscall # executa a saida
