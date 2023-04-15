#include <iostream>
#include <fstream>
using namespace std;

int main(){
    // Da un file già esistente aggiungi i primi 10 caratteri di un testo scelto dall'utente:
    
    fstream file;
    file.open("File.txt", ios::app);
    string text;
    int max;
    cout << "Inserisci il testo: " << endl;
    cin >> text;
    cout << "Inserisci il numero di caratteri che vuoi importare nel file: " << endl;
    cin >> max;
    // file << endl;
    for (int i = 0;i < max;i++){
        file << text[i] << endl;
    }
    file.close();
    return 0;
}