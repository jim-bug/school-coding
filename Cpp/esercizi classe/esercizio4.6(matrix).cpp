#include <iostream>

using namespace std;

int main()
{
    const int alunni = 6;
    const int voti = 5;
    float matrix[alunni][voti];
    float media[alunni];
    float somma = 0;
    short a;
    short v;
    for (int i = 0;i < alunni;i++)
    {
        somma = 0; // la somma si azzera ogni volta perchè ad esempio con i = 0 popoliamo i voti del primo alunno e di questi ci facciamo la somma appena abbiamo finito la somma del primo alunno facciamo la media di quel valore della somma e appena passa ad un nuovo alunno la somma si deve riazzerare.
        for (int j = 0; j < voti;j++)
        {
            cout << "Inserisci il "<< j+1<<" voto dell alunno "<< i+1<<endl; // il valore di i e j sommato a 1 ogni volta sul cout non modifica il valore di i e j reale solo sul cout.
            cin >> matrix[i][j];
            somma += matrix[i][j];
        }
        media[i] = (float) somma/voti; // eseguo la media di ogni alunno
    }

    cout<<endl;
    for (int i = 0;i < alunni;i++) // mando a schermo la matrice
    {
        for (int j = 0;j < voti;j++)
        {
            cout << "Il voto dell alunno "<< i+1<<" è "<< matrix[i][j]<<endl;
        }
    }
    cout<<endl;
    for (int i = 0;i < alunni;i++)
    {
        cout<<"La media dell'alunno: "<< i << "e "<< media[i]<<endl;
    }

    short z = matrix[0][0];
    for (int i = 0; i < alunni;i++)
    {
        for (int j = 0;j < voti;j++)
        {
            if (matrix[i][j] > z) // faccio il controllo
            {
                z = matrix[i][j];
                a  = i;
                v = j;
            }
        }
    }

    cout << "Lo studente "<< a+1 << "ha preso il voto  maggiore nella prova " << v+1 <<" ed è " << z <<endl; // metto + 1 perchè in precedenza mando a schemro il valore + 1 per evitare di dare in outuput alunno 0 ecc quindi sul questo cout ci va su alunno e voti il +1


    return 0;
}
