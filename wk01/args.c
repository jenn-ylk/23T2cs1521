#include <stdio.h>
#include <stdlib.h>

// > ./args hello there
// argc = 3
// argv can be a char **, char [][], char *[]
// argv = ["./args", "hello", "there"]


int main(int argc, char *argv[]) {
    // print out each of the arguments and their index
    printf("argc=%d\n", argc);
    for (int i = 0; i < argc; i++) {
        printf("argv[%d]=%s\n", i, argv[i]);
    }
    return 0;

    /*
    // Sum all numbers provided on the command line and print the total
    int sum = 0;
    for (int i = 0; i < argc; i++) {
        sum += atoi(argv[i]);
    }
    printf("sum of command-line arguments = %d\n", sum);
    return 0;
    */
}
