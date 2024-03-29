#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <sys/wait.h>

#define MAX_LENGTH_COMMAND 50
#define MAX_LENGTH_PATH 1024
#define MAX_LENGTH_USER_PATH 50
/*
 * Consegna: Realizzare in C una shell.
 * Data: 29/02/2024
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * 
 * by jim_bug:)
 * */
int main(){
    pid_t pid;
    while (1){
        char path[MAX_LENGTH_PATH];
        getcwd(path, sizeof(path));
        printf("jsh:\"%s\">", path);
        char line[MAX_LENGTH_COMMAND];
        fgets(line, 50, stdin);
        char* argv[MAX_LENGTH_COMMAND];
        char* token = strtok(line, " \n");      // uso questo delimitatore in quanto a fine stringa mi trovo uno \n
        int length = 0;

        while(token != NULL){       // divido un token la riga che ha scritto l'utente.
            argv[length] = token;
            token = strtok(NULL, " \n");
            length ++;
        }
        argv[length] = NULL;
	if(strcmp(argv[0], "exit") == 0){ 	// caso di uscita
		exit(0);
	}
        pid = fork();   // creo un nuovo processo
        if(pid == 0){   // effettuo la system call dentro il processo figlio.
            if(strcmp(argv[0], "cd") == 0){    // se voglio cambiare directory
                if(strcmp(argv[1], "~") == 0) {     // carettere speciale che cambia la posizione in /home/user
                    char *userName = getlogin();        // ottengo il nome dell'utente corrente
                    char userPath[MAX_LENGTH_USER_PATH] = "/home/";
                    strcat(userPath, userName);     // concateno le due stringhe in modo tale da avere un path valido
                    strcpy(argv[1], userPath);     // assegno la path alla nuova directory
//                    chdir(argv[1]);        // cambio posizione nel file system
                }
                if(chdir(argv[1]) != 0){    // cambio posizione nel file system e verifico se ha generato qualche errore.
                    perror("ERROR");
                }
            }
            else{
//		printf("%s", argv[0]);
                execvp(argv[0], argv);
            }
        }
        else {
            wait(NULL);     // aspetto che il processo figlio termini


        }
    }

    return 0;
}
