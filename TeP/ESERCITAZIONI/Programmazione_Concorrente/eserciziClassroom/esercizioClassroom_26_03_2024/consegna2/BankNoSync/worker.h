/* Pthread example - worker.h             */
/* Author: Marco Frison for Mr. Webmaster */
/* Released under GPL v3                  */


/*
Ho rimosso typedef e eliminato i puntatori, adesso sono solo delle variabili di tipo intere.
*/
struct S{
  int index;
  int money;
};

void worker(void* args);
