#include <iostream>
using namespace std;
void readvet(int[], int);
int confronto(int[], int[], int);
int main(){
    int n;
    cout << "Inserisci la lunghezza dei 3 vettori: ";
    cin >> n;
    int a[n];
    int b[n];
    int c[n];
    readvet(a, n);
    readvet(b, n);
    readvet(c, n);
    if (confronto(a, b, n)){
        cout << "I vettori a e b sono uguali" << endl;
    }
    else if (confronto(a, c, n)){
        cout << "I vettori a e c sono uguali" << endl;
    }
    else if (confronto(b, c, n)){
        cout << "I vettori b e c sono uguali" << endl;
    }
    else{
        cout << "Nessuno dei vettori dati in input sono uguali" << endl;
    }

    return 0;
}
void readvet(int v[], int l){
    for (int i = 0;i < l;i++){
        cout << "Inserisci l'elemento alla posizione " << i << " : ";
        cin >> v[i];
    }
}
int confronto(int v[], int v1[], int l){
    int control = 0;
    for (int i = 0;i < l;i++){
        if (v[i] == v1[i]){
            control ++;
        }
    }
    if (control == l){
        return 1;
    }
    else{
        return 0;
    }
}