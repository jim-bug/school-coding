/* Pthread example - worker.h             */
/* Author: Marco Frison for Mr. Webmaster */
/* Released under GPL v3                  */

typedef struct
{
  int index;
  int* money;
} thread_args;

void* worker(void* args);
