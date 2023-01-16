#include <iostream>
using namespace std;
#define L 3
int verifica(char);
int main(){
    // // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/
    char vet[L];
    for (int i = 0;i < L;i++){
        cout << "Inserisci il primo carattere: " << endl;
        cin >> vet[i];
    }
    for (int i = 0;i < L;i++){
        if (verifica(vet[i])){
            cout << "Maiuscolo: " << vet[i] << endl;
        }
        else{
            cout << "Minuscolo: " << vet[i] << endl;
        }
    }
    return 0;
}
int verifica(char a){
    if ((int)a >= 65 && (int) a < 97){
        return 1;
    }
    else{
        return 0;
    }
}