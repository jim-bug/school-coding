#include <iostream>
#include <algorithm>
using namespace std;
int main(){
    // RICERCA BINARIA:

    int start = 0;
    int end;
    int k;
    bool result = false;
    int centre;
    cout << "Inserisci il valore che vuoi ricercare all'interno del vettore: " << endl;
    cin >> k;
    cout << "Inserisci la lunghezza del vettore: " << endl;
    cin >> end;
	int vet[end];
    for (int i = 0;i < end;i++) {
        cout << "Inserisci il valore alla posizioe " << i << ": " << endl;
        cin >> vet[i];
    }
    sort(vet, vet+end);

    while (start <= end){
        centre = (start+end)/2;
        if (k > vet[centre]){
            start = centre+1;
        }
        else if (k < vet[centre]){
            end = centre-1;
        }
        else if (k == vet[centre]){
            result = true;
            break;
        }
    }
    if (result){
        cout << "Il valore " << k << " c'è!" << endl;
    }
    else{
        cout << "Il valore " << k << " non c'è!" << endl;
    }

	return 0;
}
bool fun(int vet[], int start, int end, int k){
    if (start > end){
        return -1;
    }
    int centro = (start+end)/2;
    if (vet[centro] == k){
        return centro;
    }
}