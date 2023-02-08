#include <iostream>
using namespace std;
#define L 10
#define R 2
void sort(int[]);
int main(){
    // Verificare se in un array di interi di 10 posizioni c’è almeno un valore presente nell’array un numero di volte identico al suo valor:
    int numbers[R][L];
    int ln = 1;
    int c = 0;
    int j = 0;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> numbers[0][i];
    }
    sort(numbers[0]);
    for (int i = 0;i < L-1;i++){
        if(numbers[0][i] != numbers[0][i+1]){
            ln ++;
        }
    }
    int v[ln];
    for (int i = 0;i < ln;i++){
        numbers[1][i] = 1;
    }

    for (int i = 0;i < L-1;i++){
        j = j + 1;
        if (numbers[0][i] == numbers[0][j]){
            numbers[1][c] ++;
        }
        else {
            c ++;
        }
    }
    j = 0;
    for (int i = 0;i < L;) {
        i += numbers[1][j];
        j ++;
        numbers[0][j] = numbers[0][i];
    }
    for (int i = 0;i < ln;i++){
        if (numbers[0][i] == numbers[1][i]){
            cout << "Posizione " << i+1 << " ripetuto " << numbers[1][i] << " volte numero: " << numbers[0][i] << endl;
        }
    }
}
void sort(int v[]){
    for (int i = 0;i < L;i++){
        for (int j = 1 + i;j < L;j++)
            if (v[i] > v[j]){
                int temp = v[i];
                v[i] = v[j];
                v[j] = temp;
            }
    }
}