#include <iostream>
#include <vector>
using namespace std;
/* if you want to put some prototip of function */
int main(){
    // leetcode two sum:

    vector<int> vet;
    vector<int> result;
    int target = 9;
    int num;
    int sum;
    for (int i = 0;;i ++){
        cout << "Inserisci il valore alla posizione , per finire digita 0: " << i << " : ";
        cin >> num;
        vet.push_back(num);
        if (num == 0){break;}
    }
    for (int i = 0;i < vet.size();i++){
        for (int j = i + 1;j < vet.size();j++){
            sum = vet[i] + vet[j];
            if (sum == target){result.push_back(i); result.push_back(j);i+=2;}
        }
    }
    for (int i = 0;i < result.size();i++){
        cout << result[i] << endl;
    }
	return 0;
}
/* body of function */