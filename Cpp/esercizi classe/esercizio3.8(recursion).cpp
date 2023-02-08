#include <iostream>

using namespace std;
int fun(int, int);
void swap(int*, int*);
int main(){
    // https://ticoprof.wordpress.com/2019/12/12/esercizi-sulla-ricorsione/ es 9
    int x;
    int y;
    cout << "Inserisci il valore di x: ";
    cin >> x;
    cout << "Inserisci il valore di y: ";
    cin >> y;
    if (x > y){swap(&y, &x);}
    cout << "Risultato: " << fun(x, y) << endl;
    return 0;
}
int fun(int y, int x){
    if(y==x){return x;}
    else{return fun(y+1, x)+y;}
}
void swap(int *x, int *y){
    int temp = *x;
    *x = *y;
    *y = temp;
}