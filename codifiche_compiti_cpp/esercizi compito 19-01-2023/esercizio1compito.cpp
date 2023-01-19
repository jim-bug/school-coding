#include <iostream>
#define L 10
using namespace std;
int main(){
    // Ignazio
    // scrivere un programma che preso in input un array di 10 numeri interi calcoli la media dei valori pari:
    int vet[L];
    int sum = 0;
    int n = 0;
    float media;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> vet[i];
        if (vet[i] % 2 == 0){
            sum += vet[i];
            n ++;
        }
    }
    media = (float) sum / n;
    cout << "La media è " << media << endl;
    return 0;
}