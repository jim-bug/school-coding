#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LENGTH 256

void printRecord(char record, char field, char line[]);

int main() {
    // Apri il file per la lettura
    FILE* file = fopen("./Record_Cliente.txt", "r");

    // Verifica se il file è stato aperto correttamente
    if (file == NULL) {
        perror("Errore nell'apertura del file");
        return EXIT_FAILURE;
    }

    char line[LENGTH];
    char record = '\n'; // Separatore di record (nuova riga)
    char field = '=';   // Separatore di campo (uguale)

    // Leggi il file riga per riga
    while (fgets(line, sizeof(line), file)) {
        printRecord(record, field, line);
    }

    // Chiudi il file
    fclose(file);
    return 0;
}

void printRecord(char record, char field, char line[]) {
    int pointer = 0;
    int len = strlen(line);
    char fie[LENGTH];  // Buffer per memorizzare il campo

    // Itera attraverso ogni carattere della linea
    for (int i = 0; i <= len; i++) {
        // Se trovi il separatore di campo o la fine della linea
        if (line[i] == field || line[i] == record || line[i] == '\0') {
            // Copia il campo estratto nella stringa 'fie'
            strncpy(fie, line + pointer, i);
            fie[i - pointer] = '\0';  // Termina la stringa con \0
            printf("%s\n", fie);      // Stampa il campo estratto
            pointer = i + 1;          // Aggiorna il puntatore per il prossimo campo
        }
    }
}
