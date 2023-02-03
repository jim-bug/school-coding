#include <iostream>
using namespace std;
int main(){
    // fattoriale di un numero senza ricorsione
    int fatt = 1;
    int n;
    cout << "Inserisci un numero: ";
    cin >> n;
    for (int i = n;i > 0;i--){
        fatt = fatt * i;
    }
    cout << "Il fattoriale di " << n << " : " << fatt << endl;

    return 0;
}
