#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void bubble_sort_original(char**,short);
void bubble_sort_update(char **,short[],short[],short[],short[],short);
void dati_alunno(char**,short,short[]);
void insert_date_and_control_date(char**,short[],short[],short[],short,int);
int main()
{   // Inizio dichiarazioni varaibili:

    // dichiarazione due indici matrice + la quantità dei nuovi alunni + il controllo per l'accesso con le stringhe:
    short numeroalunni;
    short numeromaterie;
    short quantita_alunni;
    int index = -1;
    char name_access[100];
    int control;
    // dichiarazione variabile scelta che ci consentirà di scegliere l alunno che vogliamo + la variabile somma che servira per ogni media(sfruttando il fatto che azzerandola(ogni qualvolta inizia il for che itera le righe) la possiamo utilizzare in tutti i casi + il peso che diamo alle note + le due scelte di primo secondo o tutti e due quadrimestri per nuovi e vecchi alunni:
    short scelta;
    short somma = 0;
    short peso = 2;
    short scelta_quad;
    short scelta_quad_1;
    // Inizalizzazione variabile mediaclasse totale:
    float mediatot;
    // Inizalizzazione variabile per poter scegliere di vedere il resoconto annuale di un'altro alunno, quindi se continuarea stampare resoconti o finire tramite il si e no + variabile che definirà il nome della classe:
    char ite[2];
    char nameclass[5];
    // Inizalizzazione varaibili che comporanno l'anno scolastico corrente + la variabile che sommerà la quantità dei vecchi e nuovi alunni(ci servirà per stampare il registro_completo):
    short iterazione_totale;
    // prima di dichiarare i vettori/matrici è ovvio che prima dobbiamo definire i loro indici quindi compilarli quindi qua vanno inseriti il numeor di materie vecchi
    
    printf("Inserisci la tua classe accompagnata dalla sezione es:[XX:xxx]:   ");
    scanf("%s",nameclass);
    printf("Numero Materie:   ");
    scanf("%hi",&numeromaterie);
    printf("Numero Alunni:   ");
    scanf("%hi",&numeroalunni);
    if (numeroalunni == 1)
    {
        while (numeroalunni == 1)
        {
            printf("Numero Alunni:   ");
            scanf("%hi",&numeroalunni);    
        }
    }
    
    // qui dichiariamo la varabile che ci consentirà di sdoppiare la riga della matrice classe così da mettere fino a numeromaterie i voti del primo quadrimestre ma da numeromaterie+contatore quelli del secondo
    short total_number_of_subjects;
    total_number_of_subjects = numeromaterie * 2;
    // Inizalizzazione della matrice classe + tutti i puntatori che andranno a definrie i dati degli alunni:
    short classe[numeroalunni][total_number_of_subjects];
    short assenze[numeroalunni][total_number_of_subjects];
    short *note = malloc (sizeof(short) *numeroalunni);
    short *giorni = malloc(sizeof(short)* numeroalunni);
    short *mesi = malloc(sizeof(short)* numeroalunni);
    short *anni = malloc(sizeof(short)* numeroalunni);
    short *condotte = malloc(sizeof(short)* numeroalunni);
    short *numero_insufficenze = malloc(sizeof(short)* numeroalunni);
    short *numero_insufficenze_secondo_quad = malloc(sizeof(short)* numeroalunni);
    float *medie = malloc(sizeof(float) *numeroalunni);
    float *medie_secondo_quad = malloc(sizeof(float) *numeroalunni);
    char **materie = (char**) malloc(sizeof(char *) *numeromaterie);
    char **registro_completo =  (char**) malloc(sizeof(char *) *numeroalunni);
    char **vector_work = (char**) malloc(sizeof(char *) *numeroalunni);
    // Fine dichiarazioni variabili.
   
    // In questo for si prelevano i nomi delle materie
    for (int i = 0;i < numeromaterie;i++)
    {
        printf("Materia:   ");
        scanf("%ms",&materie[i]);
    }
    // riordina in ordine alfabetico il nome delle materie
    bubble_sort_original(materie,numeromaterie);
    // In questo for si prelevano in input i nomi degli alunni chiedendo anche la loro data di nascita, e fancendo un controllo su di esse e sfruttando il for che itera per quanto sono gli alunni vado ad azzerare il vettore numero_insufficenze e numero_insufficenze del secondo quadrimestre.
    for (int i = 0;i < numeroalunni;i++)
    {
        printf("Alunno es (Cognome_Nome):   ");
        scanf("%ms",&registro_completo[i]);
        printf("Inserisci il giorno di nascita dell'alunno %s es(xx): ",registro_completo[i]);
        scanf("%hi",&giorni[i]);
        printf("Inserisci il mese di nascita dell'alunno %s es(x): ",registro_completo[i]);
        scanf("%hi",&mesi[i]);
        printf("Inserisci l'anno di nascita dell'alunno %s es(xxxx):  ",registro_completo[i]);
        scanf("%hi",&anni[i]);
        while (mesi[i] > 12)
        {
            printf("\tMESE ERRATO\nInserisci il mese corretto dell'alunno %s: ",registro_completo[i]);
            scanf("%hi",&mesi[i]);
        }
        while (anni[i] > 0 && anni[i] < 1990)
        {
            printf("\tANNO ERRATO\nInserisci l anno correto dell alunno %s: ",registro_completo[i]);
            scanf("%hi",&anni[i]);
        }
        // questa funzione consente il controllo della data di nascita se si ha qualche errore di data verrà subito segnalato, passando anche come parametro l'indice i cioè il contatore così la funzione sa da quale alunno partire + l'azzeramento dei due vettori numero di insufficenze
        insert_date_and_control_date(registro_completo,giorni,mesi,anni,numeroalunni,i);
        numero_insufficenze[i] = 0;
        numero_insufficenze_secondo_quad[i] = 0;
    }
    dati_alunno(registro_completo,numeroalunni,condotte);
    for (int i = 0;i < numeroalunni;i++)
    {
        vector_work[i] = registro_completo[i];
    }
    bubble_sort_update(registro_completo,giorni,mesi,anni,condotte,numeroalunni);
    
    // possibilità di scegliere uno dei due quadrimestri o tutti e due così da poterli compilare 
    printf("Vuoi inserire i voti del:   \n");
    printf("- [0] Primo quadrimestre\n - [1] Secondo quadrimestre\n - [2] Scrutinio finale\n");
    scanf("%hi",&scelta_quad);
    
    if (scelta_quad == 0)
    {
        printf("\tPRIMO QUADRIMESTRE\n");
        for (int i = 0;i < numeroalunni;i++)
        {
            somma = 0;
            for (int j = 0;j < numeromaterie;j++)
            {
                    printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[i],materie[j]);
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
        
        printf("\tNUMERO ASSENZE PER MATERIA PRIMO QUADRIMESTRE\n");
        for (int i = 0;i < numeroalunni;i++)
        {
            for (int j = 0;j < numeromaterie;j++)
            {
                printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[i],materie[j]);
                scanf("%hi",&assenze[i][j]);
            }
        }
    }
    
    else if (scelta_quad == 1)
    {
        printf("\tSECONDO QUADRIMESTRE\n");
        for (int i = 0;i < numeroalunni;i++)
        {
            somma = 0;
            for (int j = 0;j < numeromaterie;j++)
            {
                    printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[i],materie[j]);
                    scanf("%hi",&classe[i][numeromaterie+j]);
                    if (classe[i][numeromaterie+j] < 6)
                    {
                        numero_insufficenze_secondo_quad[i] ++;
                    }
                    somma += classe[i][numeromaterie+j];
                    medie_secondo_quad[i] = (float) somma / numeromaterie;
            }
            mediatot += medie_secondo_quad[i];
        }
       
        printf("\tNUMERO ASSENZE PER MATERIA SECONDO QUADRIMESTRE\n");
        for (int i = 0;i < numeroalunni;i++)
        {
            for (int j = 0;j < numeromaterie;j++)
            {
                printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[i],materie[j]);
                scanf("%hi",&assenze[i][numeromaterie+j]);
            }
        }
    }
    else if (scelta_quad == 2)
        {
            printf("\tPRIMO QUADRIMESTRE\n");
            for (int i = 0;i < numeroalunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                        printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[i],materie[j]);
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
            
            printf("\tSECONDO QUADRIMESTRE\n");
            for (int i = 0;i < numeroalunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                        printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[i],materie[j]);
                        scanf("%hi",&classe[i][numeromaterie+j]);
                        if (classe[i][numeromaterie+j] < 6)
                        {
                            numero_insufficenze_secondo_quad[i] ++;
                        }
                        somma += classe[i][numeromaterie+j];
                        medie_secondo_quad[i] = (float) somma / numeromaterie;
                }
                mediatot += medie_secondo_quad[i];
            }
            
            printf("\tNUMERO ASSENZE PER MATERIA PRIMO QUADRIMESTRE\n");
            for (int i = 0;i < numeroalunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[i],materie[j]);
                    scanf("%hi",&assenze[i][j]);
                }
            }
            
            printf("\tNUMERO ASSENZE PER MATERIA SECONDO QUADRIMESTRE\n");
            for (int i = 0;i < numeroalunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[i],materie[j]);
                    scanf("%hi",&assenze[i][numeromaterie+j]);
                }
            }
    }
    
    // inserimento delle note
    printf("\tINSERIMENTO QUANTITA NOTE\n");
    for (int i = 0;i < numeroalunni;i++)
    {
        printf("Quante note ha avuto l'alunno %s: ",registro_completo[i]);
        scanf("%hi",&note[i]);
    }

    // media ponderata per modificare la condotta dell'alunno a seconda delle note che ha
    for (int i = 0;i < numeroalunni;i++)
    {
        condotte[i] = ((condotte[i]*10) + (note[i]*(peso*note[i]))) / (10+(peso*note[i]));
    }
    
    // in queste 3 righe si decide se ci sono dei nuovi alunni e di seguito si inserisce la quantita N.B. se non ci sono nuovi alunni metti 0, e poi si aggiorna l'indice numero_alunni per quanti nuovi alunni si sono aggiunti
   
    printf("Quanti nuovi alunni si vuole aggiungere:\t\t");
    scanf("%hi",&quantita_alunni);
    iterazione_totale = numeroalunni + quantita_alunni;
   
    // dichiarazione variabili nuovi alunno:
   
    short new_classrom[quantita_alunni][total_number_of_subjects];
    short new_hours[quantita_alunni][total_number_of_subjects];
    short classe_voti_completa[iterazione_totale][total_number_of_subjects];
    short assenze_complete[iterazione_totale][total_number_of_subjects];
    short giorni_inserimento[quantita_alunni];
    short mesi_inserimento[quantita_alunni];
    short anni_inserimento[quantita_alunni];
    // fine dichiarazioni variabili nuovi alunno
   
    // in questa parte di codice verranno effettuati due cicli per spostare gli elementi dal vettore alunni vecchio e dal vettore alunni nuovo in un vettore denominato registro_classe + le altre matrici: classe voti tot e assenze per ore.

    // scambio dati matrice vecchi alunni
    for (int i = 0;i < numeroalunni;i++)
    {
        for (int j = 0;j < total_number_of_subjects;j++)
        {
            classe_voti_completa[i][j] = classe[i][j];
        }
    }
    
    for (int i = 0;i < numeroalunni;i++)
    {
        for(int j = 0;j < total_number_of_subjects;j++)
        {
            assenze_complete[i][j] = assenze[i][j];
        }
    }
    // il secondo ciclo lo troviamo dentro un if che controlla se ci sono nuovi alunni se c'è ne sono allora inerisce congnome_nome e lo va a copiare in un altro vettore
    if (quantita_alunni > 0)
    {
        // riallocazione dei puntatori
        
        vector_work = realloc(vector_work,sizeof(char*) *quantita_alunni);
        registro_completo = realloc(registro_completo,sizeof(char*) *quantita_alunni);
        note = realloc(note,sizeof(short) *quantita_alunni);
        giorni = realloc(giorni, sizeof(short) *quantita_alunni);
        mesi = realloc(mesi, sizeof(short) *quantita_alunni);
        anni = realloc(anni, sizeof(short) *quantita_alunni);
        condotte = realloc(condotte, sizeof(short) *quantita_alunni);
        numero_insufficenze = realloc(numero_insufficenze, sizeof(short) *quantita_alunni);
        numero_insufficenze_secondo_quad = realloc(numero_insufficenze_secondo_quad, sizeof(short) *quantita_alunni);
        medie = realloc(medie, sizeof(float) *quantita_alunni);
        medie_secondo_quad = realloc(medie_secondo_quad, sizeof(float) *quantita_alunni);
       
        // fine riallocazione puntatori
       
        for (int i = 0;i < quantita_alunni;i++)
        {
            printf("Alunno es (Cognome_Nome):   ");
            scanf("%ms",&registro_completo[numeroalunni+i]);
            printf("Inserisci il giorno di nascita dell'alunno %s es(xx): ",registro_completo[numeroalunni+i]);
            scanf("%hi",&giorni[numeroalunni+i]);
            printf("Inserisci il mese di nascita dell'alunno %s es(x): ",registro_completo[numeroalunni+i]);
            scanf("%hi",&mesi[numeroalunni+i]);
            printf("Inserisci l'anno di nascita dell'alunno %s es(xxxx):  ",registro_completo[numeroalunni+i]);
            scanf("%hi",&anni[numeroalunni+i]);
            
            printf("Inserisci il giorno di inserimento nella classe dell'alunno %s es(xx): ",registro_completo[numeroalunni+i]);
            scanf("%hi",&giorni_inserimento[numeroalunni+i]);
            printf("Inserisci il mese di inserimento nella classe dell'alunno %s es(x): ",registro_completo[numeroalunni+i]);
            scanf("%hi",&mesi_inserimento[numeroalunni+i]);
            printf("Inserisci l'anno di inserimento nella classe dell'alunno %s es(xxxx):  ",registro_completo[numeroalunni+i]);
            scanf("%hi",&anni_inserimento[numeroalunni+i]);
            
            while (mesi[numeroalunni+i] > 12)
            {
                printf("Inserisci il mese corretto dell'alunno %s: ",registro_completo[numeroalunni+i]);
                scanf("%hi",&mesi[numeroalunni+i]);
            }
            while (anni[numeroalunni+i] > 0 && anni[numeroalunni+i] < 1990)
            {
                printf("Inserisci l anno correto dell alunno %s: ",registro_completo[numeroalunni+i]);
                scanf("%hi",&anni[numeroalunni+i]);
            }
            insert_date_and_control_date(registro_completo,giorni,mesi,anni,quantita_alunni,i);
            
            while (mesi_inserimento[numeroalunni+i] > 12)
            {
                printf("Inserisci il mese corretto dell inserimento dell'alunno %s: ",registro_completo[numeroalunni+i]);
                scanf("%hi",&mesi_inserimento[numeroalunni+i]);
            }
            while (anni_inserimento[numeroalunni+i] > 0 && anni_inserimento[numeroalunni+i] < 2024)
            {
                printf("Inserisci l anno correto dell inserimento dell alunno %s: ",registro_completo[numeroalunni+i]);
                scanf("%hi",&anni_inserimento[numeroalunni+i]);
            }
            insert_date_and_control_date(registro_completo,giorni_inserimento,mesi_inserimento,anni_inserimento,quantita_alunni,i);
            
        }
        for (int i = 0;i < quantita_alunni;i++)
        {
            printf("Condotta dell alunno %s:\t\t",registro_completo[numeroalunni+i]);
            scanf("%hi",&condotte[numeroalunni+i]);
        }
        
        // allocazione dei nuovi alunni nel vettore lavoro che ci aiuterà più avanti nell'accesso all'alunno con le stringhe
        for (int i = 0;i < quantita_alunni;i++)
        {
            vector_work[numeroalunni+i] = registro_completo[numeroalunni+i];
        }
        
        // possibilità di scegliere uno dei due quadrimestri o tutti e due così da poterli compilare
        printf("Vuoi inserire i voti del:   \n");
        printf("- [0] Primo quadrimestre\n - [1] Secondo quadrimestre\n - [2] Scrutinio finale\n");
        scanf("%hi",&scelta_quad_1);
        
        if (scelta_quad_1 == 0)
        {
            printf("\tPRIMO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_classrom[i][j]);
                    if (new_classrom[i][j] < 6)
                    {
                        numero_insufficenze[numeroalunni+i] ++;
                    }
                    somma += new_classrom[i][j];
                    medie[numeroalunni+i] = (float) somma / numeromaterie;
                }
                    mediatot += medie[numeroalunni+i];
            }
                
            printf("\tNUMERO ASSENZE PER MATERIA PRIMO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_hours[i][j]);
                }
            }
        }
        
        if (scelta_quad_1 == 1)
        {
            printf("\tSECONDO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                        printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[numeroalunni+i],materie[j]);
                        scanf("%hi",&new_classrom[i][numeromaterie+j]);
                        if (new_classrom[i][numeromaterie+j] < 6)
                        {
                            numero_insufficenze_secondo_quad[numeroalunni+i] ++;
                        }
                        somma += new_classrom[i][numeromaterie+j];
                        medie_secondo_quad[numeroalunni+i] = (float) somma / numeromaterie;
                }
                mediatot += medie_secondo_quad[numeroalunni+i];
            }
            printf("\tNUMERO ASSENZE PER MATERIA SECONDO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_hours[i][numeromaterie+j]);
                }
            }
    }
    
    if (scelta_quad_1 == 2)
    {
            printf("\tPRIMO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_classrom[i][j]);
                    if (new_classrom[i][j] < 6)
                    {
                        numero_insufficenze[numeroalunni+i] ++;
                    }
                    somma += new_classrom[i][j];
                    medie[numeroalunni+i] = (float) somma / numeromaterie;
                }
                    mediatot += medie[numeroalunni+i];
            }
                
            printf("\tNUMERO ASSENZE PER MATERIA PRIMO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_hours[i][j]);
                }
            }
            printf("\tSECONDO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                somma = 0;
                for (int j = 0;j < numeromaterie;j++)
                {
                        printf("Alunno: %s,\t\tvoto in %s:    ",registro_completo[numeroalunni+i],materie[j]);
                        scanf("%hi",&new_classrom[i][numeromaterie+j]);
                        if (new_classrom[i][numeromaterie+j] < 6)
                        {
                            numero_insufficenze_secondo_quad[numeroalunni+i] ++;
                        }
                        somma += new_classrom[i][numeromaterie+j];
                        medie_secondo_quad[numeroalunni+i] = (float) somma / numeromaterie;
                }
                mediatot += medie_secondo_quad[numeroalunni+i];
            }
            printf("\tNUMERO ASSENZE PER MATERIA SECONDO QUADRIMESTRE\n");
            for (int i = 0;i < quantita_alunni;i++)
            {
                for (int j = 0;j < numeromaterie;j++)
                {
                    printf("Inserisci il numero totale di assenze di %s della materia %s: ",registro_completo[numeroalunni+i],materie[j]);
                    scanf("%hi",&new_hours[i][numeromaterie+j]);
                }
            }
    }
    
    // inserimento note nuovi alunni
    printf("\tINSERIMENTO QUANTITA NOTE\n");
    for (int i = 0;i < quantita_alunni;i++)
    {
        printf("Quante note ha avuto l'alunno %s: ",registro_completo[numeroalunni+i]);
        scanf("%hi",&note[numeroalunni+i]);
    }
    
    // media ponderata per far variare la condotta in base alla note prese
    for (int i = 0;i < quantita_alunni;i++)
    {
        condotte[numeroalunni+i] = ((condotte[numeroalunni+i]*10) + (note[numeroalunni+i]*(peso*note[numeroalunni+i]))) / (10+(peso*note[numeroalunni+i]));
    }
    
    // start exchange_date_of_matrix new pupils:
    
    for (int i = 0;i < quantita_alunni;i++)
    {
        for (int j = 0;j < total_number_of_subjects;j++)
        {
            classe_voti_completa[numeroalunni+i][j] = new_classrom[i][j];
        }
    }
    for (int i = 0;i < numeroalunni;i++)
    {
        for(int j = 0;j < total_number_of_subjects;j++)
        {
            assenze_complete[numeroalunni+i][j] = new_hours[i][j];
        }
    }
    
    // end exchange_date_of_matrix new pupils
}
    

    printf("\tREGISTRO DI CLASSE %s anno 2022/2023\n",nameclass);
    for (int i = 0;i < iterazione_totale;i++)
    {
        printf("\t%i - %s\n",i,vector_work[i]);
    }
    // adesso qui incominciamo a dare la possibilità di scegliere l alunno che si vuole
    printf("A quale alunno si vuole accedere inserire il nome:\t\t\t");
    scanf("%s",name_access);
    
    /*
        l accesso con le stringhe funzione in questo modo: 
        prima di tutto la variabile control viene inizializzata a 0,
        poi si incrementa index di 1,
        e viene confrontato il primo nome del vettore work con il nome dell alunno che si vuole vedere,
        se non sono uguali verifica se il controllo è uguale a 0,
        se è si continua se è no si ferma e stampa i dati della classe, 
        ma se la condizione dei nomi è vera verifica se l'alunno è vecchio o meno (questo perchè può accadere che per gli alunni vecchi si scegli di compilare il primo quadrimestre, 
        ma per gli alunni nuovi si può scegliere un quadrimestre diverso da quello scelto con quelli nuovi come ad esempio il secondo quadrimestre che è diverso dal primo scelto per gli alunni vecchi,
        allora tramite un if verfico se si tratta di un alunno nuovo o vecchio,
        vedendo se la scelta (quindi l'indice dell'alunno ricavato attraverso i vari controlli con le stringhe) è maggiore del numero di alunni vecchi (allora si tratta di un alunno nuovo) se è minore (allora si tratta di un vecchio alunno),
        quando il programma trova se l alunno è nuovo o vecchio fa avviare uno switch in entrambe condizioni (ovviamente lo switch avverrà nella condizione vera) che contralla quale tipo di quadrimestre ha scelto e,
        lo manda a schermo con tutti i dati dell'alunno sul quel quadrimestre),
        poi chiede se si vuole andare avanti (allora inersci il nome di un altro alunno oppure dello stesso),
        sennò si clicca x e se name_access è x allora control diventa 1 quindi diverso da 0 e il ciclo si ferma prima che la condizione finisce index passa di nuovo a -1 quindi come se si azzerasse e se control è diverso da 1 si ferma e,
        stampa i dati della classe_voti_completa. N.B ovviamente l'utente non vedrà a schermo la distinzione tra nuovo e vecchio alunno ma vedrà solo l'output che si aspetterà.
    */
    
    do
    { 
        index ++;
        control = 0;
        if (strcmp(vector_work[index],name_access) == 0) 
        {   
            scelta = index;
            //printf("%i\n",scelta); serve per capire a che numero corrisponde l'alunno scelto attraverso il controllo delle stringhe
            if (scelta < numeroalunni)
            {
                switch(scelta_quad)
                {
                    case 0:
                        printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nCondotta: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie[scelta]+condotte[scelta])/2,note[scelta],condotte[scelta]);
                        printf("\tVOTI PRIMO QUADRIMESTRE\n");
                        printf("Insufficenze nel primo quadrimestre dell alunno %s: %hi\nMedia %s primo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze[scelta],vector_work[scelta],medie[scelta]);
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][i]);
                        }
                        
                        printf("\tNUMERO ORE ASSENZE PRIMO QUADRIMESTRE\n");
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][i]);
                        }
                        break;
                    case 1:
                        printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nCondotta: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie_secondo_quad[scelta]+condotte[scelta])/2,note[scelta],condotte[scelta]);
                        printf("\tVOTI SECONDO QUADRIMESTRE\n");
                        printf("Insufficenze nel secondo quadrimestre dell alunno %s: %hi\nMedia %s secondo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze_secondo_quad[scelta],vector_work[scelta],medie_secondo_quad[scelta]);
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][numeromaterie+i]);
                        }
                        
                        printf("\tNUMERO ORE ASSENZE SECONDO QUADRIMESTRE\n");
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][numeromaterie+i]);
                        }
                        break;
                    case 2:
                        printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nCondotta: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie[scelta]+medie_secondo_quad[scelta]+condotte[scelta])/3,note[scelta],condotte[scelta]);
                        printf("\tVOTI PRIMO QUADRIMESTRE\n");
                        printf("Insufficenze nel primo quadrimestre dell alunno %s: %hi\nMedia %s primo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze[scelta],vector_work[scelta],medie[scelta]);
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][i]);
                        }
                        
                        printf("\tNUMERO ORE ASSENZE PRIMO QUADRIMESTRE\n");
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][i]);
                        }
                        
                        printf("\tVOTI SECONDO QUADRIMESTRE\n");
                        printf("Insufficenze nel secondo quadrimestre dell alunno %s: %hi\nMedia %s secondo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze_secondo_quad[scelta],vector_work[scelta],medie_secondo_quad[scelta]);
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][numeromaterie+i]);
                        }
                        
                        printf("\tNUMERO ORE ASSENZE SECONDO QUADRIMESTRE\n");
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][numeromaterie+i]);
                        }
                        
                        printf("\tVOTI TOTALI\n");
                        for(int i = 0;i < numeromaterie;i++)
                        {
                            printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],(classe_voti_completa[scelta][i]+classe_voti_completa[scelta][numeromaterie+i])/2);
                        }
                        printf("\tASSENZE TOTALI\n");
                        for (int i = 0;i < numeromaterie;i++)
                        {
                            printf("Numero ore assenze totali di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][numeromaterie]+assenze_complete[scelta][numeromaterie+i]);
                        }
                        if ((condotte[scelta] < 6) || (numero_insufficenze_secondo_quad[scelta] > 3) || (((medie[scelta]+medie_secondo_quad[scelta]) / 2) < 6))
                        {
                            printf("L'alunno %s non è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti totali\n",vector_work[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]+numero_insufficenze_secondo_quad[scelta]);
                        }
                        else if ((condotte[scelta] > 5) || (numero_insufficenze_secondo_quad[scelta] <= 3) || (((medie[scelta]+medie_secondo_quad[scelta]) / 2) > 5))
                        {
                            printf("L'alunno %s è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti totali\n",vector_work[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]+numero_insufficenze_secondo_quad[scelta]);
                        }
                }
            }
            else if (scelta > (numeroalunni-1))
                {
                    switch(scelta_quad_1)
                    {
                        case 0:
                            printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nAlunno inserito in data: %hi/%hi/%hi\nCondotte: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie[scelta]+condotte[scelta])/2,note[scelta],giorni_inserimento[scelta],mesi_inserimento[scelta],anni_inserimento[scelta],condotte[scelta]);
                            printf("\tVOTI PRIMO QUADRIMESTRE\n");
                            printf("Insufficenze nel primo quadrimestre dell alunno %s: %hi\nMedia %s primo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze[scelta],vector_work[scelta],medie[scelta]);
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][i]);
                            }
                            
                            printf("\tNUMERO ORE ASSENZE PRIMO QUADRIMESTRE\n");
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][i]);
                            }
                            break;
                        case 1:
                            printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nAlunno inserito in data: %hi/%hi/%hi\nCondotte: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie_secondo_quad[scelta]+condotte[scelta])/2,note[scelta],giorni_inserimento[scelta],mesi_inserimento[scelta],anni_inserimento[scelta],condotte[scelta]);
                            printf("\tVOTI SECONDO QUADRIMESTRE\n");
                            printf("Insufficenze nel secondo quadrimestre dell alunno %s: %hi\nMedia %s secondo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze_secondo_quad[scelta],vector_work[scelta],medie_secondo_quad[scelta]);
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][numeromaterie+i]);
                            }
                            
                            printf("\tNUMERO ORE ASSENZE SECONDO QUADRIMESTRE\n");
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][numeromaterie+i]);
                            }
                            break;
                        case 2:
                             printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: 2022/2023\nMedia: %.2f\nTotale note: %hi\nAlunno inserito in data: %hi/%hi/%hi\nCondotte: %hi\n",vector_work[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],2022-anni[scelta],(medie[scelta]+medie_secondo_quad[scelta]+condotte[scelta])/3,note[scelta],giorni_inserimento[scelta],mesi_inserimento[scelta],anni_inserimento[scelta],condotte[scelta]);
                            printf("\tVOTI PRIMO QUADRIMESTRE\n");
                            printf("Insufficenze nel primo quadrimestre dell alunno %s: %hi\nMedia %s primo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze[scelta],vector_work[scelta],medie[scelta]);
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][i]);
                            }
                            
                            printf("\tNUMERO ORE ASSENZE PRIMO QUADRIMESTRE\n");
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][i]);
                            }
                            
                            printf("\tVOTI SECONDO QUADRIMESTRE\n");
                            printf("Insufficenze nel secondo quadrimestre dell alunno %s: %hi\nMedia %s secondo quadrimestre: %.2f\n",vector_work[scelta],numero_insufficenze_secondo_quad[scelta],vector_work[scelta],medie_secondo_quad[scelta]);
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],classe_voti_completa[scelta][numeromaterie+i]);
                            }
                            
                            printf("\tNUMERO ORE ASSENZE SECONDO QUADRIMESTRE\n");
                            for (int i = 0;i < numeromaterie;i++)
                            {
                                printf("Numero ore assenze di %s in %s: %hi\n",vector_work[scelta],materie[i],assenze_complete[scelta][numeromaterie+i]);
                            }
                            
                            printf("\tVOTI TOTALI\n");
                            for(int i = 0;i < numeromaterie;i++)
                            {
                                printf("Alunno %s voto in %s: %hi\n",vector_work[scelta],materie[i],(classe_voti_completa[scelta][i]+classe_voti_completa[scelta][numeromaterie+i])/2);
                            }
                            if ((condotte[scelta] < 6) || (numero_insufficenze_secondo_quad[scelta] > 3) || (((medie[scelta]+medie_secondo_quad[scelta]+condotte[scelta]) / 3) < 6))
                            {
                                printf("L'alunno %s non è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti totali\n",vector_work[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]+numero_insufficenze_secondo_quad[scelta]);
                            }
                            else if ((condotte[scelta] > 5) || (numero_insufficenze_secondo_quad[scelta] <= 3) || (((medie[scelta]+medie_secondo_quad[scelta]+condotte[scelta]) / 3) > 5))
                            {
                                printf("L'alunno %s è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti totali\n",vector_work[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]+numero_insufficenze_secondo_quad[scelta]);
                            }
                    
                }
            }
            printf("A quale alunno si vuole accedere   inserire il nome (se non si vuole continuare digitare x):   ");
            scanf("%s",name_access);
            if (strcmp(name_access,"x") == 0)
            {
                control = 1;
            }
            index = -1;
        }
    }
    while(control == 0);
    // manda a schermo i dati di tutta la classe:
    printf("\tDATI DELLA CLASSE %s\n",nameclass);
    printf("Totale Alunni: %hi\nTotale Materie: %hi\nMedia totale della classe: %.2f\n",iterazione_totale,numeromaterie,mediatot  / iterazione_totale);
    bubble_sort_original(registro_completo,iterazione_totale);
    for (int i = 0;i < iterazione_totale;i++)
    {
        printf("Alunno -%i:\t\t\t%s\n",i,registro_completo[i]);
    }
    printf("\n");
    for (int i = 0;i < numeromaterie;i++)
    {
        printf("Materia -%i:\t\t\t%s\n",i,materie[i]);
    }
    return 0;
}
void bubble_sort_update(char **arr,short arr2[],short arr3[],short arr4[],short arr5[],short lunghezza) {
    int i, j;
    char *temp;
    short temp2;
    short temp3;
    short temp4;
    short temp5;
    short temp6;
    short temp7;
    short temp8;
    temp = malloc(sizeof(char)*lunghezza);
    for (i = 0; i < lunghezza - 1; i++){
        for (j = 0; j < lunghezza - i - 1; j++) {
         if(strcmp(arr[j],arr[j+1]) > 0)
         {
                strcpy(temp,arr[j]);
               strcpy(arr[j],arr[j+1]);
               strcpy(arr[j+1],temp);
               
               temp2 = arr2[j];
               arr2[j] = arr2[j+1];
               arr2[j+1] = temp2;
               
               temp3 = arr3[j];
               arr3[j] = arr3[j+1];
               arr3[j+1] = temp3;
               
               temp4 = arr4[j];
               arr4[j] = arr4[j+1];
               arr4[j+1] = temp4;
               
               temp5 = arr5[j];
               arr5[j] = arr5[j+1];
               arr5[j+1] = temp5;
              
               
         }
        }
    }
}

