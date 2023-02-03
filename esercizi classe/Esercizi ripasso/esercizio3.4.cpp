#include <iostream>
using namespace std;
int fun(int);
int main(){
    int n;
    cout << "Inserisci il numero: ";
    cin >> n;
    cout << "Il risultato e: " << fun(n) << endl;
    return 0;
}
int fun(int num){
    if (num % 2 != 0 || num == 0){return 0;}
    else{return 1+fun(num/2);}
}