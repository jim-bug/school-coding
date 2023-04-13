#include <iostream>
#include <fstream>
using namespace std;
/* if you want to put some prototip of function */
int main() {
    // introduzione ai File.
    /*
     * Un file è un insieme di bit.
     * Codifica: passare da un linguaggio ad un altro.
     * */
    char stringa[20];
    ofstream file_1; // istanza alla classe ofstream(crea un file e scrive al suo interno).
    file_1.open("File.txt"); // crea il file sovrascrivendo i già esistenti.
    file_1 << "CIAO"; // scrivo all'interno del file.
    file_1.close(); // chiudo il file

    // in conclusione ofstream serve per creare file.

    ifstream file_2;
    file_2.open("File.txt");
    file_2.getline(stringa, 20);
    // oppure si potrebbe fare:
    file_2 >> stringa[0]; // sto passando in input all'elemento 0 dell'array di char chiamato stringa.
    file_2.close();

    // metodo .eof(), ritorna true se siamo alla fine del file, viceversa.
    return 0;
}