# Prints the square of a number

SQUARE_MAX = 46340

main:                           # x, y in $t0, $t1
        la      $a0, prompt_str # printf("Enter a number: ");
        li      $v0, 4
        syscall

        li      $v0, 5          # scanf("%d", x); (load immediate value to v0 - specify the type of syscall)
        syscall
        move    $t0, $v0

        # TODO: Change this to only square if x * x will be less than the maximum 32 bit int value
	bgt	$t0, SQUARE_MAX, too_big

        mul     $t1, $t0, $t0   # y = x * x

        move    $a0, $t1        # printf("%d", y);
        li      $v0, 1
        syscall

        li      $a0, '\n'       # printf("%c", '\n');
        li      $v0, 11
        syscall

	b	end

too_big:
	la	$a0, too_big_str
	li	$v0, 4
	syscall

end:

        jr      $ra             # return from main

        .data
prompt_str:
        .asciiz "Enter a number: "
too_big_str:
	.asciiz "square too big for 32 bits\n"