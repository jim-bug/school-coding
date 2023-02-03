#include <iostream>
#include <cmath>

using namespace std;

int main()
{ 
    // realizzare un algoritmo che calcoli il numero di bernoulli:
    
    int costant_bernoulli;
    int n;
    int bernoulli_number;

    cout<<"Inserisci per quante volte vuoi che si iteri il ciclo: "<<endl;
    cin >> n;
    cout<<"Inserisci la costante di bernoulli: "<<endl;
    cin >> costant_bernoulli;
    
    for (int i = 1;i <= n;i++)
    {
        bernoulli_number += pow(i,costant_bernoulli);
    }

    cout<<"Il numero di bernoulli è: "<<bernoulli_number<<endl;

    return 0;
}