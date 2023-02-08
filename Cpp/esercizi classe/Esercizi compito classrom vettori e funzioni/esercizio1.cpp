#include <iostream>
using namespace std;
#define L 8
int main(){
    // dopo aver letto e memorizzato 8 numeri in un array, calcolare la somma di quelli n egativi e memorizzare zero al loro posto.
    int vector[L];
    int somma = 0;
    for (int i = 0;i < L;i++){
        cout << "Inserisci l'elemento alla posizione " << i << " : ";
        cin >> vector[i];
    }
    for (int i = 0;i < L;i++){
        if (vector[i] < 0){
            somma += vector[i];
            vector[i] = 0;
        }
    }
    cout << "Somma numeri negativi: " << somma;
    return 0;
}