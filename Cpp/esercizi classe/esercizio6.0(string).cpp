#include <iostream>
#include <string>
using namespace std;
bool there_is(string, string);
int main(){
    // esercizio pag A180 n 51
    string s1 = "Ciao";
    string s2 = "ae";
    cout << there_is(s1, s2) << endl;

    return 0;
}
bool there_is(string s1, string s2){
    string control;
    for (int i = 0;i < s1.size();i++){
        for (int j = 0;j < s2.size();j++){
            if (s1[i] == s2[j]){
                control.push_back(s1[i]);
            }
        }
    }
    if (control == s2){
        return true;
    }
    else{
        return false;
    }

}