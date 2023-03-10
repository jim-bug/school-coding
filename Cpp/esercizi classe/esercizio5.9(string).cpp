#include <iostream>
#include <string>
using namespace std;
int main(){
    // esercizio pag A180 n 49:
    string text;
    cout << "Inserisci il testo: ";
    cin >> text;
    int count = 0;
    int j = text.size()-1;
    for (int i = 0;i < text.size()/2;i++){
        if(text[i] == text[j]){
            count ++;
        }
        j --;
    }
    if (count == text.size()/2){
        cout << "PALINDROMO" << endl;
    }
    else{
        cout << "NON PALINDROMO" << endl;
    }

    return 0;
}