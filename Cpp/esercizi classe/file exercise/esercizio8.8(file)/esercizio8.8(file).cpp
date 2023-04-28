#include <iostream>
#include <fstream>
#include <ctime>
#include <cstdlib>
#define L 10
#define L1 3
int controls(int[]);
using namespace std;
int main(){
    // pag A248 n 27:
    srand(time(0));
    ofstream file_ou("navi.txt");
    ifstream file_hit("colpi.txt");
    int mat[L][L];
    int r;
    int c;
    int colpi = 0;
    int navi_aff = 0;
    int vet[L1];
    int control[L1];
    int value;
    int end = 3;
    int start = 0;
    int supp;
    for (int i = 0;i < L1;i++){
        vet[i] = 0;
    }
    for (int i = 0;i < L;i++){
        for (int j = 0;j < L;j++){
            value = (rand()%(end+1-start)+start);
            control[value-1] ++;
            supp = controls(control);
            if (supp != 0){
                while (value == supp){
                    value = (rand()%(end+1-start)+start);
                }
            }
            mat[i][j] = value;
            file_ou << mat[i][j] << " ";
        }
        file_ou << endl;
    }
    while(file_hit >> r){
        file_hit >> c;
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
    file_ou.close();
    file_hit.close();
    return 0;
}
int controls(int vet[]){
    for (int i = 0;i < L1;i++){
        if (vet[i] == i + 1){
            return vet[i];
        }
    }
    return 0;
}