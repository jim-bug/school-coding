/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 19/04/2024
*/
typedef struct
{
  int index;
  double* money;	// cambio il tipo di dato della somma totale di ogni importo del file.
} thread_args;

void *worker(void* args);
