#include <stdio.h>
#include <stdlib.h>
int main()
{   // Inizio dichiarazioni varaibili:

    // Inizalizzazione dei due indici della matrice:
    short numeroalunni;
    short numeromaterie;
    // Inizalizzazione della variabile scelta per poter selezionare l'alunno che si vuole + inizalizzazione della variabile somma per la media:
    short scelta;
    short somma = 0;
    // Inizalizzazione variabile mediaclasse totale:
    float mediatot;
    // Inizalizzazione variabile per poter scegliere di vedere il resoconto annuale di un'altro alunno + variabile che definirà il nome della classe:
    char ite;
    char nameclass[5];
    // Inizalizzazione varaibili che comporanno l'anno scolastico corrente:
    short anno_corrente;
    short anno_corrente_1;
    printf("Inserisci l'anno scolastico es(2022 2023): ");
    scanf("%hi%hi",&anno_corrente,&anno_corrente_1);
    printf("Inserisci la tua classe accompagnata dalla sezione es:[2C_inf]:   ");
    scanf("%s",nameclass);
    printf("Numero Materie:   ");
    scanf("%hi",&numeromaterie);
    printf("Numero Alunni:   ");
    scanf("%hi",&numeroalunni);
    // Inizalizzazione della matrice classe + tutti i vettori che andranno a definrie i dati degli alunni:
    short classe[numeroalunni][numeromaterie];
    short giorni[numeroalunni];
    short mesi[numeroalunni];
    short anni[numeroalunni];
    short condotte[numeroalunni];
    short numero_insufficenze[numeroalunni];
    short numero_assenze[numeroalunni];
    float medie[numeroalunni];
    char **materie = (char**) malloc(sizeof(char *) *numeromaterie);
    char **alunni =  (char**) malloc(sizeof(char *) *numeroalunni);
    
    // Fine dichiarazioni variabili.
    
    // In questo for si prelevano i nomi delle materie
    for (int i = 0;i < numeromaterie;i++)
    {
        printf("Materia:   ");
        scanf("%ms",&materie[i]);
    }
    // In questo for si prelevano in input i nomi degli alunni chiedendo anche la loro data di nascita, la loro condotta e il loro numero di assenze.
    for (int i = 0;i < numeroalunni;i++)
    {
        printf("Alunno es (Cognome_Nome):   ");
        scanf("%ms",&alunni[i]);
        printf("Inserisci la condotta dell'alunno %s:  ",alunni[i]);
        scanf("%hi",&condotte[i]);
        printf("Inserisci i giorni di assenza dell' alunno %s:    ",alunni[i]);
        scanf("%hi",&numero_assenze[i]);
        printf("Inserisci il giorno di nascita dell'alunno %s: ",alunni[i]);
        scanf("%hi",&giorni[i]);
        printf("Inserisci il mese di nascita dell'alunno %s: ",alunni[i]);
        scanf("%hi",&mesi[i]);
        printf("Inserisci l'anno di nascita dell'alunno %s:  ",alunni[i]);
        scanf("%hi",&anni[i]);
        if (mesi[i] > 12)
        {
            printf("Reinserisci il mese corretto dell'alunno %s",alunni[i]);
            scanf("%hi",&mesi[i]);
        }
        switch (mesi[i])
        {
            case 1:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 2:
                if (giorni[i] > 28)
                {
                    while (giorni[i] >= 28)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 3:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 4:
                if (giorni[i] > 30)
                {
                    while (giorni[i] >= 30)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 5:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 6:
                if (giorni[i] > 30)
                {
                    while (giorni[i] >= 30)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 7:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 8:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 9:
                if (giorni[i] > 30)
                {
                    while (giorni[i] >= 30)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 10:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 11:
                if (giorni[i] > 30)
                {
                    while (giorni[i] >= 30)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 12:
                if (giorni[i] > 31)
                {
                    while (giorni[i] >= 31)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            default:
                break;
        }
        numero_insufficenze[i] = 0;
    }
    
    /*  
        In questo for si prendono i voti di ogni alunno e ognivolta vengono segnatoi quelli insufficenti sommando sempre i voti per poi fare le medie di ognuno, 
        a sua volta sommando anche le medie di ogni alunno per poi fare la media totale.
    */
    
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
    
    // Qui viene stampata la media della classe.
    printf("Media classe: %.2f\n",mediatot / numeroalunni); 
    
    // Con questo ciclo invece si da inzio al presentare tutti i dati dell'alunno che si vuole con al sua media + condotta e i suoi voti verificando se è promosso o bocciato.
    do
    {
        for (int i = 0;i < numeroalunni;i++)
        {
            printf("%i - %s\n",i,alunni[i]);
        }
        printf("Scegli il resoconto annuale dell'alunno che si preferisce:  ");
        scanf("%hi",&scelta);
        printf("Nome alunno: %s\nClasse: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico corrente: %hi-%hi\nGiorni assenze: %i\nMedia: %.2f\nCondotta alunno: %hi\n",alunni[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],anno_corrente - anni[scelta],anno_corrente,anno_corrente_1,numero_assenze[scelta],medie[scelta],condotte[scelta]);
        if (medie[scelta] < 6 && numero_insufficenze[scelta] > 3 || condotte[scelta] < 6)
        {
            printf("L'alunno %s è risultato non ammesso alla classe successiva avendo %hi debiti, con condotta %hi\n",alunni[scelta],numero_insufficenze[scelta],condotte[scelta]);
        }
        else
        {
            printf("L'alunno %s è risultato ammesso alla classe successiva avendo %hi debiti, con condotta %hi\n",alunni[scelta],numero_insufficenze[scelta],condotte[scelta]);
        }
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Voto di %s di %s: %hi\n",alunni[scelta],materie[i],classe[scelta][i]);
        }
        printf("Vuoi continuare[s/n]:    ");
        scanf(" %c",&ite);
    }
    
    while (ite == 's');
    return 0;
}
