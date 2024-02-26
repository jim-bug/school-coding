#include <unistd.h>
#include <stdio.h>

int main(){
	int pid = fork();
	printf("Hello!\n");
	if (pid == 0){
	/*

	Mi aspetto che il processo figlio venga adottato dall'INIT process, in quanto il processo padre non è più in esecuzione
	
	*/
		sleep(5);
		printf("Sono il processo figlio e ho pid %i, mio padre ha pid %i\n", getpid(), getppid());
	}
	else{
		printf("Sono il processo padre e ho pid %i, mio figlio ha pid %i\n", getpid(), pid);
	}
return 0;
}
