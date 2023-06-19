# TODO: 
main:	# s is t0, length is t1, the temporary character value is t2
	la 	$a0, string 	# printf("%s", string)
	li 	$v0, 4
	syscall

	li 	$a0, '\n'	# printf("%c", '\n')
	li 	$v0, 11
	syscall

	la 	$t0, string	# t0 = &string[0];
	li 	$t1, 0

loop_start:
	lb	$t2, ($t0)	# if *s == 0 goto end
	beqz	$t2, loop_end

	add 	$t0, $t0, 1	# s++
	add	$t1, $t1, 1	# length++

	b 	loop_start
loop_end:

	# Ttranslate the code to determine the length of our string

	move 	$a0, $t1	# printf("%d", length)
	li	$v0, 1
	syscall

	li 	$a0, '\n'	# printf("%c", '\n')
	li 	$v0, 11
	syscall

	li 	$v0, 0	# return 0
	jr 	$ra

	.data
string:	.asciiz "Hello there!!"