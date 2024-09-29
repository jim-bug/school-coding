#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LENGTH 256

void printRecord(char record, char field, char line[]);

int main() {
    FILE* file = fopen("./Record_Cliente.txt", "r");

    if (file == NULL) {
        perror("Errore nell'apertura del file");
        return EXIT_FAILURE;
    }

    char line[LENGTH];
    char record = '\n'; // Separatore di record (nuova riga)
    char field = '=';   // Separatore di campo (uguale)

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

    for (int i = 0; i <= len; i++) {
        if (line[i] == field || line[i] == record || line[i] == '\0') {
            strncpy(fie, line + pointer, i);
	    fie[i-pointer] = '\0';
            pointer = i + 1;
        }
    }
}
