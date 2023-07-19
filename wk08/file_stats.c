// Code that takes in a filename and provides some info (using stat struct)

#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#define MAX_LINE_LEN 256

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr,  "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // run stat on the file - if there is an error, print the error
    struct stat s;
    if (stat(argv[1], &s) != 0) {
        // print out the error - starting with the name of the file (provided)
        perror(argv[1]);
        exit(1);
    }
    // print out the user id number and the digits of mode related to permissions
    printf(
        "%s is owned by user id %u, with permissions %o\n", 
        argv[1], 
        s.st_uid, 
        s.st_mode & 0777
    );

    return 0;
}