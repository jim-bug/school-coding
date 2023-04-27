#include <iostream>
#include <fstream>
#define L 10
using namespace std;
int main(){
    ifstream file_in("navi.txt");
    int mat[L][L];
    int supp;

    for (int i = 0;i < L;i++){
        for (int j = 0;j < L;j++){
            file_in >> supp;
            mat[i][j] = supp;
        }
    }


    return 0;
}