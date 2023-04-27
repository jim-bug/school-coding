#include <iostream>
#include <fstream>
#define L 10
#define L1 3
using namespace std;
int main(){
    // pag A248 n 27:

    ifstream file_in("navi.txt");
    ifstream file_hit("colpi.txt");
    ifstream file_hit_1("colpi.txt");
    int mat[L][L];
    int supp;
    int len;
    int r;
    int c;
    int colpi = 0;
    int navi_aff = 0;
    int vet[L1];
    for (int i = 0;i < L1;i++){
        vet[i] = 0;
    }
    for (int i = 0;i < L;i++){
        for (int j = 0;j < L;j++){
            file_in >> supp;
            mat[i][j] = supp;
        }
    }
    while (not file_hit.eof()){
        file_hit >> supp;
        len ++;
    }
    len /= 2;   // ricavo il numero di colpi
    for (int i = 0;i < len;i++){
        file_hit_1 >> r;
        file_hit_1 >> c;
        if (mat[r][c] >= 1 and mat[r][c] <= 3){
            colpi ++;
            vet[mat[r][c]-1] ++;
        }
    }
    for (int i = 0;i < L1;i++){
        if (vet[i] == i+1){
            navi_aff ++;
        }
    }
    cout << "Colpi: " << colpi << endl << "Navi affondate: " << navi_aff << endl;
    file_in.close();
    file_hit.close();
    file_hit_1.close();
    return 0;
}