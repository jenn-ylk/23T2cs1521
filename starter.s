# TODO: 
main:
	li $a0, 42	# printf("%d", 42)
	li $v0, 1
	syscall

	li $a0, '\n'	# printf("%c", '\n')
	li $v0, 11
	syscall

	li $v0, 0	# return 0
	jr $ra