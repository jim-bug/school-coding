#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    // realizzare la media geometrica di n numeri dati in input:
    short n;
    float nums;
    float prod = 1;
    float media;

    cout << "Inserisci con quanti numeri vuoi fare la media: "<< endl;
    cin >> n;

    for (int i = 0;i < n;i++)
    {
        cout << "Inserisci il numero: " << endl;
        cin >> nums;
        prod *= nums;
    }

    media = (float) pow(prod,1/n);
    cout << "Media totale: "<<media<<endl;

    return 0;
}
