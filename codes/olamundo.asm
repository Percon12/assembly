	.data # área para dados na memória principal
		msg: .asciiz "Ola Mundo" # mensagem a ser exibida para o usuário

	.text # área para instruções do programa
main:
		li $v0, 4 #instrução para impressão da string / Geralmente é printado no registrador $a0
		la $a0, msg #la vai indicar o endereço onde está a mensagem msg
		syscall #faça! imprima
		
		li $v0, 10 #instrução para finalizar o programa
		syscall #finaliza o programa
