// Prints a right - angled triangle of asterisks, 10 rows high.

#include <stdio.h>

int main(void) {
    int i = 1;
    start_loop:
    // invert while loop condition
    if (i > 10) goto end_loop;

        // for (int j = 0; j < i; j++) {
        //     printf("*");
        // }
        printf("*\n");
        i++;
        goto start_loop;
    end_loop:
    return 0;
}