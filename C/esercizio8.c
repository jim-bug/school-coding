#include <stdio.h>

int main()
{
    // Progettare un algoritmo che legga una sequenza di valori numerici fino a che la loro somma è minore di 100 e scriva la somma ottenuta e quanti sono i valori letti:
    int nums;
    int somma = 0;
    int i = 0;
    
    while (somma < 100)
    {
        printf("Inserisci il numero:\t");
        scanf("%i",&nums);
        i ++;
        somma += nums;
    }
    
    printf("Somma numeri: %i\nTotali numeri inseriti: %i",somma,i);
    return 0;
}
