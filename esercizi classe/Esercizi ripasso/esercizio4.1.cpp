#include <iostream>
#include <string>

using namespace std;
int fun(int);
int main(){
    int n;
    cout << "Inserisci il numero: ";
    cin >> n;
    cout << "Risultato: " << fun(n);
    return 0;
}
int fun(int num){
    if (num >= 0 && num < 10){return num;}
    else if (num < 0){return 0;}
    else {
        auto copy = to_string(num);
        int min = (int) copy[0] - 48;
        int pos=0;
        for (int i = 0; i < copy.size(); i++) {
            if (((int) copy[i] - 48) < min) {
                min = (int) copy[i] - 48;
                pos = i;
            }
        }
        copy.erase(copy.begin()+pos);
        num = stoi(copy);
        return fun(num);
    }
}