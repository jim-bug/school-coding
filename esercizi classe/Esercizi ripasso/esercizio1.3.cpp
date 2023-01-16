#include <iostream>
using namespace std;
int control(int);
int main(){
    // // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 5
    int x;
    int count = 0;
    int n;
    cout << "Inserisci il valore di x: ";
    cin >> x;
    if (control(x)){
        for (int i = 0;i < x;i++){
            cout << "Inserisci un numero: " << endl;
            cin >> n;
            count += control(n);
        }
        cout << "Nella di sequenza di " << x << " numeri ci sono " << count << " numeri naturali." << endl;
    }
    else{
        cout << "Il numero inserito non è naturale riprova!" << endl;
    }
}
int control(int a){
    if (a >= 0){
        return 1;
    }
    else{
        return 0;
    }
}
