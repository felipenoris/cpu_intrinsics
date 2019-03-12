
#include <stdio.h>
#include <immintrin.h>

unsigned int randuint()
{
    unsigned int result;
    _rdrand32_step(&result);
    return result;
}

int main(int argc, char *argv[])
{
    printf("Random number: %u \n", randuint());
}

