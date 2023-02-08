#include <iostream>
using namespace std;
#define L 5
#define L1 10
int main(){
    // https://ticoprof.wordpress.com/2016/04/26/esercizi-con-gli-array/ es 24
    int vet[L];
    int vet1[L];
    int vector[L1];
    for (int i = 0;i < L;i ++){
        cout << "Inserisci l'elemento alla posizione " << i << " : ";
        cin >> vet[i];
        vector[i] = vet[i];
    }
    for (int i = 0;i < L;i ++){
        cout << "Inserisci l'elemento alla posizione " << i << " : ";
        cin >> vet1[i];
        vector[L+i] = vet1[i];
    }

    for (int i = 0;i < L1-1;i++){
        for (int j = i + 1;j < L1;j++){
            if (vector[i] > vector[j]){
                int temp = vector[i];
                vector[i] = vector[j];
                vector[j] = temp;
            }
        }
    }

    return 0;
}