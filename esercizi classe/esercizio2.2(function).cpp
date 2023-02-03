#include <iostream>
using namespace std;
void aumenta(int[], int);
int main(){
    // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 6
    int n;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> n;
    int vet[n];
    for (int i = 0;i < n;i++){
        cout << "Inserisci il valore alla posizione " << i << " : ";
        cin >> vet[i];
    }
    aumenta(vet, n);
    for (int i = 0;i < n;i++){
        cout << "Elemento posizione " << i << " : " << vet[i] << endl;
    }
    return 0;
}
void aumenta(int v[], int len){
    int min;
    int pos = 0;
    for (int i = 0;i < len;i++){
        if (v[i] < min){
            min = v[i];
            pos = i;
        }
    }
    v[pos] = v[pos]+10;
}