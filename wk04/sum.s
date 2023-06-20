# A program with functions to sum 4 numbers, and to sum 2 numbers
# week 4 COMP1521 tutorial 
main:

	push	$ra		# since this code is calling a function, push ra

	li 	$a0, 42		# sum3(42, 2, 6, 5)
	li 	$a1, 2
	li	$a2, 6
	li	$a3, 5
	jal	sum4

	move	$a0, $v0
	li 	$v0, 1
	syscall

	li 	$a0, '\n'	# printf("%c", '\n')
	li 	$v0, 11
	syscall

	pop	$ra
	li 	$v0, 0		# return 0
	jr 	$ra

sum2:
	# Args:     a, b (a0, a1)
	#
	# Returns:  sum
	#
	# Frame:    [$ra]
	# Uses:     [$v0]
	# Clobbers: [$v0]
	#
	# Locals:
	#   - $v0: sum
	#
	# Structure:
	#   sum2
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
	#
sum2_prologue:
	# sw    $fp, -4($sp)	# store and move the frame pointer
        # la    $fp, -4($sp)
        # sw    $ra, -8($sp)	# store the return address
        # addi  $sp, $sp, -12	# change stack pointer location to past the stored data
	begin
	push	$ra
sum2_body:
	add	$v0, $a0, $a1
sum2_return:

        # lw    	$ra, -4($fp)
        # la    	$sp, 4($fp)
        # lw    	$fp, ($fp)
	pop	$ra
	end
	jr 	$ra

sum4:	
	# Args:     a, b, c, d (a0, a1, a2, a3)
	#
	# Returns:  sum
	#
	# Frame:    [$ra, $s0, $s1, $s2]
	# Uses:     [$s0, $s1, $s2, $v0, $a0, $a1]
	# Clobbers: [$v0, $a0, $a1] # act like the function called may clobber others
	#
	# Locals:
	#   - $s0: res1
	#   - $s1: c (temporary)
	#   - $s2: d (temporary)
	#   - $v0: res2 (temporary) sum
	#
	# Structure:
	#   sum2
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
	#
sum4_prologue:
	# use begin to move the frame pointer, put all s registers which 
	# will be used inside the function onto the stack, 
	# as well as the return address
	begin
	push 	$ra
	push	$s0
	push	$s1
	push	$s2
	
sum4_body:
	# int res1 = sum2(a, b);
	move	$s1, $a2	# move c and d to saved registers before calling sum2		
	move	$s2, $a3
	jal	sum2
	move	$s0, $v0

    	# int res2 = sum2(c, d);
	move	$a0, $s1
	move	$a1, $s2
	jal 	sum2

    	# return sum2 (res1, res2);
	move	$a0, $s0
	move	$a1, $v0
	jal	sum2
sum4_return:
	# pop registers off the stack, and use end to move the frame pointer
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr 	$ra