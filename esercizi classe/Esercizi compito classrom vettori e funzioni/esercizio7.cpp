#include <iostream>
#include <vector>
using namespace std;
void max(int);
int main(){
    int num;
    cout << "Inserisci il numero: ";
    cin >> num;
    max(num);
}
void max(int x){
    int div;
    vector <int> vet;
    div = 2;
    int count = 0;
    while (x > 1){
        if (x % div == 0){
            vet.push_back(div);
            x = (int)x / div;
        }
        else{
            div ++;
        }

    }
    cout << endl;
    int max = vet[0];
    for (int i = 0;i < vet.size();i++){
        if (vet[i] > max){
            max = vet[i];
        }
        if (i == vet.size()-1){
            for (int i = 0;i < vet.size();i++){
                if (vet[i] == max){
                    count ++;
                }
            }
        }
    }
    for (int j = 0;j < vet.size();j++){
        cout << "Fattore "  << j+1 << " : " << vet[j] << endl;
    }
    cout << "Fattore massimo: " << max << endl << "Ripetuto: " << count << " volte." << endl;


}