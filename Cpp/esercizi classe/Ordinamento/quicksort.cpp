#include <iostream>
using namespace std;
int partition(int[], int, int);
void quicksort(int[], int, int);
/*
 * Il quicksort è un algoritmo di ordinamento ricorsivo, ciò significa che la funzione richiama se stessa fino a quando non arriva al caso base o meglio dire fino
 * a quanto non arriva all'ultimo livello.
 * Il quicksort funziona grazie ad una funzione detta partition, questa funzione partition in pratica sceglie un numero "a caso" chiamato pivout, tutti gli elementi
 * minori del pivout saranno sulla sinistra e quelli maggiori saranno sulla destra dell'array questo procedimento lo si fa grazie a due indici:
 * i che partirà sempre di una posizione in meno dall'inizio del vettore e j che partirà di una posizione dopo del vettore, adesso questi indici devono andare avanti
 * finchè non si incontrano o superano da quel punto in poi la funzione partition deve tornare l'indice j(si può fare anche con l'indice i), avendo l'indice j
 * noi sappiamo che dalla posizione 0 fino a quella di j abbiamo un vettore e dalla posizione di j + 1 fino a end abbiamo un altro vettore, quindi la funzione quicksort
 * chiama se stessa fino a quando una di queste chiamate non arriva a lunghezza del vettore 0, così avremo ordinato il vettore.
*/
int main(){
    int n;
    cout << "Inserisci la lunghezza del vettore: ";
    cin >> n;
    int vet[n];
    for (int i = 0;i < n;i++){
        cout << "Inserisci l'elemento alla posizione " << i << ": ";
        cin >> vet[i];
    }

    quicksort(vet, n-n, n);
    for (int i = 0;i < n;i++){
        cout << "Elemento posizione " << i << ": " << vet[i] << endl;
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
