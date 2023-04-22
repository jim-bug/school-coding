#include <iostream>
#include <fstream>

using namespace std;

int main(){
    // Scrivere un programma che prende in input un file “input.txt” e lo scrive in output sul file “ouput.txt” invertendo minuscole e maiuscole.
    ifstream file("input.txt");
    ofstream file_1("output.txt");
    char supp;
    while (not file.eof()){
        file >> supp;
        if (int(supp) >= 65 and int(supp) <= 90){
            supp = char(int(supp)+32);
            file_1 << supp;
        }
        else if (int(supp) >= 97 and int(supp) <= 122){
            supp = char(int(supp)-32);
            file_1 << supp;
        }
        else{
            file_1 << supp;
        }
    }
    file.close();
    file_1.close();
    return 0;
}