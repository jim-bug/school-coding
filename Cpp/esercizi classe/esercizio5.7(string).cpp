#include <iostream>
#include <string>
#include <vector>
#include "algorithm"
using namespace std;
int max(vector<int>);
int main(){
    // esercizio pag A180 n 46
    string text;
    vector<int> car;
    vector<int>maxi;
    int count = 1;
    cout << "Inserisci una stringa: ";
    cin >> text;
    sort(text.begin(), text.end());
    for (int i = 0;i < text.size();i++){
        if (text[i] == text[i+1]){
            count ++;
        }
        else{
            car.push_back(text[i]);
            maxi.push_back(count);
            count = 1;
        }
    }
    cout << "Il carattere che si ripete piu volte e " << char(car[max(maxi)]) << endl;
}
int max(vector<int> list){
    int max = list[0];
    int pos;
    for (int i = 0;i < list.size();i++){
        if (list[i] > max){
            max = list[i];
            pos = i;
        }
    }
    return pos;
}