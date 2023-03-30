#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
int function(string, string);
int sum_vector(string);
int main(){
	// Esercizio pag A181 n 59
    string s1 = "CIAO";
    string s2 = "CIAO";
    cout << function(s1, s2) << endl;
	return 0;
}
int sum_vector(string str1){
    int sum = 0;
    for (int i = 0;i < str1.size();i++){
        sum += int(str1[i]);
    }
    return sum;
}
int function(string str1, string str2){
    int sum_str1 = sum_vector(str1);
    int sum_str2 = sum_vector(str2);

    if (sum_str1 < sum_str2){
        return -1;
    }
    else if (sum_str1 > sum_str2){
        return 1;
    }
    else if (sum_str1 == sum_str2){
        return 0;
    }
}