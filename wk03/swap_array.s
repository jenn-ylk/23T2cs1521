# A piece of code that swaps all values of an array around to reverse the array

N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

main:	# Registers:
	# t0 - i
	# t1 - x
	# t2 - y
	# t3 - temporary offset for i
	# t4 - temporary index/offset for N_SIZE_M_1 - i
	

	li 	$t0, 0				# i = 0;
loop_swap_start:
	bge	$t0, N_SIZE_D_2, loop_swap_end	# while (i < N_SIZE_D_2)

	mul	$t3, $t0, 4			# calculate offsets and get array values
	lw	$t1, numbers($t3)		# int x = numbers[i];

	sub	$t4, N_SIZE_M_1, $t0
	mul	$t4, $t4, 4
	lw	$t2, numbers($t4) 		# int y = numbers[N_SIZE_M_1 - i];

	sw	$t2, numbers($t3)		# numbers[i] = y;
	sw	$t1, numbers($t4)		# numbers[N_SIZE_M_1 - i] = x;

	add	$t0, $t0, 1 			# i++;
loop_swap_end:


	# Print out the array, now reversed
	li	$t0, 0
loop_write_start:

	bge 	$t0, N_SIZE, loop_write_end	# if (i >= NSIZE)  (while loop condition)

						# syscall for printf("%d", numbers[i])
	mul	$t1, $t0, 4			# calculate array offset
	lw	$a0, numbers($t1)		# load value from numbers into $a0 (to print)
	li	$v0, 1
	syscall					

	li $a0, '\n'				# printf("%c", '\n')
	li $v0, 11
	syscall

	add $t0, $t0, 1
	b loop_write_start

loop_write_end:


	li $v0, 0	# return 0
	jr $ra

	.data
numbers: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9	# int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};