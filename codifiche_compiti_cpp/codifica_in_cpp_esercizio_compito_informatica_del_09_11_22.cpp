#include <iostream>

using namespace std;

int main()
{
    int k;
    int n;
    cout << "Inserisci la lunghezza della sequenza: ";
    cin >> n;
    cout << "Inserisci k: ";
    cin >> k;
    int vet[n];
    
    for (int i = 0;i < n;i++)
    {
        cout << "Inserisci numero: " << endl;
        cin >> vet[i];
    }
    for (int i = 0;i < n;i++)
    {
        for (int y = i + 1;y < n;y++)
        {
            if ((vet[i]*vet[y]) % k == 0)
            {
                cout << "La coppia che come risultato fa un multiplo di " << k << " è " << vet[i] << " e " << vet[y] << endl;
            }
        }
    }
    return 0;
}