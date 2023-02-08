#include <stdio.h>
#include <stdlib.h>
int main()
{
    // dichiarazioni indici matrici dove gli alunni sono le righe e le materie sono le colonne
    short numeroalunni;
    short numeromaterie;
    printf("Numero Materie:   ");
    scanf("%hi",&numeromaterie);
    printf("Numero Alunni:   ");
    scanf("%hi",&numeroalunni);
    // dichiarazione matrice classe con righe alunni e colonne materie
    short classe[numeroalunni][numeromaterie];
    // dichiarazione vettore numero insufficenze con indice numero di insufficenze
    short numero_insufficenze[numeroalunni];
    // dichiarazione variabile scelta alunno
    short scelta;
    // dichiarazione variabile somma per le medie
    short somma = 0;
    // dichiarazione variabile media totale classe
    float mediatot;
    // dichiarazione vettore medie alunni con indice equivalente al numero degli alunni
    float medie[numeroalunni];
    // dichiarazione due vettori di stringhe con indice indefinito tramite funzione malloc
    char **materie = (char**) malloc(sizeof(char *) *numeromaterie);
    char **alunni =  (char**) malloc(sizeof(char *) *numeroalunni);
    // dichiarazione due variabili char: una per la scelta di continuare o meno la visione dei voti e l'altra per prendere in input la classe e la sezione
    char ite;
    char nameclass[5];
    printf("Inserisci la tua classe accompagnata dalla sezione es:[2C_inf]:   ");
    scanf("%s",nameclass);
    for (int i = 0;i < numeromaterie;i++)
    {
        printf("Materia:   ");
        scanf("%ms",&materie[i]);
    }
    for (int i = 0;i < numeroalunni;i++)
    {
        printf("Alunno:   ");
        scanf("%ms",&alunni[i]);
        numero_insufficenze[i] = 0;
    }
    for (int i = 0;i < numeroalunni;i++)
    {
        somma = 0;
        for (int j = 0;j < numeromaterie;j++)
            {
                printf("Alunno: %s, voto in %s:    ",alunni[i],materie[j]);
                scanf("%hi",&classe[i][j]);
                if (classe[i][j] < 6)
                {
                    numero_insufficenze[i] ++;
                }
                somma += classe[i][j];
                medie[i] = (float) somma / numeromaterie;
                
            }
        mediatot += medie[i];
    }
    do
    {
        for (int i = 0;i < numeroalunni;i++)
        {
            printf("Clicca %i per accedere al resoconto annuale di %s\n",i,alunni[i]);
        }
        scanf("%hi",&scelta);
        printf("Media %s della classe %s: %.2f\nMedia classe: %.2f\n",alunni[scelta],nameclass,medie[scelta],(float) mediatot / numeroalunni);
        if (medie[scelta] < 6 && numero_insufficenze[scelta] >= 3)
        {
            printf("L'alunno %s è risultato non ammesso alla classe successiva avendo %hi debiti\n",alunni[scelta],numero_insufficenze[scelta]);
        }
        else if (medie[scelta] >= 6 && numero_insufficenze[scelta] < 3)
        {
            printf("L'alunno %s è risultato ammesso alla classe successiva avendo %hi debiti\n",alunni[scelta],numero_insufficenze[scelta]);
        }
        for (int i = 0;i< numeromaterie;i++)
        {
            printf("Voto di %s di %s: %hi\n",alunni[scelta],materie[i],classe[scelta][i]);
        }
        printf("Vuoi continuare[s/n]:    ");
        scanf(" %c",&ite);
    }
    while (ite == 's');
    return 0;
}
