#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;
int main(){
    // Creare un programma che ricevuto in ingresso un file chiamato “input.txt” crei in uscita un file chiamato “output.txt” formato da tante righe quante sono le lettere dell’alfabeto e per ogni riga viene riportata una lettera e quante volte quella lettera compare nel file “input.txt”.:
    ifstream file;
    ofstream file_ou;
    file.open("input.txt");
    file_ou.open("output.txt");
    int count = 1;
    int y = 0;
    char support[100];
    while(not file.eof()){
        file >> support[y];
        y ++;
    }
    sort(support, support+y);    // ordino dal support(indica l'indirizzo di memoria del primo elemento del vettore) fino a support+len, dove len è la lunghezza effettiva.
    for (int i = 0;i < y;i++){
        if (support[i] == support[i+1]){
            count ++;
        }
        else{
            file_ou << support[i] << "\t" << count << endl;
            count = 1;
        }
    }
    file.close();
    file_ou.close();
    return 0;
}