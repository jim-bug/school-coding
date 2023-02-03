#include <iostream>
using namespace std;
#define L 12
int main(){
     // https://ticoprof.wordpress.com/2016/04/26/esercizi-con-gli-array/ es 16
    int sequence[L];
    int j = 2;
    sequence[0] = 0;
    sequence[1] = 1;
    for (int i = 0;i <(L-2);i++){
        sequence[j] = (sequence[j-2]+sequence[j-1]);
        j ++;
    }
    for (int i = 0;i < L;i++){
        cout << "Elemento " << i << " successione di Fibonacci: " << sequence[i] << endl;
    }

    return 0;
}