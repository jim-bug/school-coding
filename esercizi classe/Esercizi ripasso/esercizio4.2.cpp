#include <iostream>

using namespace std;
string fun(int);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 10
    int n;
    cout << "Inserisci il numero: ";
    cin >> n;
    cout << "Risultato: " << fun(n) << endl;

    return 0;
}
string fun(int n){
    if (n==1){return "-+";}
    else{return '-' + fun(n-1) + '+';}
}