#include <iostream>
using namespace std;
#define N 8
int main(){
    // https://ticoprof.wordpress.com/2016/04/26/esercizi-con-gli-array/ es 33
    int vet[N];
    int count = 0;
    for (int i = 0;i < N;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> vet[i];
    }
    for (int i = 0;i < N-1;i++){
        if (vet[i] != vet[i+1]){
            count ++;
        }
    }
    if(count == (N-1)){cout << "Vettore con elementi diversi " << endl;}
}