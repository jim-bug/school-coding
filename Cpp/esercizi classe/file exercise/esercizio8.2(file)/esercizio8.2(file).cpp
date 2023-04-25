#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // data una sequenza di interi fornita dall'utente memorizzare solo i multipli di 5 nel file multipli5.txt, il numero 0 blocca la digitazione(pag A247 n 21):
    ofstream file_ou("multipli5.txt");
    int num;
    do {
        cout << "Inserisci il numero: " << endl;
        cin >> num;
        if (num % 5 == 0){
            file_ou << num << endl;
        }
    }
    while (num != 0);
    file_ou.close();
    return 0;
}