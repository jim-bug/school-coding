#include <iostream>
#include <string>
using namespace std;
string cript(string, int[], int);
string decript(string, int[], int);
int main(){
    // Data una stringa, scrivere due funzione di criptazione e decriptazione che alla base dell'algoritmo di Cesare cripti e decripti la stringa in base a una sequenza di numeri.
	string s1;
    int n;
    cout << "Inserisci la dimensione della sequenza dei numeri: " << endl;
    cin >> n;
    cout << "Inserisci la stringa: " << endl;
    cin >> s1;
    int vet[n];
    for (int i = 0;i < n;i++){
        cout << "Inserisci il numero alla posizione " << i << ": " <<endl;
        cin >> vet[i];
    }
    cout << "Stringa criptata: " << cript(s1, vet, n) << endl;
    cout << "Stringa decriptata: " << decript(cript(s1, vet, n), vet, n) << endl;
	return 0;
}
string cript(string s1, int sequence[], int len){
        string result;
        for (int i = 0; i < s1.size();) {
            for (int j = 0; (i<s1.size() && j < len); j++) {
                result.push_back(char(int(s1[i]) + sequence[j]));
                i++;
            }
        }
        return result;
}

string decript(string s1, int sequence[], int len){
        string result;
        for (int i = 0; i < s1.size();) {
            for (int j = 0; (i<s1.size() && j < len); j++) {
                result.push_back(char(int(s1[i]) - sequence[j]));
                i++;
            }
        }
        return result;
}