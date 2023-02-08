#include <iostream>
using namespace std;

int fun(int);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 2
    int n;
    cout << "Inserisci il numero: ";
    cin >> n;
    cout << "Risultato: " << fun(n); << endl;
    return 0;
}
int fun(int num){
    int sum = 0;
    while (num != 0){
        sum += num%10;
        num/=10;
    }
    if (sum < 10){return sum;}
    else{return fun(sum);}
}