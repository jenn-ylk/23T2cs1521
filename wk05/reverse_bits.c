// Code containing a function that will reverse the bits of an unsigned int

#include <stdint.h>
#include <stdio.h>

#define WORD_BITS 32

typedef uint32_t Word;

void printBits(Word w) {
    // TODO: how does this code work to print bits of a number
    for (int shift = WORD_BITS-1; shift >= 0; shift--) {
        printf("%d", (w >> shift) & 1);
    }
    printf("\n");
}

// a function that reverses the bit order of a word
Word reverseBits(Word w) {
    Word new_word = 0;
    for (int shift = 0; shift < WORD_BITS; shift++) {
        // put the next lowest bit in and shift up once
        // inserting from lowest and shifting them right reverses the order)
        new_word |= (w >> shift) & 1;
        new_word = new_word << 1;
    }
    return new_word;
}

int main(void) {
    Word w = 0x4A1900FF; // 0x01234567;
    printBits(w);
    printBits(reverseBits(w));
}