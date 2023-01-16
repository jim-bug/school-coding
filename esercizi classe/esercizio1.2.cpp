#include <iostream>
using namespace std;
int sum_prod(int, int);
int main(){
    // // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/
    int a;
    int b;
    int result;
    cout << "Inserisci il valore di a: ";
    cin >> a;
    cout << "Inserisci il valore di b: ";
    cin >> b;
    result = sum_prod(a, b);
    cout << "Risultato funzione: " << result;

    return 0;
}
int sum_prod(int a, int b){
    int somma;
    int moltiplicazione;
    int result;
    somma = a + b;
    moltiplicazione = a * b;
    result = somma - moltiplicazione;
    return result;
}