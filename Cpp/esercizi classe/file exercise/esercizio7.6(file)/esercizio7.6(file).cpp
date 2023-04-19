#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // Creare un programma che chiede all’utente un carattere e conta quante volte quel carattere compare nel file “testo.txt”.
    ifstream file;
    char car;
    char supp;
    int count = 0;
    file.open("testo.txt");
    cout << "Inserisci il carattere da contare: " << endl;
    cin >> car;
    while (not file.eof()){
        file >> supp;
        if (supp == car){
            count ++;
        }
    }
    cout << "Il carattere " << car << " e' stato trovato " << count << " volte." << endl;
    file.close();
    return 0;
}