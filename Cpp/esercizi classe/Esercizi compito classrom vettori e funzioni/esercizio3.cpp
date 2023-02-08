#include <iostream>
#include <vector>
using namespace std;
#define L 10
#define R 2
void sort(int[]);
int main(){
    // Leggere un array di interi di 10 posizioni e stampare il numero che compare più volte all’interno dell’array, qualora ci siano più numeri che compaiano lo stesso numero di volte stamparli tutti.
    int numbers[R][L];
    int num = 1;
    int c = 0;
    int j = -1;
    for (int i = 0;i < L;i++){
        cout << "Inserisci il numero alla posizione " << i << " : ";
        cin >> numbers[0][i];
    }
    sort(numbers[0]);
    for (int i = 0;i < L-1;i++){
        if(numbers[0][i] != numbers[0][i+1]){
            num ++;
        }
    }
    for (int i = 0;i < num;i++){
        numbers[1][i] = 1;
    }
    int v[num];
    for (int i = 0;i < L;i++){
        j = i + 1;
        if (numbers[0][i] == numbers[0][j]){
            numbers[1][c] ++;
            // v.erase(v.begin()+i);
        }
        else{
            c ++;
        }
        // j ++;
    }
    v[0] = numbers[0][0];
    j = 0;
    int temp = numbers[1][0];
    for (int i = 0;i < L;){
        i += numbers[1][j];
        j ++;
        v[j] = numbers[0][i];
        // j ++;
    }

    for (int i = 0;i < L;i++){
        if (numbers[1][i] > temp){
            temp = numbers[1][i];
        }
    }
    for (int i = 0;i < L;i++){
        if(numbers[1][i] == temp){
            cout << v[i] << " ";
        }
    }
    return 0;
}
void sort(int v[]){
    for (int i = 0;i < L;i++){
        for(int j = 1+i;j < L;j++){
            if (v[i] > v[j]){
                int temp = v[i];
                v[i] = v[j];
                v[j] = temp;
            }
        }
    }
}