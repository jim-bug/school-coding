#include <iostream>
using namespace std;
#define N 10
int media_matrix(int[][100]);
int mediana_matrix(int[][100]);
int main(){
    int mat[N][N];
    for (int i = 0;i < N;i++){
        for (int j = 0;j < N;j++){
            cout << "Inserisci il numero alla riga " << i << " e alla colonna " << j << endl;
            cin >> mat[i][j];
        }
    }   

    return 0;
}