#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // dato un file di testo testo.txt contenente stringhe di caratteri, creare un file di testo maiuscolo.txt che contenga lo stesso testo trasformato in maiuscolo(pag A248 n 26):
    ifstream file_in("testo.txt");
    ofstream file_ou("maiuscolo.txt");
    string file;
    char supp;
    while (not file_in.eof()){
        file_in >> supp;
        file.push_back(supp);
    }
    for (int i = 0;i < file.size();i++){
        if (int(file[i]) >= 65 and int(file[i]) <= 90){
            file_ou << file[i];
        }
        else{
            file_ou << char(int(file[i])-32);
        }
    }
    file_in.close();
    file_ou.close();
    return 0;
}