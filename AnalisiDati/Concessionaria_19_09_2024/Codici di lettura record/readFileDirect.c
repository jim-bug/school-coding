/*
* Author: Ignazio Leonardo Calogero Sperandeo
* Date: 01/10/2024
* Project: Sperimentazione con file organizzati ad accesso diretto in C
* by jim_bug :)
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define FIELD_LENGTH 13

int getRecordSize(int[]);
int getOffset(int[], int);

int main() {
    FILE* file = fopen("./Record_Cliente.txt", "r");
    if (file == NULL) {
        perror("Error");
        return EXIT_FAILURE;
    }
    char line[1000];
    char field[50];
    int fieldSizes[FIELD_LENGTH] = {17, 20, 10, 1, 16, 25, 25, 25, 25, 25, 6, 5, 15};
    int nRecord;
    int nField;
    int startIndex;
    // int endIndex;
    printf("Inserisci il record di cui vuoi accedere al campo: ");
    scanf("%d", &nRecord);
    printf("Inserisci il codice associato al campo:\n1) Nome\n2) Cognome\n3) Data\n4) Sesso\n5) Codice Fiscale\n6) Stato\n7) Regione\n8) Provincia\n9) Città\n10) Residenza\n11) Numero civico\n12) CAP:\n13) Telefono\n");
    scanf("%d", &nField);
    startIndex = (getRecordSize(fieldSizes) * (nRecord-1)) + getOffset(fieldSizes, nField); 
    printf("Start index: %d, Record Size: %d, Offset: %d, fieldSizes: %d\n", startIndex, getRecordSize(fieldSizes), getOffset(fieldSizes, nField), fieldSizes[nField-1]);
    fgets(line, sizeof(line), file);		// ottengo la prima riga del file

    strncpy(field, line+startIndex, fieldSizes[nField-1]);		// estraggo dalla prima riga del file il campo del record che mi interessa, grazie allo startIndex
    printf("\n%s\n", field);
    fclose(file);
    return 0;
}

int getRecordSize(int vect[]){
	int record = 0;
	for(int i = 0;i < FIELD_LENGTH; i++){
		record += vect[i];
	}
	return record;
}

int getOffset(int vect[], int field){
	int offset = 0;
	for(int i = 0; i < (field-1);i++){
		offset += vect[i];
	}
	return offset;
}



// :)
