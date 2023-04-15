#include <iostream>
#include <fstream>
#define L 10
using namespace std;
int main(){
    // Estrarre da un file un vettore di 10 posizioni e fare il reverse di esso:
    ifstream file;
    file.open("vettore.CSV");
    int vet[L];
    int i = 0;
    while(not file.eof()){
        file >> vet[i];
        i ++;
    }
    for (int i = (L-1);i >= 0; i --){
        cout << "Elemento posizione: " << i << ": " << vet[i] << endl;
    }
    file.close();
    return 0;
}