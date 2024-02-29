#include <stdio.h>
#include <unistd.h>

int main(){
	printf("La mia immagine è cambiata, adesso è il file immagineNuova.c, ma il mio PID è sempre: %d\n", getpid());
	return 0;
}
