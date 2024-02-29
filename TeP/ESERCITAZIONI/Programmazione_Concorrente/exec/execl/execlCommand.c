#include <stdio.h>
#include <unistd.h>
/*
* Sintassi funzione execl:
* execl(path_eseguibile, nome_eseguibile, arg0, arg1, NULL);
*/
int main(){
	printf("Sono il processo %d, la mia immagine è ancora il file execl.c\n", getpid());
	execl("/bin/ls", "ls", "-l", NULL);		// al posto di eseguire un altro programma eseguo direttamente un comando.
	
	printf("Se vedrai questo messaggio significa che la exec non è andata a buon fine!\n");
	return 0;
}
