#include <iostream>

using namespace std;

float mediana(float[],int); // prototipo
void print_vector(float[],int); // prototipo
float media(float[],int); // prototipo

int main()
{
  // data una matrice NxM calcolare il valore mediano delle medie di ogni riga della matrice, utilizzando la funzione media(vettore,lunghezza), mediana(vettore,lunghezza).
    int n;
    int m;
    cout << "Inserisci il numero delle righe: " << endl;
    cin >> n;
    cout << "Inserisci il numero delle colonne: " << endl;
    cin >> m;
    float medie[n];
    float matrix[n][m];

    for (int i = 0;i < n;i++)
    {
        for (int j = 0;j < m;j++)
        {
            cout << "Inserisci il valore alla riga: " << i << " e alla colonna: " << j << ": " << endl;
            cin >> matrix[i][j];
        }
    }

    for (int i = 0;i < n;i++)
    {
        medie[i] = media(matrix[i],m);
    }
    // cout << endl;
    // print_vector(medie,n);
    cout << "La mediana è: " << mediana(medie,n) << endl;

    return 0;
}
float mediana(float vet[], int lun)
{
    float mediana_value;
    if (lun % 2 == 0)
    {
        mediana_value = (vet[((int)lun/2)-1] + vet[((int)lun/2)])/2;
    }
    else
    {
        mediana_value = vet[(int)lun/2];
    }
    return mediana_value;
}

void print_vector(float vet[], int len)
{
    for (int i = 0;i < len;i++)
    {
        cout << vet[i] << endl;
    }
}

float media(float vet[], int len)
{
    float sum = 0;
    for (int i = 0;i < len;i++)
    {
        sum += vet[i];
    }
    return sum/len;
}
