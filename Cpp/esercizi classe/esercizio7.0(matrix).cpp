#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(){
    // ordinare una matrice:

    int r;  // righe
    int c;  // colonne
    int index = 0;
    vector<int> supporto;
    cout << "Inserisci il numero di righe della matrice: ";
    cin >> r;
    cout << "Inserisci il numero di colonne della matrice: ";
    cin >> c;
    int matrice[r][c];

    for (int i = 0;i < r;i++){
        for (int j = 0;j < c;j++){
            cout << "Inserisci il valore della colonna " << j << " e della riga " << i << " :";
            cin >> matrice[i][j];
        }
    }

    for (int i = 0;i < r;i++){
        for (int j = 0; j < c;j++){
            supporto.push_back(matrice[i][j]);
        }
    }
    sort(supporto.begin(), supporto.end());

    for (int i = 0; i < r;i++){
        for (int j = 0;j < c;j++){
            matrice[i][j] = supporto[index];
            index ++;
        }
    }

    for (int i = 0;i < r;i++){
        for (int j = 0;j < c;j++){
            cout << matrice[i][j] << " ";
        }
        cout << endl;
    }

    return 0;
}