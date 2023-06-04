#include <stdio.h>
#include <stdlib.h>

int *get_num_ptr(void) {
    // n must be malloced to use memory on the heap, rather than stack memory of
    // a local variable, which is no longer usable after the function returns
    int *n = malloc(sizeof int);

    *n = 42;

    return n;
}

int main(void) {
    int *num = get_num_ptr();

    printf("%d\n", *num);

    free(num);
}
