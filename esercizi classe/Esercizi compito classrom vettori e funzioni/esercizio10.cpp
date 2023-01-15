#include <iostream>
using namespace std;
void sorting(int[], int);
void sorting1(int[][100], int, int);
int main(){
    int r;
    int c;
    cout << "Inserisci le righe: ";
    cin >> r;
    cout << "Inserisci le colonne: ";
    cin >> c;
    int matrix[r][c];
    sorting1(matrix, r, c);
    for (int i = 0;i < r;i++){
        for (int j = 0;j < c;j++){
            cout << "Inserisci il valore alla riga " << i << " e alla colonna " << j << " : ";
            cin >> matrix[i][j];
            cout << endl;
        }
    }
    for (int i = 0;i < r;i++){
        sorting(matrix[i], c);
    }
    for (int i = 0;i < r;i++){
        for (int j = 0;j < c;j++){
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}
void sorting(int vet[], int len){
    for (int i = 0;i < len;i++){
        for (int j = i + 1;j < len;j++){
            if (vet[i] > vet[j]){
                int temp = vet[i];
                vet[i] = vet[j];
                vet[j] = temp;
            }
        }
    }
}
void sorting1(int mat[][100], int r, int c){
    for (int i = 0;i < c;i++){ // ci vuole un ulteriore ciclo perchè ci serve tenere fermo il valore di ogni cella per k volte in modo da confrontare tutte le possibili coppie delle celle.
        for(int j = 0;j < r;j++){
            for (int k = j + 1;k < r;k++) {
                if (mat[j][i] > mat[k][i]) {
                    int temp = mat[j][i];
                    mat[j][i] = mat[k][i];
                    mat[k][i] = temp;
                }
            }
        }
    }
}
