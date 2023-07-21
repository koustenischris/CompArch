#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
}

void bubbleSort(int *A, int N)
{
    int i, j;
    bool swapped;
    for (i = 0; i < N - 1; i++)
    {
        swapped = false;
        for (j = 0; j < N - i - 1; j++)
        {
            if (A[j] > A[j + 1])
            {
                swap(&A[j], &A[j + 1]);
                swapped = true;
            }
        }
        if (!swapped)
            break;
    }
}

void cocktailSort(int *A, int N)
{
    bool swapped = true;
    int start = 0;
    int end = N - 1;

    while (swapped)
    {
        swapped = false;
        for (int i = start; i < end; i++)
        {
            if (A[i] > A[i + 1])
            {
                swap(&A[i], &A[i + 1]);
                swapped = true;
            }
        }
        if (!swapped)
            break;
        swapped = false;
        end--;
        for (int i = end - 1; i >= start; i--)
        {
            if (A[i] > A[i + 1])
            {
                swap(&A[i], &A[i + 1]);
                swapped = true;
            }
        }
        start++;
    }
}
void insertionSort(int *A, int N)
{
    int key, j;
    for (int i = 1; i < N; i++)
    {
        key = A[i];
        j = i - 1;
        while (j >= 0 && A[j] > key)
        {
            A[j + 1] = A[j];
            j--;
        }
        A[j + 1] = key;
    }
}

void RecursiveInsertionSort(int *A, int N){
   if (N <= 1) // end of recursions
      return;
   RecursiveInsertionSort(A, N-1 );
   int nth = A[N-1];
   int j = N-2;
   while (j >= 0 && A[j] > nth){
      A[j+1] = A[j];
      j--;
   }
   A[j+1] = nth;
}

void printArray(int *array, int N)
{
    for (int i = 0; i < 5; ++i)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Driver Program
int main()
{
    int array[] = {5, 1, 4, 2, 8};
    bubbleSort(array, 5);
    printf("For bubbleSort :");
    printArray(array, 5);
    //
    cocktailSort(array, 5);
    printf("For cocktailSort :");
    printArray(array, 5);
    //
    insertionSort(array, 5);
    printf("For insertionSort :");
    printArray(array, 5);
 
    RecursiveInsertionSort(array, 5);
    printf("For insertionSort :");
    printArray(array, 5);
    return 0;

}
