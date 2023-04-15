#include <iostream>
#include <fstream>
using namespace std;

int main(){
    // Scrivere un programma che ricevuto in ingresso un file chiamato “input.txt” e un carattere digitato da tastiera dall’utente restituisca tramite la console quante volte quel carattere compare per due volte consecutive nel file “input.txt”:
    ifstream file("input.txt");
    char k;
    char support;
    int count = 0;
    int counter = 0;
    bool cond = false;
    cout << "Inserisci il carattere: " << endl;
    cin >> k;
    while (not file.eof()){
        file >> support;
        if (support == k){
            count ++;
            if (count == 2){
                counter ++;
                count = 0;
            }
            else{
                continue;
            }
        }
        else{
            count = 0;
        }
    }
    file.close();
    cout << "Il carattere " << k << " compare " << counter << " volte consecutive in coppia." << endl;
    return 0;
}
