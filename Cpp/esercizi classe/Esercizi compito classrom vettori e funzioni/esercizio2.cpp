#include <iostream>
using namespace std;
#define L 10
int main(){
    // leggere un array di interi di 10 posizioni e verificare se è palindromo.
    int vector[L];
    int y = (L-1);
    int control = -1;
    for (int i = 0;i < L;i++){
        cout << "Inserisci l'elemento alla posizione " << i << " : " << endl;
        cin >> vector[i];
    }
    for (int i = 0; i < L;i++){
        if (vector[i] == vector[y]){
            control ++;
        }
        y --;
    }
    if (control == (L-1)){
        cout << "è palindromo";
    }
    return 0;
}