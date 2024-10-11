/*
 * Consegna: Realizzare in C una shell.
 * Data: 29/02/2024
 * Revisione: 11/10/2024
 * Autore: Ignazio Leonardo Calogero Sperandeo
 * 
 * by jim_bug:)
 * */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <sys/wait.h>

#define MAX_LENGTH_COMMAND 50
#define MAX_LENGTH_PATH 1024
#define MAX_LENGTH_USER_PATH 50

int main(){
    pid_t pid;
    while (1){
        int stateBackground = 0;
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

        if(strcmp(argv[length-1], "&") == 0){
            stateBackground = 1;
            argv[length-1] = NULL;
        }
        else{
            argv[length] = NULL;
        }


        if(strcmp(argv[0], "exit") == 0){ 	// caso di uscita
            exit(0);
        }

        // gestisco il cambio di directory nel processo padre in quanto farlo nel processo figlio non rifletterà nel processo padre.
        if(strcmp(argv[0], "cd") == 0){
            if(strcmp(argv[1], "+") == 0) {             // carettere speciale che cambia la posizione in /home/user
                char *userName = getlogin();            // ottengo il nome dell'utente corrente
                char userPath[MAX_LENGTH_USER_PATH] = "/home/";
                strcat(userPath, userName);             // concateno le due stringhe in modo tale da avere un path valido
                strcpy(argv[1], userPath);              // assegno la path alla nuova directory
            }
            if(chdir(argv[1]) != 0){    // cambio posizione nel file system e verifico se ha generato qualche errore.
                perror("ERROR");
            }
            continue;
        }

        pid = fork();
        if(pid == 0){
            if(execvp(argv[0], argv) == -1){
                perror("COMMAND NOT FOUND!");
                exit(-1);
            }
        }
        else {
            if(!stateBackground){
                wait(NULL);         // il processo padre attenderà il processo figlio che termini.
            }
        }
    }

    return 0;
}
// :)