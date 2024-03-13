#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

/*
* Autore: Ignazio Leonardo Calogero Sperandeo.
* Data: 06/03/2024
* Consegna: Realizzare un codice in C che permetta l'inserimento di 4 interi in un vettore e poi:

    in un primo processo: venga lanciata una shell;
    in un secondo processo: si visualizzi la media del contenuto del vettore;
    in un terzo processo: si reinseriscano gli interi del vettore per mostrarne successivamente la media.
* NOTE: Uso la funzione wait(NULL) per evitare la time splice influenzi lo stdout.
*/

#define LENGTH 4
void popolArray(int[]);
float mediArray(int[]);
void stampArray(int[]);

int main(){
	pid_t pid;
	int vector[LENGTH];
	popolArray(vector);
	pid = fork();
	if(pid == 0){
		pid_t pid2 = fork();	// effettuo un nuovo fork, quindi un nuovo processo.
		if(pid2 == 0){
			printf("Sto eseguendo la shell, sono il processo %d\n", getpid());
			execl("/bin/sh", "sh", NULL);	// chiamo la exec per eseguire la shell
		}
		else{
			wait(NULL);
			popolArray(vector);
			printf("\nSono il processo: %d, sto lavorando sul seguente array e la sua media è: %f", getpid(), mediArray(vector));
			stampArray(vector);
		}
	}
	else{
		wait(NULL);
		printf("\nSono il processo: %d, sto lavorando sul seguente array e la sua media è: %f", getpid(), mediArray(vector));
		stampArray(vector);
	}
}

void popolArray(int vet[]){
	for(int i = 0;i < LENGTH; i++){
		printf("Inserisci l'elemento alla posizione %d: ", i);
		scanf("%d", &vet[i]);
	}
}

float mediArray(int vet[]){
	float media = 0;
	for(int i = 0;i < LENGTH; i++){
		media += vet[i];
	}
	media = (float)(media / LENGTH);
	return media;
}

void stampArray(int vet[]){
	printf("\t");
	for(int i = 0;i < LENGTH; i++){
		printf("%d ", vet[i]);
	}
	printf("\n");
}
