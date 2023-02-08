#include <stdio.h>

int main()
{
    // data l'altezza iniziale di un onda calcoli quanti km ci vogliono per far si che essa scompaia,
    float h;
    int k = 0;
    printf("Altezza onda:\t");
    scanf("%f",&h);
    while (h <= 0)
    {
        printf("Reinserisci l'altezza iniziale dell'onda anomala:\t");
        scanf("%f",&h);
    }
    while (h >= 1)
    {
        h/=2;
        k ++;
    }
    printf("L'onda ha raggiunto altezza 0 dopo aver percorso: %iKm",k);
    return 0;
}
