#include <stdio.h>
//#include <stdlib.h>
//#include <errno.h>
//#include <string.h>
//#include <unistd.h>
#include <spawn.h>
#include <sys/types.h>
//#include <sys/stat.h>
#include <sys/wait.h>

// sets up environment variable
extern char **environ;

void spawn_and_wait(char **args) {
    // set things up to spawn a process, then wait for it to finish
    pid_t pid;
    if (posix_spawn(&pid, args[0], NULL, NULL, args, environ)) {
        perror(args[0]);
    }
    int status;
    waitpid(pid, &status, 0);
}

int main(void) {
    // use whereis to find the locations of commands
    // call spawn and wait to run the commands
    spawn_and_wait((char *[]){"/bin/date", "+%T", NULL});
    spawn_and_wait((char *[]){"/bin/whoami", NULL});
    return 0;
}