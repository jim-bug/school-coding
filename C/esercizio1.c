#include <stdio.h>

int main()
{
    // algoritmo che dato un valore k legga n numeri e conti quanti di essi siano multipli di k:
    int k;
    int n;
    int nums;
    int cont = 0;
    printf("Inserisci il numero di confronto:\t");
    scanf("%i",&k);
    printf("Inserisci quanti numeri vuoi confrontare:\t");
    scanf("%i",&n);
    for (int i = 0;i < n;i++)
    {
        printf("Inserisci un numero:\t");
        scanf("%i",&nums);
        if (nums % k == 0)
        {
            cont ++;
        }

    }
    printf("I numeri multipli di %i sono: %i",k,cont);

    return 0;
}
