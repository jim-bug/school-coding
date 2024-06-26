/* Pthread example - worker.c             */
/* Author: Marco Frison for Mr. Webmaster */
/* Released under GPL v3                  */

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include "worker.h"

#define BSIZE 10
#define bzero(b,len) (memset((b), '\0', (len)), (void) 0)
/*
void* bzero(char *buf,int bs)
{
	memset(buf,0x0,bs);
}
*/
/* Worker thread */
void* worker(void* args)
{

  char target[BSIZE + 1];
  char buffer[BSIZE + 1];
  int index;
  FILE* file;
  int* money;
    
  // get thread args
  index = ((thread_args*) args)->index;
  money = ((thread_args*) args)->money;
  
  bzero(buffer, BSIZE);
  snprintf(target, BSIZE, "%s%d", "cash", index);
  
  file = fopen(target, "r");
  if (file == NULL)
  {
    printf("Error - Bad cash file %s!\n", target);
    exit(-2);
  }
  
  // read all the rows of the file
  while (fgets(buffer, BSIZE, file) != NULL)
  {
    // update money value
    *money = *money + atoi(buffer);
    bzero(buffer, BSIZE);
  }

  pthread_exit(NULL);
}
