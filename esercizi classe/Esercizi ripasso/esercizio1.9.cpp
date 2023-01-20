#include <iostream>
using namespace std;
int euc(int, int);
void minimizza(int*, int*);
int main(){
    // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 17
    int num, num1;
    int den, den1;
    cout << "Inserisci la prima frazione: ";
    cin >> num >> den;
    cout << "Inserisci la seconda frazione: ";
    cin >> num1 >> den1;
    minimizza(&num, &den);
    minimizza(&num1, &den1);
    if (den == den1){
        cout << "Le due frazioni hanno lo stesso deniminatore." << endl;
    }
    else{
        cout << "Le due frazioni non hanno lo stesso denominatore." << endl;
    }
    cout << "Frazione 1: " << num << "/" << den << endl << "Frazione 2: " << num1 << "/" << den1 << endl;
    return 0;
}
int euc(int x, int y){
    int r;
    if (x == 0){
        return y;
    }
    else{
        while (y != 0){
            r = x % y;
            x = y;
            y = r;
        }
        return x;
    }
}
void minimizza(int *num, int *den){
    int mcd;
    mcd = euc(*num, *den);
    if (*num % mcd == 0 && *den % mcd == 0){
        *num = *num/mcd;
        *den = *den/mcd;
    }
}