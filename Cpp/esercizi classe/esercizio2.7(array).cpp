#include <iostream>
using namespace std;
#define L 10
int summ(int[], int);
int main(){
    // https://ticoprof.wordpress.com/2016/04/26/esercizi-con-gli-array/ es 32
    int v[L];
    int somma = 0;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : " << endl;
        cin >> v[i];
    }
    int s = summ(v, 1);
    for (int i = 0;i < L;i++){
        if (s-v[i] == v[i]){
            cout << "Cella trovata! Posizione " << i << endl;
        }
    }
    return 0;
}
int summ(int vet[], int pos){
    int somma = 0;
    for (int i = 0;i < L;i++){
        somma += vet[i];
    }
    return somma;
}