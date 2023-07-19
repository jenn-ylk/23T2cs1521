#include <stdint.h>
#include <stdio.h>


// Whether the printer is out of ink
#define NO_INK (0x1)       // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2)       // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4) // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8)  // 0b 0000 1000
// Start print/scan
#define START (0x10)       // 0b 0001 0000

uint8_t printerControl = NO_INK; // 0b 0000 0000

#define INK_CHECK       'i'
#define INK_REPLACE     'r'
#define COLOUR_SCAN     'c'
#define TOGGLE_SCAN     's'
#define GO              'g'


// TODO: fill the below functions!!
// "refills" the ink, and changes the indicator on the flag
void check_ink() {
    if (printerControl & NO_INK) {
        // same as : (printerControl & NO_INK) == NO_INK
        // printerControl & 0b00000001
        printf("No ink, please refill!\n");
    } else {
        printf("Ink remaining\n");
    }
}

// switch the NO_INK flag to show there is now ink
void replace_ink() {
    printerControl &= ~NO_INK;
}

void switch_colour_scan() {
    printerControl |= (COLOUR | SELECT_SCAN);
}

void switch_scan() {
    printerControl ^= (SELECT_SCAN | SELECT_PRINT);
}

void go() {
    
}

int main(void) {
    char command;
    while (scanf(" %c", &command) == 1) {
        if (command == INK_CHECK) {
            check_ink();
        } else if (command == INK_REPLACE) {
            replace_ink();
        } else if (command == COLOUR_SCAN) {
            switch_colour_scan();
        } else if (command == TOGGLE_SCAN) {
            switch_scan();
        } else if (command == GO) {
            go();
        }
        printf("Current printer status is: \n");
        // print out all the bits
        for (int i = 7; i >= 0; i--) {
            printf("%d", (printerControl >> i) & 1);
        }
        printf("\n");
    }

    return 0;
}