#include <stdio.h>
#include <unistd.h>

int main(){
	printf("Sono il processo %d, la mia immagine è ancora il file execl.c\n", getpid());
	execl("./programma", "programma", NULL);
	
	printf("Se vedrai questo messaggio significa che la exec non è andata a buon fine!");
	return 0;
}
