#include <iostream>

using namespace std;
int main()
{
    // due vettori  di lunghezza n e n_1 e un valore k, restituire le coppie x1,x2 con x1 appartenete a vet 1 e x 2 appartenente al vet 2, tali che x1 per x2 è divisibile per k

    int n;
    int n_1;
    int k;
    cout << "Inserisci il valore di k " << endl;
    cin >> k;
    cout << "Inserisci la lunghezza del primo vettore " << endl;
    cin >> n;
    cout << "Inserisci la lunghezza del secondo vettore " << endl;
    cin >> n_1;
    int vet[n];
    int vet_1[n_1];

    for (int i = 0;i < n;i++)
    {
        cout << "Inserisci il numero del vettore 1 alla posizione " << i + 1 << endl;
        cin >> vet[i];
    }
    for (int i = 0;i < n_1;i++)
    {
            cout << "Inserisci il numero del vettore 2 alla posizione " << i + 1 << endl;
            cin >> vet_1[i];
    }
    for (int i = 0;i < n;i++)
    {
        for (int y = 0;y < n_1;y++)
        {
            if ((vet[i] * vet_1[y]) % k == 0)
            {
                cout << "La coppia che come risultato fanno un numero divisibile per " << k << " si trovano alla posizione " << i << " del primo vettore e alla posizione " << y << " del secondo vettore" << endl; 
            }
        }
    }





    return 0;
}
