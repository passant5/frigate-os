#ifndef RANDOM_GENERATOR_H
#define RANDOM_GENERATOR_H

#define SEED 0x114185D1 // random seed

unsigned int xorshift32(unsigned int *state){
    unsigned int x = *state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    *state = x;
    return x;
}

unsigned int generateRandomBits(unsigned int *state, int numBits) {
    unsigned int mask = (1 << numBits) - 1;
    return xorshift32(state) & mask;
}

#endif // RANDOM_GENERATOR_H