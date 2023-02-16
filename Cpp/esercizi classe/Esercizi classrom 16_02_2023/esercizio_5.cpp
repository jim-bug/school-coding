#include <iostream>
#include <vector>
using namespace std;
void print_array(vector<int>);
int main(){
    // Scrivi un programma che legge un numero positivo in ingresso inferiore a 10.000 e
    //calcoli i suoi divisori memorizzandoli in un array. Infine visualizza il vettore calcolato:
	int num;
    vector<int> result; // utilizzo la lista perchè non so il numero di divisori precisi, quindi non so di quanto dichiarare la lunghezza dell'array.
    cout << "Inserisci un numero inferiore di 10000: " << endl;
    cin >> num;
    while (num > 10000){
        cout << "Reinserisci il numero, perche deve essere minore di 10000: ";
        cin >> num;
    }
    for (int i = 1;i < (num/2);i++){
        if (num%i==0){
            result.push_back(i);
        }
    }
    result.push_back(num); // così i divisori saranno in ordine crescente

    print_array(result);
	return 0;
}
void print_array(vector<int> list){
    for (int i = 0;i < list.size();i++){
        cout << "Elemento posizione " << i << " : " << list[i] << endl;
    }
}