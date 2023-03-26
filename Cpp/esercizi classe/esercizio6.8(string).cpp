#include <iostream>

using namespace std;
int count_world(string);
int main(){
    // Esercizio pag A181 n 57
    string s1;
    cout << "Inserisci la stringa: " << endl;
    getline(cin, s1);
    cout << "Il numero di parole comparso nella stringa: " << s1 << " sono: " << count_world(s1) << endl;
}
int count_world(string s1){
    int count = 1;  // almeno una parola c'è
    for (int i = 0;i < s1.size();i++){
        if (s1[i] == ' ' or s1[i] == ',' or s1[i] == '.'){
            count ++;
        }
    }
    return count;
}