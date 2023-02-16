#include <iostream>
using namespace std;

int main(){
    // Inserisci un numero da tastiera il programma restituisce in output di quante cifre è composto il numero:

    int num;
    cout << "Inserisci il numero: ";
    cin >> num;
    int count = 0;
    while (num != 0){
        num /= 10;
        count ++;
    }
    cout << "Il numero di cifre del numero " << num << " sono : " << count << endl;

    return 0;
}
