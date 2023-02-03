#include <iostream>
using namespace std;
int max(int[], int);
int min(int[], int);
void swaps(int[], int, int, int);
int main(){
    // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 1
    int n;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> n;
    int v[n];
    for (int i = 0;i < n;i++){
        cout <<"Inserisci il numero alla posizione " << i << " : ";
        cin >> v[i];
    }
    swaps(v, n, max(v, n), min(v, n));
    for (int i = 0;i < n;i++){
        cout << "Elemento posizione " << i << " : " << v[i] << endl;
    }
    return 0;
}
int max(int vet[], int len){
    int max = vet[0];
    int pos = 0;
    for (int i = 0;i < len;i++){
        if (vet[i] > max){
            max = vet[i];
            pos = i;
        }
    }
    return pos;
}
int min(int vet[], int len){
    int min = vet[0];
    int pos1 = 0;
    for (int i = 0;i < len;i++){
        if (vet[i] < min){
            min = vet[i];
            pos1 = i;
        }
    }
    return pos1;
}
void swaps(int vet[], int len, int pos, int pos1){
    int temp;
    temp = vet[pos];
    vet[pos] = vet[pos1];
    vet[pos1] = temp;
}