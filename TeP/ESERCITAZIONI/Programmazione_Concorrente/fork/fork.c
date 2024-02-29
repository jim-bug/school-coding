#include <unistd.h>
#include <stdio.h>

int main(){
	pid_t pid = fork();
	int var = 0;
	scanf("%d", &var);
	printf("Hello!\n");
	if (pid == 0){
		printf("Sono il processo figlio e ho pid %d, mio padre ha pid %d\tValore variabile var: %d\n", getpid(), getppid(), var);
	}
	else{
		printf("Sono il processo padre e ho pid %d, mio figlio ha pid %d\tValore variabile var: %d\n", getpid(), pid, var);
	}
return 0;
}
