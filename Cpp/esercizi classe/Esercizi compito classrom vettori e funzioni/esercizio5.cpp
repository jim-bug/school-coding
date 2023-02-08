#include <iostream>
#include <string>
using namespace std;
int function(string);
int main(){
    /*
    Scrivere una funzione che, ricevuto un numero intero, se questo è naturale calcola quante
    cifre al suo interno sono pari, se non è naturale restituisce zero.
    Scrivere un programma che stampi il risultato dell’applicazione della funzione a due numeri
    interi inseriti dall’utente e poi la riapplichi alla somma dei risultati dell’applicazione della
    funzione:
     */

    int a;
    int b;
    int somma;
    cout << "Inserisci il valore di a: ";
    cin >> a;
    cout << "Inserisci il valore di b: ";
    cin >> b;
    somma = a + b;
    int ca;
    int cb;
    int cs;
    ca = function(to_string(a));
    cb = function(to_string(b));
    cs = function(to_string(somma));

    cout << "Numero di cifre pari in a: " << ca << endl << "Numero di cifre pari in b: " << cb << endl << "Numero di cife pari nella somma di a e b: " << cs << endl;
    return 0;
}
int function(string x){
    int len = x.length();
    int count = 0;
    if (x[0] != '-') {
        for (int i = 0; i < len; i++) {
            if (((int) x[i] - 48) % 2 == 0) {
                count ++;
            }
        }
        return count;
    }
    else{
        return 0;
    }

}