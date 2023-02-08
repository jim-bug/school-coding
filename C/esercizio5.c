#include <stdio.h> 
int main ()
{
    // data una sequenza di n numeri trovare la mediana di essa senza usare array:

    int numbers; // questa variabile conterà a iterazione la sequenza sovrascrivendo ogni volta il numero corrente
    int medial_numbers = 0; // questa variabile rappresenterà la mediana
    int medial; // questa variabile servirà a definire la posizione della mediana
    int n; // lunghezza lista
    printf("Inserisci la lughezza della sequenza:\t");
    scanf("%i",&n);

    medial = (int) n/2; // definisco la posizione della mediana, dividendo la lunghezza per 2 in modo intero

    for (int i = 0;i < n;i++)
    {
        printf("Inserisci il numero:\t");
        scanf("%i",&numbers);
        
        if (n % 2 == 0) // verifico se la lunghezza è pari
        {
            if (i == (medial-1)) // qui vado a verificare quando il contatore arriva a un numero in meno della medial
            {
                medial_numbers+=numbers; // e nel frattemo lo aggiungo alla variabile medial_numbers,
            }
            if (i == medial) // qui vado a verificare se il contatore arriva a medial
            {
                    medial_numbers+=numbers; // come detto in precedenza io avevo assegnato alla variabile medial_numbers il valore prima di questa iterazione, adesso sommo questo valore al valore precedente
            }
        }
        else // verifico se la lunghezza è dispari
        {
            if (i == medial) // quindi se il contatore è uguale a medial significa che io sono arrivato al centro della sequenza e quindi assegno alla variabile medial_numbers il valore corrente
            {
                medial_numbers = numbers;
            }
        }
    }
    if (n % 2 == 0){printf("La mediana è %.2f", medial_numbers/2);}
    else{printf("La mediana della sequenza è %i",medial_numbers);}

    return 0;
}