#include <iostream>
using namespace std;
#define L 10
int main() {
    //
    int vet[L];
    int count = 1;

    for (int i = 0;i < L;){
        for (int j = i + 1;j < L;j++){
            if (vet[i] == vet[j]){
                count ++;
            }
        }
        if (count == 1){cout << vet[i] << " "; i ++;}
        else{i += count;}
        count = 1;
    }

    return 0;
}
