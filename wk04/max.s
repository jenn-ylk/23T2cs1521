# A program with a function to recursively determine the maximum value of an array
max:
	# Args:     &array[0], length (a0, a1)
	#
	# Returns:  sum
	#
	# Frame:    [$ra, $s0]
	# Uses:     [$v0, $s0]
	# Clobbers: [$v0]
	#
	# Locals:
	#   - $v0: max_so_far
	#   - $s0: first_element
	#
	# Structure:
	#   max
	#   -> [prologue]
	#       -> body
	#       -> base
	#       -> recursive
	#   -> [epilogue]
	#
max_prologue:
        # prologue section before code, 
        # add elements to the stack that need to be used
	begin
	push 	$ra
	push	$s0
max_body:
	# load in the current value, and decide whether to go into the base case or recursive
	lw	$s0, ($a0)		# if not stored in $s[0-7] it would be clobbered later
	bne	$a1, 1, recursive
base: 
	move	$v0, $s0		# return first_element
	b 	max_epilogue
recursive:
	add	$a0, $a0, 4		# max_so_far = max(&array[1], length - 1)
	add	$a1, $a1, -1
	jal	max

	ble	$s0, $v0, max_epilogue	# if (first_element > max_so_far)
        move	$v0, $s0		# max_so_far = first_element;

max_epilogue:
        # epilogue section - pop elements from the stack
        pop	$s0
	pop	$ra
	end
	jr      $ra

main:

        push    $ra

        la      $a0, array
        li      $a1, 10
        jal     max             # call max(array, 10)

        move    $a0, $v0        # printf ("%d")
        li      $v0, 1
        syscall

        li      $a0, '\n'       # printf("%c", '\n');
        li      $v0, 11
        syscall

                                
        pop     $ra		# clean up stack frame

        li      $v0, 0          # return 0
        jr      $ra


.data
array:
    .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1