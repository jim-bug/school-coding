#include <iostream>
using namespace std;
void mysorting(int[], int);
void swapping(int*, int*);
int main(){
    // Scrivere una funzione che prende in input un vettore e lo ordina (usare la funzione dell’esercizio 8):
    int len;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> len;
    int vector[len];
    for (int i = 0;i < len;i++){
        cout << "Inserisci il valore alla posizione " << i << " : ";
        cin >> vector[i];
    }
    mysorting(vector, len);
    for (int i = 0;i < len;i++){
        cout << "Elemento alla posizione " << i << " : " << vector[i] << endl;
    }
    return 0;
}
void swapping(int *x, int *y){
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}
void mysorting(int vet[], int len){
    for (int i = 0;i < len;i++){
        for (int j = i + 1; j < len;j++){
            if (vet[i] > vet[j]){
                swapping(&vet[i], &vet[j]);
            }
        }
    }
}