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
 *
 * NOTE e AVVERTENZE:
 * La shell non prevede l'uso di PIPE e delle redirezioni dell'output. Sono validi i comandi presenti nella $PATH, è previsto solo l'uso di due comandi che non presentano l'eseguibile:
 *  1) cd, con la possibilità di usare la tilde.
 *
 *  Funzione exec usata:
 *          int execvp (const char *file, char *const argv[]);
 *  Come l'ho usata:
 * Nel primo parametro scrivo il nome del comando da eseguire, nel secondo, inserisco un array di stringhe con terminazione nulla. Nell'array di stringhe sono presenti
 * opzioni e argomenti di quel comando.
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
        char *argv[MAX_LENGTH_COMMAND];
        char* token = strtok(line, " \n");      // uso questo delimitatore in quanto a fine stringa mi trovo uno \n
        int length = 0;

        while(token != NULL){       // divido un token la riga che ha scritto l'utente.
            argv[length] = token;
            token = strtok(NULL, " \n");
            length ++;
        }
        argv[length] = NULL;

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
                execvp(argv[0], argv);
            }
        }
        else {
//            if (strcmp(argv[0], "exit") == 0){
//                exit(0);
//            }
            wait(NULL);     // aspetto che il processo figlio termini


        }
    }

    return 0;
}
