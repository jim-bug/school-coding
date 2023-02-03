#include <iostream>

using namespace std;
int fun(int);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 4
    int n;
    cout << "Inserisci il numero: ";
    cin >> n;
    cout << "Risultato: " << fun(n) << endl;
    return 0;
}
int fun(int num){
    if (num < 10){return num;}
    else if (num % 2 == 0){
        int sum = 0;
        while (num != 0){
            sum += num%10;
            num/=10;
        }
        return fun(sum);
    }
    else {return fun(num-1);}
}