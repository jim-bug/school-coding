#include <iostream>
#include <vector>
#include "algorithm"
using namespace std;
int findLucky(vector<int>& arr) {
    vector<int> supp;
    int count = 1;
    sort(arr.begin(), arr.end());
    for (int i = 0;i < arr.size();i++){
        if (arr[i] == arr[i+1]){
            count ++;
        }
        else{
            if(count == arr[i]){
                supp.push_back(arr[i]);
            }
            count = 1;
        }
    }
    if (supp.size() > 0){
        int a = supp.size()-1;
        return supp[a];
    }
    else{
        return -1;
    }
}
int main(){
    // leetcode, https://leetcode.com/problems/find-lucky-integer-in-an-array/
	vector<int> vet = {3, 2, 2, 3, 3, 4, 4, 4, 4};
    cout << findLucky(vet);
	return 0;
}
/* body of function */