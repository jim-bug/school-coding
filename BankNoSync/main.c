/* Pthread example - bank.c               */
/* Author: Marco Frison for Mr. Webmaster */
/* Released under GPL v3                  */
/* 20151108 AT modified for edu           */
/* Programmazione concorrente in POSIX C  */
/* http://www.mrwebmaster.it/c/programmazione-concorrente-posix-c_7688.html */
/* esempio senza sincronizzazione */
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include "worker.h"

int main(int argc, char *argv[])
{

  double money = 0;
  int n_threads, i;
  pthread_t *threads;
  thread_args *args;

  // check parameters
  if (argc != 2)
  {
    printf("Error - Three parameters required\n");
    printf("[USAGE]: bank <N threads>\n");
    exit(1);
  }
  // get threads number
  n_threads = atoi(argv[1]);
  if (n_threads < 1)
  {
    printf("Threads parameter must be greater than one!\n");
    exit(-1);
  }

  // allocate threads and their args
  threads = (pthread_t*) malloc(sizeof(pthread_t) * n_threads);
  args = (thread_args*) malloc(sizeof(thread_args) * n_threads);

  // prepare and starts threads
  for (i = 0; i < n_threads; i++)
  {
    (args + i)->index = i;
    (args + i)->money = &money;
    pthread_create((threads + i), NULL, worker, (void *)(args + i));
  }

  // wait threads die
  for (i = 0; i < n_threads; i++)
  {
    pthread_join(*(threads + i), NULL);
  }

  // print result
  printf("Account state: %.2f\n", money);
  exit(0);

}
