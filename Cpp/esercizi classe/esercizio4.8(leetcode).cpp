#include <iostream>
#include <string>
using namespace std;
/* if you want to put some prototip of function */
int main(){
    // leetcode palidrom number:
    
	string num;
    bool control = true;
    cout << "Inserisci il numero: ";
    cin >> num;
    int j = num.size()-1;
    for (int i = 0;i < num.size();i++){
        if (num[i] != num[j]){control = false;break;}
        j --;
        if (i >= j){break;}
    }
    if (control){cout << "Palindromo " << endl;}
    else{cout << "Non palindromo " << endl;}
	return 0;
}
/* body of function */