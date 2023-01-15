#include <iostream>
using namespace std;
void swapping(int*, int*);
int main(){
    // Scrivere una funzione che prende in input una coppia di variabili intere a e b e che se a > b scambi i loro valori
    int a;
    int b;
    cout << "Inserisci il primo valore: ";
    cin >> a;
    cout << "Inserisci il secondo valore: ";
    cin >> b;
    if (a > b){
        swapping(&a, &b);
        cout << "Valore di a: " << a << endl << "Valore di b: " << b << endl;
    }
    return 0;
}
void swapping(int *x, int *y){
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}