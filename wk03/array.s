NSIZE = 5

main:	# registers:
	# $t0 - i
	# $t1 - i * 4 (temp, for word alignment)

	# translate array.c into mips here, 
	# which reads in and prints out an array

	li $t0, 0				# i = 0

loop_read_start:
	bge 	$t0, NSIZE, loop_read_end	# if (i >= NSIZE)  (while loop condition)

	li 	$v0, 5				# scan in the next value in the array
	syscall

	mul	$t1, $t0, 4			# calculate array offset
	sw	$v0, numbers($t1)		# numbers[i] = scanned value

	add 	$t0, $t0, 1			# i++
	b 	loop_read_start
	
loop_read_end:	

	li 	$t0, 0				# i = 0
loop_write_start:

	bge 	$t0, NSIZE, loop_write_end	# if (i >= NSIZE)  (while loop condition)

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

	li $v0, 0				# return 0
	jr $ra

	.data
numbers: .space NSIZE * 4