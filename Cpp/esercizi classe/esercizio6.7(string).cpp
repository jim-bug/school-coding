#include <iostream>
#include <string>

using namespace std;
int control(string, string);
int main(){
    // Esercizio pag A180 n 52

    string s1 = "PIPPO";
    string s2 = "AAAAAPIPPO";

    cout << control(s1, s2);
    return 0;
}
int control(string s1, string s2){
    int count = 0;
    int j = 0;
    for (int i = 0;i < s2.size();i++){
        if (s1[j] == s2[i]){
            count ++;
        }
        j ++;
        if (j == s1.size()){j = 0;}
    }
    return count;
}