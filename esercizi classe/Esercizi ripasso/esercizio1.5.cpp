#include <iostream>
using namespace std;
int control(int, int);
int main(){
    // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 12
    int x;
    int y;
    cout << "Inserisci il valore di x:";
    cin >> x;
    cout << "Inserisci il valore di y:";
    cin >> y;
    int r = control(x, y);
    int r1 = control(y, x);
    if(r == r1){
        cout << "Ritorno uguale" << endl;
    }
	return 0;
}
int control(int n, int m){
    int nu;
    if (n >= 0 && m >= 0) {
        nu = m + n;
        while (nu % m != 0) {
            if (nu % 2 == 0) {
                nu = nu + 2;
            } else {
                nu ++;
            }
        }
        return nu;
    }
    else{
        return 0;
    }
}