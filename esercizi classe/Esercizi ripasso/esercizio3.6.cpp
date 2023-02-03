#include <iostream>
#include <cmath>
using namespace std;

int fun(int);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 5
    int n;
    cout << "Inserisci il valore di n: ";
    cin >> n;
    cout << "Risultato: " << fun(n) << endl;
    return 0;
}
int fun(int num){
    if (num < 10){return 0;}
    else if (num%10 == (num/10)%10){return 1+fun(num/10);}
    else{return 0+fun(num/10);}
}
