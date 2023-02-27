#include <iostream>
using namespace std;

int main(){
    // esercizio 29 -> https://www.sitoserio.it/esercizi-c-cpp
    string sentence;
    int count = 0;
    cout << "Inserisci la frase: ";
    cin >> sentence;
    for (int i = 0;i < sentence.size();i++){
        switch ((int)sentence[i]){
            case 65: case 97:
                count ++;
                break;
            case 69: case 101:
                count ++;
                break;
            case 73: case 105:
                count ++;
                break;
            case 79: case 111:
                count ++;
                break;
            case 85: case 117:
                count ++;
                break;
            default:
                break;
        }
    }

    cout << "La frase " << sentence << " ha " << count << " vocali";
    return 0;
}
