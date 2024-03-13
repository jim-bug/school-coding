#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 05/03/2024
* Consegna: Realizzare un codice in C che stampi i numeri da 0 a 10000, in un processo in ordine crescente, in un secondo processo in ordine decrescente.
*/
int main(){
	pid_t pid;
	int endRange = 10000;
	pid = fork();
	if(pid == 0){
		printf("Sono il processo %d e sto stampando i numeri da 0 a %d\n", getpid(), endRange);
		for(int i = 0; i <= endRange; i++){
			printf(" %d ", i);
		}
		printf("\n");
	}
	else{
		wait(NULL);	// uso il wait per evitare che la time slice influisca sullo stdout. Con il wait faccio aspettare il processo padre fino alla terminazione del processo figlio.
		printf("Sono il processo %d e sto stampando i numeri da %d a 0\n", getpid(), endRange);
                for(int i = endRange; i >= 0; i--){ 
                        printf(" %d ", i);
                }
                printf("\n");
	}
	return 0;
}
