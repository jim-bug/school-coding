#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(){
	pid_t pid = fork();
	if(pid == 0){
		// "sacrifico" il processo figlio associandogli una nuova immagine
		execl("/bin/ls", "ls", NULL);
	}
	else{
		wait(NULL);
		printf("Sono ancora nel sorgente di partenza, sono il processo padre!");
	}
return 0;
}
