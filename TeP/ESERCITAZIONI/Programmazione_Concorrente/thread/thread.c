#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Struttura per passare dati ai thread
struct ThreadData {
    int numero;
};

// Funzione eseguita dal primo thread per leggere un numero in input
void *threadLeggiNumero(void *arg) {
    struct ThreadData *data = (struct ThreadData *)arg;
    printf("Inserisci un numero: ");
    scanf("%d", &(data->numero));
    return NULL;
}

// Funzione eseguita dal secondo thread per stampare qualcosa in base al numero
void *threadStampa(void *arg) {
    struct ThreadData *data = (struct ThreadData *)arg;
    if (data->numero > 0) {
        printf("Il numero inserito è positivo\n");
    } else if (data->numero < 0) {
        printf("Il numero inserito è negativo\n");
    } else {
        printf("Il numero inserito è zero\n");
    }
    return NULL;
}

int main() {
    pthread_t thread1, thread2;
    struct ThreadData data;

    // Creazione e avvio dei thread
    pthread_create(&thread1, NULL, threadLeggiNumero, &data);
    pthread_create(&thread2, NULL, threadStampa, &data);

    // Attendi che entrambi i thread terminino
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}
