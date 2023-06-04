// 

#include <stdio.h>

int factorial_iter(int n) {
    int result = 1;

    for (int i = 1; i <= n; i++) {
        result = result * i;
    }

    return result;
}

int factorial_rec(int n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial_rec(n - 1);
    }
}


int main(void) {
    printf("Enter a number: ");
    int n;
    scanf("%d", &n);

    printf("%d! = %d\n", n, factorial_rec(n));

    return 0;
}