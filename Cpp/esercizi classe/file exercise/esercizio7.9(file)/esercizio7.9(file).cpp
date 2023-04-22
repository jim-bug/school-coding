#include <iostream>
#include <fstream>

using namespace std;
int main(){
    // Scrivere un programma che prende in input un file “ciao.txt” e crea due file chiamati “consonanti.txt” e “vocali.txt” in cui ci sono rispettivamente solo le consonanti o le vocali presenti nel file “ciao.txt”:
    ifstream file("ciao.txt");
    ofstream file_1("consonanti.txt");
    ofstream file_2("vocali.txt");
    char car;
    while (not file.eof()){
        file >> car;
        if (car == 'A' or car == 'a' or car == 'E' or car == 'e' or car == 'I' or car == 'i' or car == 'O' or car == 'o' or car == 'U' or car == 'u'){
            file_2 << car;
        }
        else{
            file_1 << car;
        }
    }
    return 0;
}