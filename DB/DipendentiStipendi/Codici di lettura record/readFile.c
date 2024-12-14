/*
* Author: Ignazio Leonardo Calogero Sperandeo
* Date: 30/09/2024
* Project: Sperimentazione con file organizzati sequenzialmente in C
* by jim_bug :)
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LENGTH 100
#define LENGTH_FIELDS 13

void printRecord(const char[], char[], char**);

int main() {
    FILE* file = fopen("./Record_Cliente.txt", "r");
    if (file == NULL) {
        perror("Error");
        return EXIT_FAILURE;
    }

    char* fields[] = {
        "Nome: ",
        "Cognome: ",
        "Data: ",
        "Sesso: ",
        "Cod. Fiscale: ",
        "Stato: ",
        "Regione: ",
        "Provincia: ",
        "Città: ",
        "Residenza: ",
        "Civico: ",
        "CAP: ",
        "TEL: "
    };

    char line[LENGTH];
    const char field[2] = "="; 
    while (fgets(line, sizeof(line), file)) {
        printRecord(field, line, fields);

    }

    fclose(file);
    return 0;
}

void printRecord(const char field[], char line[], char* fields[]) {
    char *token;
    int i = 0;
    token = strtok(line, field);        // split in different token by field separator
    while(token != NULL){
        printf("%s%s\n", fields[i], token);
        token = strtok(NULL, field);
        i ++;
    }
    // printf("\n");

}
// :)
