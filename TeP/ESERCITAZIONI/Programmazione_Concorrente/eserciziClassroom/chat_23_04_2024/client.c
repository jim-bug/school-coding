#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <netdb.h> // Aggiunta per gethostbyname

typedef struct MSG {
    int value;
    char tipo[150];
} MSGI;

void scrivi(int sock, MSGI* message){
	   while(1){
            char msg[150];
            printf("Inserisci qualcosa da inviare al server: ");
            fgets(msg, 150, stdin);
	    printf("\n%s\n", msg); 

            if (write(sock, msg, 150) < 0) { // Controllo sulla quantità inviata
                        perror("Errore durante l'invio del messaggio");
                        exit(-1);
        }

    }

}
int main() {
    int client_socket;
    struct sockaddr_in server;
    struct hostent *hp;
    MSGI msg;

    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket < 0) {
        perror("Socket -> Errore");
        exit(-1);
    }

    server.sin_family = AF_INET;
    server.sin_port = htons(8085);
    hp = gethostbyname("localhost");
    if (hp == NULL) { // Controllo corretto sull'esito di gethostbyname
        perror("Errore localhost");
        exit(-1);
    }

    memcpy(&server.sin_addr, hp->h_addr, hp->h_length);		// assegno a sin_addr l'indirizzo del server trovato con gethostbyname

    if (connect(client_socket, (struct sockaddr *)&server, sizeof(server)) < 0) {
        perror("Errore durante la connessione");
        exit(-1);
    }
    scrivi(client_socket, &msg);
/*
   while(1){
	    printf("Inserisci qualcosa da inviare al server: ");
	    fgets(msg.tipo, 20, stdin);

	    if (write(client_socket, &msg, sizeof(msg)) < 0) { // Controllo sulla quantità inviata
        		perror("Errore durante l'invio del messaggio");
        		exit(-1);
	}

    }

    close(client_socket); // Chiusura del socket
*/
    return 0;
}
