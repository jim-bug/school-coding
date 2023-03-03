#include <iostream>
#include <string>
using namespace std;
int main(){
    // leetcode, https://leetcode.com/problems/number-of-digit-one/description/
    int n;
    cout << "Inserisci il numero: " << endl;
    cin >> n;
    int count = 0;
    string copy;
    for (int i = 0;i <= n;i++){
        copy = to_string(i);
        for (int j = 0;j < copy.size();j++){
            if (copy[j] == '1'){
                count ++;
            }
        }
    }
    cout <<"Il numero di cifre è " << count << endl;
}