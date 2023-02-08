#include <stdio.h> 
void bubble_sort(int[],int);
int main ()
{
    // data una sequenza di numeri n trovare il valore mediano, con vettori:

    int index; // lunghezza vettore
    int medial_numbers; // valore mediana
    int medial; // qui si andrà a definire la posizione della mediana
    printf("Scegli il numero della tua sequenza:\t");
    scanf("%i",&index);
    
    int arr[index];
    medial = (int) index/2; // calcolo la posizione della mediana
    
    for (int i = 0;i < index;i++) // qui vado a popolare il vettore
    {
        printf("Scegli l'elemento della posizione %i:\t",i);
        scanf("%i",&arr[i]);
    }
    bubble_sort(arr,index);
    if (index % 2 == 0) // verifico se la lunghezza del vettore è pari
    {
        // se la lunghezza del vettore è pari:
        medial_numbers = arr[medial-1] + arr[medial]; // sommo il valore precedente alla posizione medial per il valore che si trova alla posizione medial
    }
    else // se non è pari
    {
        medial_numbers = arr[medial]; // significa che la mediana sarà il valore che si trova alla posizione medial del vettore.
    }
    printf("La mediana della sequenza è %i",medial_numbers);
    return 0;
}
void bubble_sort(int arr[], int index)
{
    for (int i = 0; i < index - 1; i++)
    {
        for (int j = 0; j < index - i - 1; j++) 
        {
            if (arr[j] > arr[j + 1])
            {
                int tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
}