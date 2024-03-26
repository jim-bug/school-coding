#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>


#define PATH_LENGTH 1024
#define ARGS_LENGTH 5
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 26/03/2024
* Consegna: Scrivere un programma in C che permetta, in un processo, di compilare un file sorgente "source.c" presente nella stessa directory dell'eseguibile. Al termine del processo, in un nuovo processo deve poter eseguire il file sorgente che è stato compilato.
* Variazione di Consegna: In un primo processo permettere all'utente di scrivere un nuovo sorgente in C di nome source.c, la scrittura di questo sorgente deve avvenire in una nuova finestra di terminale. In un secondo processo compilare il programma appena scritto e in un terzo eseguirlo.
* NOTE: in questo caso la wait() non solo consente di evitare che allo scadere della timeslice un processo torna allo stato di ready e uno allo stato di run, evita anche di eseguire un compilato che non esiste quindi "gestisce" anche questo caso.
* per eseguire un comando su una nuova shell ho usato bash -c comando per far che quel comando abbia degli argomenti uso bash -c "comando arg", per farlo in C uso l'escape sequence \".
*/
int main(){
	pid_t pid;
	pid = fork();
	if(pid == 0){
		pid_t pid2;
		pid2 = fork();
		if(pid2 == 0){
			char path[PATH_LENGTH];
			getcwd(path, PATH_LENGTH);		// ottengo la posizione del filesystem corrente.
			strcat(path, "/source.c");
			char *args[ARGS_LENGTH] = {"gnome-terminal", "--", "nano"};
			args[3] = path;
			args[4] = NULL;
	                printf("\nAttesa scrittura sorgente, sono il processo: %d\n", getpid());
			execvp(args[0], args);
        	        // system("/bin/bash -c \"nano source.c\"");
	                // printf("\nScrittura sorgente completato, inizio compilazione sorgente modificato, sono il processo: %d\n", getpid());

		}
		else{
			wait(NULL);
	                system("gcc source.c -o source");
        		printf("\nCompilazione finita, sono il processo: %d\n", getpid());
		}
	}
	else{
		wait(NULL);
		printf("\nInizio esecuzione compilato, sono il processo: %d\n", getpid());
		system("./source");
	}
	return 0;
}
