#include <iostream>
#include <cmath>
using namespace std;
void squarearray(int[], int);
int main(){
    // // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 2
    int n;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> n;
    int vector[n];
    for (int i = 0;i < n;i++){
        cout << "Inserisci il valore alla posizione " << i << " : ";
        cin >> vector[i];
    }
    squarearray(vector, n);
    for (int i = 0;i < n;i++){
        cout << "Elemento alla posizione: " << i << " : " << vector[i] << endl;
    }
    return 0;
}
void squarearray(int vet[], int len){
    for (int i = 0;i < len;i++){
        vet[i] = pow(vet[i], 2);
    }
}