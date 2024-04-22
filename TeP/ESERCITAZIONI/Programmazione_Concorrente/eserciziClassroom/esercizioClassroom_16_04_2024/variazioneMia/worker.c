/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 19/04/2024
* Funzione che eseguirà ogni thread.
*/

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include "worker.h"

#define BSIZE 25
#define bzero(b,len) (memset((b), '\0', (len)), (void) 0)
/* Worker thread */
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *worker(void* args){

  char target[BSIZE + 1];
  char buffer[BSIZE + 1];
  int index;
  FILE* file;
  double* money;	// modifico il tipo di dato da int a double, in quanto dovrò sommare numeri in virgola mobile.
  double totaleFile = 0.0;
    
  // get thread args
  index = ((thread_args*) args)->index;
  money = ((thread_args*) args)->money;
  
  bzero(buffer, BSIZE);
  snprintf(target, BSIZE, "%s%d", "cash", index);
  
  file = fopen(target, "r");
  if (file == NULL){
    printf("Error - Bad cash file %s!\n", target);
    exit(-2);
  }
  
  // read all the rows of the file
  // pthread_mutex_lock(&mutex);
  while (fgets(buffer, BSIZE, file) != NULL){

//     pthread_mutex_lock(&mutex);

    /*
      Estrazione importo in virgola mobile, prototipo:
      dd/mm/yyyy N
     
      Per estrarre da N in poi identifico la posizione da cui parte N, in questo caso 11. Quindi devo effettuare uno slice
      dalla posizione 11 fino alla fine della stringa, quindi da 11 fino a len-11. Una volta estratto l'importo lo converto in double
      con la funzione atof().

      NOTA:
      Dato che una stringa è un array di caratteri, scrivendo buffer, mi sto riferendo al puntatore che punta alla prima posizione della stringa.
      Dato che un char in C occupa 1 byte, sommando 11 a buffer, aritmetica dei puntatori, mi sto riferendo al puntatore all undicesima posizone della stringa.
    */
    // Questa è la sezione critica, ossia la parte di codice dove più thread accedono ad una risorse, proprio in questa sezione deve essere gestito l'accesso alle risorse.
    char dest[20];
    int endStr = strlen(buffer) - 11;
    memcpy(dest, buffer+11, endStr);
    /*
    pthread_mutex_lock(&mutex);
    *money = *money + atof(dest);
    pthread_mutex_unlock(&mutex);
    */
    totaleFile += atof(dest);
    bzero(buffer, BSIZE);
  }
  fclose(file);
  pthread_mutex_lock(&mutex);
  *money += totaleFile;
  pthread_mutex_unlock(&mutex);

  pthread_exit(NULL);
}
