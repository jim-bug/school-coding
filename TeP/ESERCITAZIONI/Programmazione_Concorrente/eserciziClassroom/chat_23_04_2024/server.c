#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

typedef struct MSG {
    int value;
    char tipo[150];
} MSGI;

int main(int argc, char* argv[]) {
    int server_sock;
    struct sockaddr_in server, client;
    int length = sizeof(client);
    int complete_socket;
    MSGI msg;

    server_sock = socket(AF_INET, SOCK_STREAM, 0);
    if (server_sock < 0) {
        perror("Creazione della socket -> Errore");
        exit(-1);
    }

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(8085);

    if (bind(server_sock, (struct sockaddr *)&server, sizeof(server)) < 0) {
        perror("Binding server -> Errore");
        exit(-1);
    }

    if (getsockname(server_sock, (struct sockaddr *)&server, &length) < 0) {
        perror("Errore con getsockname()");
        exit(-1);
    }

    if (listen(server_sock, 1) < 0) {
        perror("Listen -> Errore");
        exit(-1);
    }
    char message[150];
//    while (1) {
        complete_socket = accept(server_sock, (struct sockaddr *)&client, (socklen_t *)&length);
        if (complete_socket < 0) {
            perror("Errore accept");
            exit(-1);
        }
while(1){
        // Gestione della connessione
        ssize_t bytes_read = read(complete_socket, message, 150);
        if (bytes_read <= 0) {
            printf("Connessione chiusa dal client %ld\n", bytes_read);
            close(complete_socket);
	    break;
        }

        printf("Client: %s\n", message);

//        close(complete_socket); // Chiudi il socket quando hai finito di gestire la connessione
    }

    return 0;
}
