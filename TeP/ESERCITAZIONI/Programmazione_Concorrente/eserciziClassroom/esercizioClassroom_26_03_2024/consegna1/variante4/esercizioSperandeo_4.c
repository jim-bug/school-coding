#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <string.h>


#define PATH_LENGTH 1024
#define LINE_LENGTH 300
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 26/03/2024
* Consegna: Scrivere un programma in C che permetta, in un processo, di compilare un file sorgente "source.c" presente nella stessa directory dell'eseguibile. Al termine del processo, in un nuovo processo deve poter eseguire il file sorgente che è stato compilato.
* Variazione di Consegna: In un primo processo permettere all'utente di scrivere un nuovo sorgente in C di nome source.c, la scrittura di questo sorgente deve avvenire in una nuova finestra di terminale. In un secondo processo compilare il programma appena scritto e in un terzo eseguirlo.
* NOTE: in questo caso la wait() non solo consente di evitare che allo scadere della timeslice un processo torna allo stato di ready e uno allo stato di run, evita anche di eseguire un compilato che non esiste quindi "gestisce" anche questo caso.
*/
int main(){
	pid_t pid;
	pid = fork();
	if(pid == 0){
		pid_t pid2;
		pid2 = fork();
		if(pid2 == 0){
			char path[PATH_LENGTH];
			char command[LINE_LENGTH] = "gnome-terminal --wait -- nano ";
			getcwd(path, PATH_LENGTH);		// ottengo la posizione del filesystem corrente.
			strcat(path, "/source.c");
			strcat(command, path);
                    	/*
			char *args[ARGS_LENGTH] = {"gnome-terminal", "--wait", "--", "nano"};		// l'opzione --wait mette in attesa il processo corrente fin quando non termina il processo avviato con gnome-terminal.
			args[4] = path;
			args[5] = NULL;
			*/
	                printf("\nAttesa scrittura sorgente, sono il processo: %d\n", getpid());
			system(command);
			// execvp(args[0], args);
        	        // system("/bin/bash -c \"nano source.c\"");
	                printf("\nScrittura sorgente completato, inizio compilazione sorgente modificato, sono il processo: %d\n", getpid());

		}
		else{
			wait(NULL);
			// printf("\nScrittura sorgente completato, inizio compilazione sorgente modificato, sono il processo: %d\n", getpid());
	                system("gcc source.c -o source");
        		printf("\nCompilazione finita, sono il processo: %d\n", getpid());
		}
	}
	else{
		wait(NULL);
		printf("\nInizio esecuzione compilato, sono il processo: %d\nOutput esecuzione:\n", getpid());
		system("./source");
	}
	return 0;
}
