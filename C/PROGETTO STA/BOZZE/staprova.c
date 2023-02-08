#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//void bubble_sort_original(char**,short);
void bubble_sort_update(char **,short[],short[],short[],short[],short[],short[],short);
void dati_alunno(char**,short,short[]);
void insert_date_and_control_date(char**,short[],short[],short[],short,int);
void exchange_date(short*,short[],short,short);
void exchange_date_for_float(float*,float[],short,short);
int main()
{   // Inizio dichiarazioni varaibili:

    // Inizalizzazione dei due indici della matrice:
    char scelta_new_classrom[2];
    short numeroalunni;
    short numeromaterie;
    short quantita_alunni;
    char scelta_new_alunni[2];
    // Inizalizzazione della variabile scelta per poter selezionare l'alunno che si vuole + inizalizzazione della variabile somma per la media:
    short scelta;
    short somma = 0;
    const short ore_obbligatorie = 243;
    // Inizalizzazione variabile mediaclasse totale:
    float mediatot;
    // Inizalizzazione variabile per poter scegliere di vedere il resoconto annuale di un'altro alunno + variabile che definirà il nome della classe:
    char ite[2];
    char nameclass[5];
    // Inizalizzazione varaibili che comporanno l'anno scolastico corrente:
    short anno_corrente;
    short anno_corrente_1;
    short iterazione_totale;
    printf("Inserisci l'anno scolastico es(xxxx): ");
    scanf("%hi",&anno_corrente);
    printf("Inserisci l'anno scolastico es(xxxx): ");
    scanf("%hi",&anno_corrente_1);
    printf("Inserisci la tua classe accompagnata dalla sezione es:[XX:xxx]:   ");
    scanf("%s",nameclass);
    printf("Numero Materie:   ");
    scanf("%hi",&numeromaterie);
    printf("Numero Alunni:   ");
    scanf("%hi",&numeroalunni);
    short total_number_of_subjects;
    short total_number_of_pupils;
    total_number_of_subjects = numeromaterie * 2;
    total_number_of_pupils = numeroalunni * 2;
    // Inizalizzazione della matrice classe + tutti i puntatori che andranno a definrie i dati degli alunni:
    short classe[numeroalunni][total_number_of_subjects];
    short assenze[numeroalunni][total_number_of_subjects];
    short *giorni = malloc(sizeof(int)* numeroalunni);
    short *mesi = malloc(sizeof(int)* numeroalunni);
    short *anni = malloc(sizeof(int)* numeroalunni);
    short *condotte = malloc(sizeof(int)* numeroalunni);
    short *numero_insufficenze = malloc(sizeof(int)* numeroalunni);
    short *giorni_assenze = malloc(sizeof(int)* numeroalunni);
    float *medie = malloc(sizeof(float) *total_number_of_pupils);
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
        printf("Inserisci il giorno di nascita dell'alunno %s es(xx): ",alunni[i]);
        scanf("%hi",&giorni[i]);
        printf("Inserisci il mese di nascita dell'alunno %s es(x): ",alunni[i]);
        scanf("%hi",&mesi[i]);
        printf("Inserisci l'anno di nascita dell'alunno %s es(xxxx):  ",alunni[i]);
        scanf("%hi",&anni[i]);
        while (mesi[i] > 12)
        {
            printf("\tMESE ERRATO\nInserisci il mese corretto dell'alunno %s: ",alunni[i]);
            scanf("%hi",&mesi[i]);
        }
        while (anni[i] > 0 && anni[i] < 1990)
        {
            printf("\tANNO ERRATO\nInserisci l anno correto dell alunno %s: ",alunni[i]);
            scanf("%hi",&anni[i]);
        }
        // questa funzione consente il controllo della data di nascita se si ha qualche errore di data verrà subito segnalato
        insert_date_and_control_date(alunni,giorni,mesi,anni,numeroalunni,i);
        numero_insufficenze[i] = 0;
    }
    dati_alunno(alunni,numeroalunni,condotte);
    bubble_sort_update(alunni,giorni,mesi,anni,condotte,numero_insufficenze,giorni_assenze,numeroalunni);
    
    /*  
        In questo for si prendono i voti di ogni alunno e ognivolta vengono segnatoi quelli insufficenti sommando sempre i voti per poi fare le medie di ognuno, 
        a sua volta sommando anche le medie di ogni alunno per poi fare la media totale.
    */
    
    printf("\tPRIMO QUADRIMESTRE\n");
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
    
    printf("\tSECONDO QUADRIMESTRE\n");
    for (int i = 0;i < numeroalunni;i++)
    {
        somma = 0;
        for (int j = 0;j < numeromaterie;j++)
        {
                printf("Alunno: %s, voto in %s:    ",alunni[i],materie[j]);
                scanf("%hi",&classe[i][numeromaterie+j]);
                /*
                if (classe[i][numeromaterie+j] < 6)
                {
                    numero_insufficenze[numeroalunni+i] ++;
                }
                */
                //somma += classe[i][numeromaterie+j];
                //medie[numeroalunni+i] = (float) somma / numeromaterie;
        }
        //mediatot += medie[numeroalunni+i];
    }
    
    printf("\tNUMERO ASSENZE PER MATERIA\n\tPRIMO QUADRIMESTRE\n");
    for (int i = 0;i < numeroalunni;i++)
    {
        for (int j = 0;j < numeromaterie;j++)
        {
            printf("Inserisci il numero totale di assenze di %s della materia %s: ",alunni[i],materie[j]);
            scanf("%hi",&assenze[i][j]);
        }
    }
    
    printf("\tNUMERO ASSENZE PER MATERIA\n\tSECONDO QUADRIMESTRE\n");
    for (int i = 0;i < numeroalunni;i++)
    {
        for (int j = 0;j < numeromaterie;j++)
        {
            printf("Inserisci il numero totale di assenze di %s della materia %s: ",alunni[i],materie[j]);
            scanf("%hi",&assenze[i][numeromaterie+j]);
        }
    }
    /*
    for (int i = 0;i < numeroalunni;i++)
    {
        somma = 0;
        for (int j = 0; j < numeromaterie;j++)
        {
            somma = 
            classe[i][j] = somma / numeromaterie;
        }
    }
    */
    // in queste 3 righe si decide se ci sono dei nuovi alunni e di seguito si inserisce la quantita N.B. se non ci sono nuovi alunni metti 0, e poi si aggiorna l'indice numero_alunni per quanti nuovi alunni si sono agggiunti
    
    printf("Quanti nuovi alunni si vuole aggiungere:    ");
    scanf("%hi",&quantita_alunni);
    iterazione_totale = numeroalunni + quantita_alunni;
    
    // dichiarazione variabili nuovi alunno:
    
    short new_classrom[quantita_alunni][total_number_of_subjects];
    short new_hours[quantita_alunni][total_number_of_subjects];
    short classe_voti_completa[iterazione_totale][total_number_of_subjects];
    short assenze_complete[iterazione_totale][total_number_of_subjects];
    char **alunni_new = (char **) malloc(sizeof(char *)* quantita_alunni);
    char **registro_completo = malloc(sizeof(char*)* iterazione_totale);
    short giorni_new[quantita_alunni];
    short mesi_new[quantita_alunni];
    short anni_new[quantita_alunni];
    short condotte_new[quantita_alunni];
    short numero_insufficenze_new[quantita_alunni];
    short giorni_assenze_new[quantita_alunni];
    float medie_new[quantita_alunni];
    // fine dichiarazioni variabili nuovi alunno
    
    // dichiarazione varaibili temponaree per lo scambio dei dati in caso di "disordine" alfabetico
    char *temp;
    float temp2;
    short temp3;
    short temp4;
    short temp5;
    short temp6;
    short temp7;
    short temp8;
    short temp9;
    short temp10;
    temp = malloc(sizeof(char)*iterazione_totale);
    
    // fine dichiarazione varaibili temponaree per lo scambio dei dati in caso di "disordine" alfabetico
    
    // in questa parte di codice verranno effettuati due cicli per spostare gli elementi dal vettore alunni vecchio e dal vettore alunni nuovo in un vettore denominato registro_classe, considerato che devo ricavarmi quanti alunni vecchi si sono aggiunti esegui la seguente espressione: (numeroalunni-quantita_alunni)+i tutto sotto pedice di registro_classe, questo lo faccio perchè in precendenza ho aggiornato proprio l'indice numero alunni_vecchio

    for (int i = 0;i < numeroalunni;i++)
    {
        registro_completo[i] = alunni[i];
    }
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
    // il secondo ciclo lo troviamo dentro un if che controlla se ci sono nuovi alunni se c'è ne sono allora inerisce congnome_nome e lo fa a copiare in un altro vettore e poi si azzera il vettore-contatore numero_insufficenze_new
    if (quantita_alunni > 0)
    {
        // riallocazione dei puntatori
        
        giorni = realloc(giorni, sizeof(short) *quantita_alunni);
        mesi = realloc(mesi, sizeof(short) *quantita_alunni);
        anni = realloc(anni, sizeof(short) *quantita_alunni);
        condotte = realloc(condotte, sizeof(short) *quantita_alunni);
        numero_insufficenze = realloc(numero_insufficenze, sizeof(short) *quantita_alunni);
        giorni_assenze = realloc(giorni_assenze, sizeof(short) *quantita_alunni);
        medie = realloc(medie, sizeof(float) *quantita_alunni);
        
        // fine riallocazione puntatori
        
        for (int i = 0;i < quantita_alunni;i++)
        {
            printf("Alunno es (Cognome_Nome):   ");
            scanf("%ms",&alunni_new[i]);
            printf("Inserisci il giorno di nascita dell'alunno %s es(xx): ",alunni_new[i]);
            scanf("%hi",&giorni_new[i]);
            printf("Inserisci il mese di nascita dell'alunno %s es(x): ",alunni_new[i]);
            scanf("%hi",&mesi_new[i]);
            printf("Inserisci l'anno di nascita dell'alunno %s es(xxxx):  ",alunni_new[i]);
            scanf("%hi",&anni_new[i]);
            while (mesi_new[i] > 12)
            {
                printf("Inserisci il mese corretto dell'alunno %s: ",alunni_new[i]);
                scanf("%hi",&mesi_new[i]);
            }
            while (anni_new[i] > 0 && anni[i] < 1990)
            {
                printf("Inserisci l anno correto dell alunno %s: ",alunni_new[i]);
                scanf("%hi",&anni_new[i]);
            }
            // questa funzione consente il controllo della data di nascita se si ha qualche errore di data verrà subito segnalato
            insert_date_and_control_date(alunni_new,giorni_new,mesi_new,anni_new,quantita_alunni,i);
            numero_insufficenze_new[i] = 0;
        }
        
        // in questo punto si richiama una funzione che faccia inserire tutti i dati dell'alunno(data di nascita,condotta,numero_giorni_assenze)
        dati_alunno(alunni_new,quantita_alunni,condotte_new);
        // qui invece popoliamo la nuova matrice della parte della classe nuova dangolgli dei voti agli alunni nuovi
        printf("\tPRIMO QUADRIMESTRE\n");
        for (int i = 0;i < quantita_alunni;i++)
        {
            registro_completo[(numeroalunni+i)] = alunni_new[i];
            somma = 0;
            for (int j = 0;j < numeromaterie;j++)
            {
                    printf("Alunno: %s, voto in %s:    ",alunni_new[i],materie[j]);
                    scanf("%hi",&new_classrom[i][j]);
                    if (new_classrom[i][j] < 6)
                    {
                        numero_insufficenze_new[i] ++;
                    }
                    somma += new_classrom[i][j];
                    medie_new[i] = (float) somma / (numeromaterie/2);
            }
            mediatot += medie_new[i];
        }
        printf("\tSECONDO QUADRIMESTRE\n");
        for (int i = 0;i < quantita_alunni;i++)
        {
            somma = 0;
            for (int j = 0;j < numeromaterie;j++)
            {
                printf("Alunno: %s, voto in %s:    ",alunni_new[i],materie[j]);
                scanf("%hi",&new_classrom[i][numeromaterie+j]);
                /*
                if (new_classrom[i][numeromaterie+j] < 6)
                {
                    numero_insufficenze_new[quantita_alunni+i] ++;
                }
                */
                //somma += new_classrom[i][numeromaterie+j];
                //medie_new[quantita_alunni+i] = (float) somma / numeromaterie;
            }
            //mediatot += medie_new[quantita_alunni+i];
        }
        printf("\tNUMERO ASSENZE PER MATERIA PRIMO QUADRIMESTRE\n");
        for (int i = 0;i < quantita_alunni;i++)
        {
            for (int j = 0;j < numeromaterie;j++)
            {
                printf("Inserisci il numero totale di assenze di %s della materia %s: ",alunni_new[i],materie[j]);
                scanf("%hi",&new_hours[i][j]);
            }
        }
        printf("\tNUMERO ASSENZE PER MATERIA SECONDO QUADRIMESTRE\n");
        for (int i = 0;i < quantita_alunni;i++)
        {
            for (int j = 0;j < numeromaterie;j++)
            {
                printf("Inserisci il numero totale di assenze di %s della materia %s: ",alunni_new[i],materie[j]);
                scanf("%hi",&new_hours[quantita_alunni+i][j]);
            }
        }
        // qui non solo ordiniamo alfabeticamente il vettore nuovi alunni ma in caso si trovassero in "disordine" il programma scambia anche gli indici considerato che in precedenza abbiamo inderito i dati dei nuovi alunni_new
        exchange_date(giorni,giorni_new,numeroalunni,quantita_alunni);
        exchange_date(mesi,mesi_new,numeroalunni,quantita_alunni);
        exchange_date(anni,anni_new,numeroalunni,quantita_alunni);
        exchange_date(condotte,condotte_new,numeroalunni,quantita_alunni);
        exchange_date_for_float(medie,medie_new,numeroalunni,quantita_alunni);
        exchange_date(numero_insufficenze,numero_insufficenze_new,numeroalunni,quantita_alunni);
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
                assenze_complete[numeroalunni+i][j] = assenze[i][j];
            }
        }
        // end exchange_date_of_matrix;
        for (int i = 0; i < iterazione_totale - 1; i++)
        {
            for (int j = 0; j < iterazione_totale - i - 1; j++)
            {
                if(strcmp(registro_completo[j],registro_completo[j+1]) > 0)
                { 
                    
                    strcpy(temp,registro_completo[j]);
            	    strcpy(registro_completo[j],registro_completo[j+1]);
            	    strcpy(registro_completo[j+1],temp);
            	    
            	    temp2 = medie[j];
            	    medie[j] = medie[j+1];
            	    medie[j+1] = temp2;
            	    /*
            	    temp10 = medie[numeromaterie+j];
            	    medie[numeromaterie] = medie[(numeromaterie+j)+1];
            	    medie[(numeromaterie+j)+1] = temp10;
            	    */
            	    temp3 = condotte[j];
            	    condotte[j] = condotte[j+1];
            	    condotte[j+1] = temp3;
            	    
            	    temp4 = numero_insufficenze[j];
            	    numero_insufficenze[j] = numero_insufficenze[j+1];
            	    numero_insufficenze[j+1] = temp4;
            	    
            	    temp5 = giorni[j];
            	    giorni[j] = giorni[j+1];
            	    giorni[j+1] = temp5;
            	    
            	    temp6 = mesi[j];
            	    mesi[j] = mesi[j+1];
            	    mesi[j+1] = temp6;
            	    
            	    temp7 = anni[j];
            	    anni[j] = anni[j+1];
            	    anni[j+1] = temp7;
            	    
            	    for (int j = 0;j < total_number_of_subjects;j++)
            	    {
            	        temp8 = classe_voti_completa[i][j];
            	        classe_voti_completa[i][j] = classe_voti_completa[i+1][j];
            	        classe_voti_completa[i+1][j] = temp8;
            	    }
            	    for (int j = 0;j < total_number_of_subjects;j++)
            	    {
            	        temp9 = assenze_complete[i][j];
            	        assenze_complete[i][j] = assenze_complete[i+1][j];
            	        assenze_complete[i+1][j] = temp9;
            	    }
        	  }
        }
    }
    }
    /*
    for(int i = 0;i < iterazione_totale;i++)
    {
        for(int j = 0;j < numeromaterie;j++)
        {
            printf("Riga %i colonna %i: %hi\n",i,j,classe_voti_completa[i][j]);
        }
    }
    */
    // Qui viene stampata la media della classe:
    printf("Media classe: %.2f\n",mediatot  / iterazione_totale);
    
    // qui si manda a schermo il registro_classe decentrato un poco
    printf("\tREGISTRO DI CLASSE %s anno %i/%i\n",nameclass,anno_corrente,anno_corrente_1);
    for (int i = 0;i < iterazione_totale;i++)
    {
        printf("\t%i - %s\n",i,registro_completo[i]);
    }
    do
    {
        printf("A quale alunno si desidera accedere: \n");
        for (int i = 0;i < iterazione_totale;i++)
        {
            printf("- [%i] %s\n",i,registro_completo[i]);
        }
        scanf("%hi",&scelta);
        printf("Nome Alunno: %s\nClasse Alunno: %s\nData di nascita alunno: %hi/%hi/%hi\nEtà alunno: %hi\nAnno scolastico: %hi/%hi\nMedia: %.2f\n",registro_completo[scelta],nameclass,giorni[scelta],mesi[scelta],anni[scelta],anno_corrente-anni[scelta],anno_corrente,anno_corrente_1,medie[scelta]);
        
        printf("\tVOTI PRIMO QUADRIMESTRE\n");
        printf("Media %s primo quadrimestre: %.2f\n",registro_completo[scelta],medie[scelta]);
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Alunno %s voto in %s: %hi\n",registro_completo[scelta],materie[i],classe_voti_completa[scelta][i]);
        }
        
        printf("\tVOTI SECONDO QUADRIMESTRE\n");
        printf("Media %s primo quadrimestre: %.2f\n",registro_completo[scelta],medie[scelta]);
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Alunno %s voto in %s: %hi\n",registro_completo[scelta],materie[i],classe_voti_completa[scelta][numeromaterie+i]);
        }
        printf("\tVOTI TOTALI\n");
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Alunno %s voto in %s: %hi\n",registro_completo[scelta],materie[i],(classe_voti_completa[scelta][i] + classe_voti_completa[scelta][numeromaterie+i]) / numeromaterie);
        }
        printf("\tNUMERO ORE ASSENZE PRIMO QUADRIMESTRE\n");
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Numero ore assenze di %s in %s: %hi\n",registro_completo[scelta],materie[i],assenze_complete[scelta][i]);
        }
        
        printf("\tNUMERO ORE ASSENZE SECONDO QUADRIMESTRE\n");
        for (int i = 0;i < numeromaterie;i++)
        {
            printf("Numero ore assenze di %s in %s: %hi\n",registro_completo[scelta],materie[i],assenze_complete[scelta][numeromaterie+i]);
        }
        if (condotte[scelta] < 6 || numero_insufficenze[scelta] > 3 && medie[scelta] < 6)
        {
            printf("L'alunno %s non è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti\n",registro_completo[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]);
        }
        else if (condotte[scelta] > 5 && numero_insufficenze[scelta] <= 3 && medie[scelta] >= 6)
        {
            printf("L'alunno %s è stato ammesso alla classe successiva in seguito a una condotta di %hi e di una media di %.2f e con %hi debiti\n",registro_completo[scelta],condotte[scelta],medie[scelta],numero_insufficenze[scelta]);
        }
        printf("Vuoi continuare [si/no]: ");
        scanf("%s",ite);
        
    }
    while (strcmp(ite,"si") == 0);
    return 0;
}
void bubble_sort_update(char **arr,short arr2[],short arr3[],short arr4[],short arr5[],short arr6[],short arr7[],short lunghezza) {
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
            	    
            	    temp6 = arr6[j];
            	    arr6[j] = arr6[j+1];
            	    arr6[j+1] = temp6;
            	    
            	    temp7 = arr7[j];
            	    arr7[j] = arr7[j+1];
            	    arr7[j+1] = temp7;
        	  }
        }
    }
}
/*
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
*/
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
}
void exchange_date(short *puntator,short vector_exchange[],short numeroalunni,short quantita_alunni)
{
    for (int i = 0;i < quantita_alunni;i++)
    {
        puntator[numeroalunni+i] = vector_exchange[i];
    }
}
void exchange_date_for_float(float *puntator,float vector_exchange[],short numeroalunni,short quantita_alunni)
{
    for (int i = 0;i < quantita_alunni;i++)
    {
        puntator[numeroalunni+i] = vector_exchange[i];
    }
}

