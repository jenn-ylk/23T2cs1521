# A translation of a c program that prints a pyramid of asterisks

# When writing branching code with loops, make sure the start of loop label is 
# _before_ your conditional check
# Often (but not all the time) you will want to invert the condition of the 
# original loop condition, and branch to the end of the loop

main:	# i in $t0, j in $t1
	li $t0, 1
start_outer_loop:

	bgt 	$t0, 10, end_outer_loop

	# inner loop to print the triangle

	li 	$t1, 0				# int j = 0

start_inner_loop:

	bge	$t1, $t0, end_inner_loop	# if (j >= i) goto end_inner_loop

	li 	$a0, '*'			# printf("%d", 42)
	li 	$v0, 11
	syscall

	add 	$t1, $t1, 1			# j = j + 1

	b start_inner_loop

end_inner_loop:

	li $a0, '\n'				# printf("%c", '\n')
	li $v0, 11
	syscall

	add $t0, $t0, 1 			# t0 = t0 + 1

	b start_outer_loop

end_outer_loop:

	li $v0, 0				# return 0
	jr $ra