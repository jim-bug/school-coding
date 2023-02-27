#include <iostream>
#define L 3
using namespace std;

int main(){
     // date due rette determinare se esse sono perpendicolari, parallele, coincidenti:

    float equa_1[L];
    float equa_2[L];
    float m;
    float m1;
    float q;
    float q1;
    cout << "Inserisci la prima equazione: ";
    cin >> equa_1[0] >> equa_1[1] >> equa_1[2];
    cout << "Inserisci la seconda equazione: ";
    cin >> equa_2[0] >> equa_2[1] >> equa_2[2];
    m = ((-1)*equa_1[0]) / equa_1[1];
    m1 = ((-1)*equa_2[0]) / equa_2[1];
    q = ((-1)*equa_1[2]) / equa_1[1];
    q1 = ((-1)*equa_2[2]) / equa_2[1];
    if (m == m1 && q == q1){
        cout << "Le rette sono coincidenti" << endl;
    }
    else if (m == m1){
        cout << "Le rette sono parallele" << endl;
    }
    else if ((-1)*(1/m) == m1){
        cout << "Le rette sono perpendicolari" << endl;
    }
    return 0;
}
