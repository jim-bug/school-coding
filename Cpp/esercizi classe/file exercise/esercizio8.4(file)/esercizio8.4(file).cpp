#include <iostream>
#include <fstream>
#include <vector>

using namespace std;
int main(){
    // dato un file numeri.txt contente valori interi e un valore n insertio dall'utente, memorizzi in due file maggiori e minori.txt i numeri maggiori e minori di n:
    int n;
    int supp;
    vector<int> vet;
    ifstream file_in("numeri.txt");
    ofstream file_max("maggiori.txt");
    ofstream file_min("minori.txt");
    cout << "Inserisci il numero: " << endl;
    cin >> n;
    while (not file_in.eof()){
        file_in >> supp;
        vet.push_back(supp);
    }
    for (int i = 0;i < vet.size();i++){
        if (vet[i] > n){
            file_max << vet[i] << endl;
        }
        else{
            file_min << vet[i] << endl;
        }
    }
    file_in.close();
    file_max.close();
    file_min.close();
    return 0;
}