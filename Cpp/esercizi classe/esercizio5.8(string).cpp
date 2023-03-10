#include <iostream>
#include <string>
using namespace std;
string conversion(string);
int main(){
    // esercizio pag A180 n 47:
    int v = 0;
    int c = 0;
    string text;
    cout << "Inserisci il testo: ";
    cin >> text;
    text = conversion(text);
    for (int i = 0;i < text.size();i++){
        if (text[i] == 'a' or text[i] == 'e' or text[i] == 'i' or text[i] == 'o' or text[i] == 'u'){
            v ++;
        }
        else{
            c ++;
        }
    }
    cout << "Nella stringa " << text << " ci sono " << v << " vocali e " << c << " consonsanti." << endl;
    return 0;
}
string conversion(string test){
    for (int i = 0;i < test.size();i++){
        if (int(test[i]) >= 65 and int(test[i]) <= 90) {
            test[i] = char(int(test[i]) + 32);
        }
    }
    return test;
}