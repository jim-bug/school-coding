#include <iostream>
#define L 10
using namespace std;
bool control(int[], int, int, int);
int main(){
    int vet[L];
    for (int i = 0;i < L;i++){
        cout << "Inserisci il valore all posizione " << i << " : ";
        cin >> vet[i];
    }
    for (int i = 0;i < L;i++){
        if (control(vet, 0, i, vet[i])){
            cout << "Il valore è " << vet[i] << endl;
        }
    }

    return 0;
}
bool control(int arr[], int start, int end, int value){
    int sum = 0;
    for (int i = start; start < end;i ++){
        sum += arr[i];
    }
    if (value < sum){return true;}
    else{return false;}
}