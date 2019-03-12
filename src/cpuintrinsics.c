
#include <stdio.h>
#include <immintrin.h>

unsigned int randuint()
{
    unsigned int result;
    if (_rdrand32_step(&result))
        return result;
    return 0;
}

int main(int argc, char *argv[])
{
    printf("Random number: %u \n", randuint());
}

