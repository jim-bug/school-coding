#include <iostream>
#define L 10
using namespace std;
int partition(int[], int, int);
void quicksort(int[], int, int);
int main(){
    // Verificare se in un array di interi di 10 posizioni c'è almeno un valore presente
    //nell'array un numero di valore identico al suo valore
	int vet[L];
    int count = 1; // c'è sempre una cifra
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> vet[i];
    }
    quicksort(vet, L-L, L-1);
    vet[L] = 0; // così posso anche verificare l'ultimo elemento del vettore.
    for (int i = 0;i < L;i++){
        if (vet[i] == vet[i+1]){
            count ++;
        }
        else if (vet[i] == count){
            count = 1;
            cout << "Numero che si ripete lo stesso numero di volte: " << vet[i] << endl;
        }
    }
	return 0;
}
int partition(int arr[], int start, int end){
    int pivout = arr[start];
    int i = start-1;
    int j = end+1;
    while (i < j){
        do{i++;}
        while(arr[i] < pivout);
        //
        do{j --;}
        while (arr[j] > pivout);
        if (i<j){int temp = arr[i];arr[i] = arr[j];arr[j] = temp;}
        // else{break;}
    }
    return j;
}
void quicksort(int arr[], int start, int end){
    if (start < end){
        int position = partition(arr, start, end);
        // ordina da sinistra a position
        quicksort(arr, start, position);
        // ordina da position + 1 a end
        quicksort(arr, position+1, end);
    }
}