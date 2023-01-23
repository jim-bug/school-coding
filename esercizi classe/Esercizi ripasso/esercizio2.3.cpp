#include <iostream>
using namespace std;
void stampa(int[], int);
void semi_stamp(int[], int, int);
int main(){
    int n;
    int st;
    int en;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> n;
    int vet[n];
    for (int i = 0;i < n;i++){
        cout << "Inserisci l'elemento alla posizione " << i << " : ";
        cin >> vet[i];
    }
    stampa(vet, n);
    cout << endl << "Inserisci la porzione di vettore che vuoi stampare es(5 10): ";
    cin >> st >> en;
    cout << endl;
    semi_stamp(vet, st, en);
    return 0;
}
void stampa(int v[], int len){
    for (int i = 0;i < len;i++){
        cout << "Elemento posizione " << i << " : " << v[i] << endl;
    }
}
void semi_stamp(int v[], int st, int en){
    for (int i = (st-1);i < (en-1);i++){
        cout << "Elemento posizione " << i << " : " << v[i] << endl;
    }
}