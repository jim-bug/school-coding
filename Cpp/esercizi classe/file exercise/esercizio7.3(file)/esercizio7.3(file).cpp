#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

int main(){
    // Realizzare un programma che ricevuto in ingresso un file chiamato “input.txt” stampa sulla console da quanti caratteri è formato:
    ifstream file;
    file.open("input.txt");
    int count = 0;
    char vet[100];
    while(not file.eof()){
        file >> vet[count];
        count ++;
    }
    file.close();
    cout << "Il file ha " << count << " caratteri." << endl;
    return 0;
}