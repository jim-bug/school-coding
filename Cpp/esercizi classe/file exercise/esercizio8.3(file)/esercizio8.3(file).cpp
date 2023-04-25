#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // data una sequenza di interi fornita dall'utente memorizzare nel file positivi.txt i numeri positivi e in negativi.txt i numeri negativi, il numero 0 interrompe la digitazione(pag A247 n 22):
    ofstream file_pos("positivi.txt");
    ofstream file_neg("negativi.txt");
    int num;
    do {
        cout << "Inserisci un numero: " << endl;
        cin >> num;
        if (num < 0){
            file_neg << num << endl;
        }
        else{
            file_pos << num << endl;
        }
    }
    while (num != 0);
    file_pos.close();
    file_neg.close();
    return 0;
}