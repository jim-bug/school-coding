#include <iostream>
using namespace std;
#define L 10
int main(){
    // esercizio 28 tipicoprof->array

    int vet[L];
    int count = 0;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> vet[i];
    }

    for (int i = 0;i < L;i++){
        if (vet[i] >= 0 && vet[i] <= 9){
            count ++;
        }
    }
    if (count == L){
        cout << "Ci sono tutti!" << endl;
    }
    else{
        cout << "Non ci sono tutti!" << endl;
    }
    return 0;
}