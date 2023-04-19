#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // Scrivere un programma che unisce quanto presente nei file “file1.txt” e “file2.txt” nel file “unione.txt”:
    ifstream file;
    ifstream file_1;
    fstream file_2;
    char supp;  // carattere di supporto, conterrà ogni carattere dei due file.
    file.open("file1.txt");
    file_1.open("file2.txt");
    file_2.open("unione.txt", ios::out);
    file_2.close();
    file_2.open("unione.txt", ios::app);
    while (not file.eof()){
        file >> supp;
        file_2 << supp;
    }
    while (not file_1.eof()){
        file_1 >> supp;
        file_2 << supp;
    }
    file.close();
    file_1.close();
    file_2.close();
    return 0;
}