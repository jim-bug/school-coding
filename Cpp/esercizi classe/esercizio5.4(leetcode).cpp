#include <iostream>
#include <vector>
#include <cmath>
#include "algorithm"
using namespace std;

int main(){
    vector<int> num;
    int y;
    for (int i = 0;i < 9;i++){
        cin >> y;
        num.push_back(y);
    }
    int k = 1;
    int nums = 0;
    int j = 1;
    for (int i = 0;i < num.size();i++){
        nums += num[i]*pow(10, num.size()-j);
        j ++;
    }
    long long int result = nums+k;
    vector<int> results;
    while (result > 0){
        results.push_back(result%10);
        result /= 10;

    }
    j = results.size()-1;
    for (int i = 0;i < results.size();i++){
        int temp = results[i];
        results[i] = results[j];
        results[j] = temp;
        j --;
        if (i >= j){
            break;
        }

    }
    cout<< result << endl;
    return 0;
}
