#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 26/03/2024
* Consegna: Scrivere un programma in C che permetta, in un processo, di compilare un file sorgente "source.c" presente nella stessa directory dell'eseguibile. Al termine del processo, in un nuovo processo deve poter eseguire il file sorgente che è stato compilato.
* NOTE: in questo caso la wait() non solo consente di evitare che allo scadere della timeslice un processo torna allo stato di ready e uno allo stato di run, evita anche di eseguire un compilato che non esiste quindi "gestisce" anche questo caso. 
*/
int main(){
	pid_t pid;
	pid = fork();
	if(pid == 0){
		system("./createSource");		// eseguo il programma che crea un sorgente con i requisiti richiesti.
		system("gcc source.c -o source");
	}
	else{
		wait(NULL);
		system("./source");
		printf("\n");
		system("cat source.c");
	}
	return 0;
}
