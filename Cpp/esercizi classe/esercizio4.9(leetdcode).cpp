#include <iostream>
using namespace std;
/* if you want to put some prototip of function */
int main(){
    // leetcode pown-x
    
	int n;
    int e;
    double result = 1;
    cout << "Inserisci la base: ";
    cin >> n;
    cout << "Inserisci l'esponente: ";
    cin >> e;
    if (e > 0){
        for (int i = 0;i < e;i++){
            result *= n;
        }
    }
    else{
        for (int i = 0;i < e*-1;i++){
            result *= (double)1/n;
        }
    }
    cout << "Risultato: " << result << endl;
	return 0;
}
/* body of function */