#include <iostream>
using namespace std;
int sum(int, int);
int main(){
    // n numeri della successione di Fibonacci

    int n;
    int j = 2;
    cout << "Inserisci la lunghezza della successione di Fibonacci: ";
    cin >> n;
    int succ[n];
    succ[0] = 0;
    succ[1] = 1;
    for (int i = 0;i < n-2;i++){
        succ[j] = sum(succ[j-1], succ[j-2]);
        j ++;
    }
    for (int i = 0;i < n;i++) {
        cout << succ[i] << " ";
    }
}
int sum(int a , int b){
    return a + b;
}