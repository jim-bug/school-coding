#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;
int main(){
    // a partire da un file sequenziale Alfa.txt, contentente un insieme di numeri interi ordinato in modo crescente, e da un valore n inserito dall'utente, creare un nuovo file Beta.txt contenente l'insieme dei dati di Alfa.txt più il valore n, in modo che anch'esso risulti ordinato in modo crescente(pag A248 n 24):
    int n;
    int supp;
    vector<int> vet;
    ifstream file_in("alfa.txt");
    ofstream file_ou("beta.txt");
    cout << "Inserisci n: " << endl;
    cin >> n;
    vet.push_back(n);
    while (not file_in.eof()){
        file_in >> supp;
        vet.push_back(supp);
    }
    sort(vet.begin(), vet.end());
    for (int i = 0;i < vet.size();i++){
        file_ou << vet[i] << endl;
    }
    file_in.close();
    file_ou.close();
    return 0;
}