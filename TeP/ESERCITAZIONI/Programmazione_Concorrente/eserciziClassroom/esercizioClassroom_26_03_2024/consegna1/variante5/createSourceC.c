#include <stdio.h>
#include <time.h>
#include <string.h>

/*
* Autore: Ignazio Leonardo Calogero Sperandeo.
* Data: 27/03/2024
* Consegna: Questo software crea un sorgente in C e gli inserisce un frammento di codice con una riga di commento che indica la data e ore corrente.
*/
int main() {
    FILE* file = fopen("source.c", "w");		// creo un file in C e lo apro in modalità scrittura, l'opzione w, se il file esiste già, sovrascrive il contenuto.
    time_t currentTime;
    time(&currentTime);		// ottengo il tempo in secondo a partire dal gennaio 1970.
    char *timeString = ctime(&currentTime);	// converto il risultato di time(), nel tempo corrente leggibile dall'utente.
    char endCode[60] = "\nint main(){\n\tprintf(\"Hello world!\");\n\treturn 0;\n}\n";
    char startCode[120] = "#include <stdio.h>\n// ";
    strcat(startCode, timeString);	// concateno l'inclusione della libreria + il commento con la data e ora corrente.
    strcat(startCode, endCode);		// concateno il resto del codice.
    fprintf(file, "%s", startCode);	// scrivo sullo stream file una stringa
    fclose(file);

    return 0;
}

