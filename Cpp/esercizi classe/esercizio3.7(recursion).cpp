#include <iostream>
using namespace std;
int fibonacci(int);
int main(){
    int number;
    cout << "Inserisci il numero: ";
    cin >> number;
    cout << "Numero " << number << " esimo di fibonacci: " << fibonacci(number) << endl;23
    return 0;
}
int fibonacci(int num){
    if (num == 1){return 1;}
    if (num == 0){return 0;}
    else{return fibonacci(num-1) + fibonacci(num-2);}
}
