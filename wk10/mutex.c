#include <stdio.h>
#include <pthread.h>

int global_total = 0;
// TODO: create a lock
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

void *add_5000_to_counter(void *data) {
    for (int i = 0; i < 5000; i++) {
        nanosleep (&(struct timespec){.tv_nsec = 10000}, NULL);

        pthread_mutex_lock(&lock);
        // critical section
        global_total++;
        pthread_mutex_unlock(&lock);
    }

    return NULL;
}

int main(void) {
    pthread_t thread1;
    pthread_create(&thread1, NULL, add_5000_to_counter, NULL);

    pthread_t thread2;
    pthread_create(&thread2, NULL, add_5000_to_counter, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // if program works correctly, should print 10000
    printf("Final total: %d\n", global_total);
}