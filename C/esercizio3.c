#include <stdio.h>

int main()
{
    // algoritmo che dato un valore k legga n numeri e conti quanti di essi siano: uguali, maggiori o minori di k:

    int k;
    int n;
    int nums;
    int cont_max = 0;
    int cont_equal = 0;
    int cont_min = 0;
    printf("Inserisci il numero di confronto:\t");
    scanf("%i",&k);
    printf("Inserisci quanti numeri vuoi confrontare:\t");
    scanf("%i",&n);
    for (int i = 0;i < n;i++)
    {
        printf("Inserisci un numero:\t");
        scanf("%i",&nums);
        if (nums > k)
        {
            cont_max ++;
        }
        if (nums < k)
        {
            cont_min ++;
        }
        if (nums == k)
        {
            cont_equal ++;
        }
    }
    printf("I numeri maggiori di %i sono: %i\nI numeri minori di %i sono: %i\nI numeri uguali a %i sono: %i",k,cont_max,k,cont_min,k,cont_equal);

    return 0;
}
