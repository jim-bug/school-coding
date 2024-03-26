#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 26/03/2024
* Consegna: Scrivere un programma in C che permetta, in un processo, di compilare un file sorgente "source.c" presente nella stessa directory dell'eseguibile. Al termine del processo, in un nuovo processo deve poter eseguire il file sorgente che è stato compilato.
* Variazione di Consegna: il programma consente all'utente di fare l'editing del sorgente prima di compilarlo.
* NOTE: in questo caso la wait() non solo consente di evitare che allo scadere della timeslice un processo torna allo stato di ready e uno allo stato di run, evita anche di eseguire un compilato che non esiste quindi "gestisce" anche questo caso. 
*/
int main(){
	pid_t pid;
	pid = fork();
	if(pid == 0){
		printf("\nAttesa editing sorgente, sono il processo: %d\n", getpid());
		system("nano source.c");
		printf("\nEditing completato, inizio compilazione sorgente modificato, sono il processo: %d\n", getpid());
		system("gcc source.c -o source");
		printf("\nCompilazione finita, sono il processo: %d\n", getpid());
	}
	else{
		wait(NULL);
		printf("\nInizio esecuzione compilato, sono il processo: %d\n", getpid());
		system("./source");
	}
	return 0;
}
