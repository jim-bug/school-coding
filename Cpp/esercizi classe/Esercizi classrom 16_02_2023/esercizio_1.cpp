#include <iostream>
using namespace std;

int main(){
    // Dato un numero intero di ammalati che ogni giorno guarisce, calcolare quanti giorni sono necessari affinché il numero di ammalati sia<100:
    int num_amm;
    int num_guar;
    int giorni = 0;
    cout << "Inserisci il numero di malati: ";
    cin >> num_amm;
    cout << "Inserisci il numero di guariti: ";
    cin >> num_guar;
    do{
        num_amm -= num_guar;
        giorni ++;
        cout << "Il giorno " << giorni << " ci sono " << num_amm << " ammalati." << endl;
    }
    while(num_amm > 100);
    cout << "Totale giorni: " << giorni << endl;

    return 0;
}
