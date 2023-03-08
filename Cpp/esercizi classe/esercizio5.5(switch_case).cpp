#include <iostream>
using namespace std;
int main(){
    int g;
    int m;
    int a;
    cout << "Inserisci il giorno: ";
    cin >> g;
    cout << "Inserisci il mese: ";
    cin >> m;
    cout << "Inserisic l'anno: ";
    cin >> a;
    if (a >= 1800 && a <= 2023){
        switch (m) {
        case 9: case 4: case 11: case 6:
            if (m >= 1 && m <= 30){
                cout << "DATA VALIDA" << endl;
                break;
            }
            else{
                cout << "DATA NON VALIDA" << endl;
            }
            break;
            case 5: case 7: case 8: case 10: case 3: case 1: case 12:
                if (m >= 1 && m <= 30){
                    cout << "DATA VALIDA"  << endl;
                }
                else{
                    cout << "DATA NON VALIDA" << endl;
                }
                break;
            default:
                if (m >= 1 && m <= 28){
                    cout << "DATA VALIDA" << endl;
                }
                else{
                    cout << "DATA NON VALIDA" << endl;
                }
                break;
        }
    }
    else{
        cout << "DATA NON VALIDA" << endl;
    }
    return 0;
}