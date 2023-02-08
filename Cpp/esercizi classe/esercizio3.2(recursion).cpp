#include <iostream>
using namespace std;
int fun(int, int);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 1
    int m;
    int n;
    cout << "Inserisci il valore di m: ";
    cin >> m;
    cout << "Inserisci il valore di n: ";
    cin >> n;
    cout << "Risultato: " << fun(n, m) << endl;
    return 0;
}
int fun(int n, int m){  // sum
    if (m == 0){return n;}
    else if (m > 0){return 1+fun(n, m-1);}
}