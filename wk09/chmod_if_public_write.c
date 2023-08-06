// code that will change file permissions to not be publically writeable 
// if it is publically writeable
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    struct stat s;
    for (int i = 1; i < argc; i++) {
        // stat the file, error if stat fails
        struct stat s;
        if (stat(argv[i], &s) != 0) {
            perror(argv[i]);
            continue;
        }

        
        // get the file mode from the stat struct, and check flags for 
        // whether it is public writable
        int mode = s.st_mode;
        // change the permissions with chmod if the file is publically writeable
        if (mode & S_IWOTH) {
            printf("removing public write from %s\n", argv[i]);
            // change the permissions
            chmod(argv[i], mode & ~(S_IWOTH));

        } else {
            printf("%s is not publically writable\n", argv[i]);
        }
        // 0101
        // ! - logical not -> 0000
        // ~ - bitwise not -> 1010
    }
    
    return 0;
}