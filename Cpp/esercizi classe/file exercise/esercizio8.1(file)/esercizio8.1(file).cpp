#include <iostream>
#include <fstream>

using namespace std;
int main(){
    /*
    * Creare un programma che legge in ingresso un file chiamato “input.txt” e crea in uscita un file chiamato “output.txt” tali che:
    * – input.txt: è formato da numeri interi separati da spazi, il primo numero in input.txt indica da quanti numeri interi sarà seguito nel file input.txt; (si ricorda che per leggere numeri e non cifre è meglio usare fin>>variabile).
    * – output.txt: è formato da numeri interi separati da spazi, in cui il primo numero indica quanti altri numeri ci saranno e gli altri numeri sono gli stessi presenti in input.txt ma ordinati in ordine crescente:
    */
    ifstream file_in("input.txt");
    ofstream file_ou("output.txt");
    int len;
    int i = 0;
    file_in >> len;
    int vet[len];
    while (not file_in.eof()){
        file_in >> vet[i];
        i ++;
    }
    for (int i = 0;i < len;i++){
        for (int j = i + 1;j < len;j++){
            if (vet[i] > vet[i+1]){
                int temp = vet[i];
                vet[i] = vet[i+1];
                vet[i+1] = temp;
            }
        }
    }
    vet[0] = len;
    for (int i = 0;i < len;i++){
        file_ou << vet[i] << " ";
    }
    file_in.close();
    file_ou.close();
    return 0;
}