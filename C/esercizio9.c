#include <stdio.h>

int main()
{
    // Progettare un algoritmo che, dati due valori numerici h e k, legga n valori e conti quanti di essi sono compresi tra h e k scrivendo il risultato:

    int h;
    int k;
    int n;
    int nums;
    int cont = 0;
    
    printf("Inserisci un numero:\t");
    scanf("%i",&h);
    printf("Inserisci un altro numero:\t");
    scanf("%i",&k);
    printf("Inserisci la lunghezza della tua sequenza:\t");
    scanf("%i",&n);
    
    if (h < k)
    {
        for (int i = 0;i < n;i++)
        {
            printf("Inserisci un numero:\t");
            scanf("%i",&nums);
            if (nums > h && nums < k)
            {
                cont ++;
            }
        }
        printf("I numeri compresi tra %i e %i sono: %i",h,k,cont);
    }
    else if (k < h)
    {
        for (int i = 0;i < n;i++)
        {
            printf("Inserisci un numero:\t");
            scanf("%i",&nums);
            if (nums > k && nums < h)
            {
                cont ++;
            }
        }
        printf("I numeri compresi tra %i e %i sono: %i",k,h,cont);
    }
    return 0;
}
