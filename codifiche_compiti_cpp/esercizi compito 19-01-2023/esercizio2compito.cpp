#include <iostream>
using namespace std;
#define L 10
int factor(int);
int different_max_vector(int[]);
int main(){
    // Ignazio
    // scrivere un programma che preso in input un array di 10 posizioni restituisca il numero con più fattori primi
    int vet[L];
    int supp[L]; // vettore di supporto
    int max;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> vet[i];
    }
    for (int i = 0;i < L;i++){
        supp[i] = factor(vet[i]);
    }
    cout << "Numero con più fattori primi: " << vet[different_max_vector(supp)] << endl;

    return 0;
}
int factor(int x){
    int div = 2;
    int len = 0;
    while (x > 1){
        if (x % div == 0){
            len ++;
            x /= div;
        }
        else{
            div ++;
        }
    }
    return len;
}
int different_max_vector(int vet[]){
    int max = vet[0];
    int pos;
    for (int i = 0;i < L;i++){
        if (vet[i] > max){
            max = vet[i];
            pos = i;
        }
    }
    return pos;
}