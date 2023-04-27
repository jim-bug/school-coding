#include <iostream>
#include <fstream>

using namespace std;
int main() {
    // dato un file testo.txt e una parola acquisita dallo standard input, ricercare la parola all'interno del file e visualizzarne il numero delle occorrenze della parola nel file(pag A248 n 25):
    string word;
    string test;
    string file;
    int occo;
    int j = 0;
    char supp;
    ifstream file_in("testo.txt");
    cout << "Inserisci la parola da cercare: " << endl;
    cin >> word;
    while (not file_in.eof()){
        file_in >> supp;
        file.push_back(supp);
    }
    for (int i = 0;i < file.size();i++){
        if (j == word.size()){
            j = 0;
        }
        if (word[j] == file[i]){
            test.push_back(file[i]);
            j ++;
        }
        else{
            if (test == word){
                occo ++;
                test.clear();
            }
        }
    }
    cout << occo << endl;
    file_in.close();
    return 0;
}