void bubble_sort_original(char **arr,short lunghezza) {
    int i, j;
    char *temp;
    temp = malloc(sizeof(char)*lunghezza);
    for (i = 0; i < lunghezza - 1; i++){
        for (j = 0; j < lunghezza - i - 1; j++) {
         if(strcmp(arr[j],arr[j+1]) > 0)
         {
                strcpy(temp,arr[j]);
               strcpy(arr[j],arr[j+1]);
               strcpy(arr[j+1],temp);
         }
        }
    }
}

void dati_alunno(char **alunni,short numeroalunni,short condotte[])
{
    for (int i = 0;i < numeroalunni;i++)
        {
            printf("Inserisci la condotta dell'alunno %s:  ",alunni[i]);
            scanf("%hi",&condotte[i]);
        }
}
void insert_date_and_control_date(char**alunni,short giorni[],short mesi[],short anni[],short numeroalunni,int i)
{
        switch (mesi[i])
        {
            case 1:  case 3: case 5: case 7: case 8: case 10: case 12:
                if (giorni[i] > 31)
                {
                    while (giorni[i] > 31)
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
                    while (giorni[i] > 28)
                    {
                        printf("Data non valida!\n");
                        printf("Inserisci il giorno valido di nascita dell'alunno %s: ",alunni[i]);
                        scanf("%hi",&giorni[i]);
                    }
                }
                break;
            case 4: case 6:  case 9:  case 11:
                if (giorni[i] > 30)
                {
                    while (giorni[i] > 30)
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
}