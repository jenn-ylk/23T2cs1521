// A simple program that will read 10 numbers into an array

#define N_SIZE 5

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0};

    i = 0;
    while (i < N_SIZE) {
        scanf("%d", &numbers[i]);
        i++;
    }

    /*
    i = 0;
    while ( < N_SIZE) {
        numbers[i] = numbers[i] + 42;
        i++;
    }
    */

    // when altering a value in an array, it expands into these actions
    // numbers[i] = numbers[i] + 42;
    int t0 = numbers[i]; // *(numbers + i)
    t0 = t0 + 42;
    numbers[i] = t0;


    i = 0;
    while ( < N_SIZE) {
        printf("%d\n", numbers[i]);
        i++;
    }
}