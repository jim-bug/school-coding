#include <iostream>
#include <string>

using namespace std;
int fun(int);
int main(){
    cout << fun(451729);
    return 0;
}
int fun(int num){
    if (num >= 0 && num < 10){return num;}
    else if (num < 0){return 0;}
    else {
        auto copy = to_string(num);
        int min = (int) copy[0] - 48;
        int pos;
        for (int i = 0; i < copy.size(); i++) {
            if (((int) copy[i] - 48) < min) {
                min = (int) copy[i] - 48;
                pos = i;
            }
        }
        int temp = copy[pos];
        copy[pos] = copy[pos + 1];
        copy[pos + 1] = temp;
        num = stoi(copy);
        return fun(num);

    }
}