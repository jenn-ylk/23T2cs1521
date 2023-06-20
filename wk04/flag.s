# A program that prints out the Danish flag, stored in the data section

main:   # Registers: 
        # t0 - row
        # t1 - col 
	# t2 - temporary offset

	li $t0, 0
row_loop_start:
	bge	$t0, 6, row_loop_end
	li 	$t1, 0
col_loop_start:
	bge	$t1, 12, col_loop_end
	# print out the flag from memory
	mul	$t2, $t0, 12
	add	$t2, $t2, $t1
	lb	$a0, flag($t2)	# offset is row * number of cols + col
	li 	$v0, 11
	syscall

	li	$a0, ' '
	li 	$v0, 11
	syscall

	add	$t1, $t1, 1
	b 	col_loop_start
col_loop_end:
	li	$a0, '\n'
	li	$v0, 11
	syscall

	add	$t0, $t0, 1
	b 	row_loop_start
row_loop_end:

	li $v0, 0	# return 0
	jr $ra

    .data
flag:
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'