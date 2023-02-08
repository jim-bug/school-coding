#include <iostream>
using namespace std;
void azzera(int[], int);
int main(){
    // Ignazio
    // scrivere un programma che preso in input una matrice di dimensione n per n e un numero k restituisca tutte le coppie di righe che presentano lo stesso numero di occorenze di k
    int n;
    int k;
    cout << "Inserisci n: ";
    cin >> n;
    cout << "Inserisci k: ";
    cin >> k;
    int mat[n][n];
    int supp[n];
    azzera(supp, n);
    for (int i = 0;i < n;i++){
        for (int j = 0;j < n;j++){
            cout << "Inserisci il numero alla riga " << i << " e alla colonna " << j << " : ";
            cin >> mat[i][j];
            if (mat[i][j] == k){
                supp[i] ++;
            }
        }
    }

    for (int i = 0;i < n;i++){
        for (int j = i + 1;j < n;j++){
            if (supp[i] == supp[j]){
                cout << "(" << i << ", " << j << ")" << endl;
            }
        }
    }
    return 0;

}
void azzera(int vet[], int len){
    for (int i = 0;i < len;i++){
        vet[i] = 0;
    }
}