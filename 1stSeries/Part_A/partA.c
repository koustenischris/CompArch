#include <stdlib.h>
#include <stdio.h>

void print(int array[], int size)
{
    for(int i=0; i<size; ++i)
      printf("%d ",array[i]);
    printf("\n");
}

int main()
{
    int array[20];
    int *p;
    int N = 2;
    size_t n = sizeof(array)/sizeof(array[0]);

    for(int i=0; i<20; ++i)
    {
        array[i] = i + 10;
    }
    p = &array[3];

    while (*p != 0)
    {
        if (*p < 50)
            *p = *p % N;
        else
            *p = *p / N;
        p++;
    }
    print(array, n);
    printf("%d\n",array[20]);
}
