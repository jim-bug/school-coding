#include <iostream>
#include <cmath>

using namespace std;
struct recPoint{
    double x;
    double y;
};
struct recCircle{
    recPoint Centro;
    double raggio;
};
struct recLine{
    double m;
    double q;
};
int main(){
    // Esercizio pag A191 n 16:

    int scelta;
    recPoint punto1;
    recPoint punto2;
    recPoint punto3;
    cout << "Scegli una delle seguenti opzioni: " << endl << " 1) Punto medio tra due punti" << endl << " 2) Distanza tra due punti" << endl << " 3) Retta passante per due punti" << endl << " 4) Circonferenza passante per 3 punti" << endl << " 5) Distanza punto retta" << endl << "Scegli: ";
    cin >> scelta;
    switch (scelta){
        case 1:

            recPoint medio;
            cout << "Inserisci le coordinate del primo punto x y: " << endl;
            cin >> punto1.x >> punto1.y;
            cout << "Inserisci le coordinate del secondo punto x y: " << endl;
            cin >> punto2.x >> punto2.y;

            medio.x = (punto1.x+punto2.x)/2;
            medio.y = (punto1.y+punto2.y)/2;
            cout << "M(" << medio.x << "; " << medio.y << ")" << endl;
            break;

        case 2:
            float distanza;
            cout << "Inserisci le coordinate del primo punto x y: " << endl;
            cin >> punto1.x >> punto1.y;
            cout << "Inserisci le coordinate del secondo punto x y: " << endl;
            cin >> punto2.x >> punto2.y;
            distanza = sqrt((pow(punto1.x-punto2.x, 2)) + (pow(punto1.y-punto2.y, 2)));
            cout << "La distanza è " << distanza << endl;
            break;

        case 3:
            recLine r;
            cout << "Inserisci le coordinate del primo punto x y: " << endl;
            cin >> punto1.x >> punto1.y;
            cout << "Inserisci le coordinate del secondo punto x y: " << endl;
            cin >> punto2.x >> punto2.y;
            r.m = (punto2.y-punto1.y)/(punto2.x-punto1.x);
            r.q = (((r.m*punto1.x)*-1)+punto1.y);

            cout << "Retta: " << "y = " << r.m << "x + " << r.q << endl;
            break;

        case 4:
            bool cond_appartenenza_p1;
            bool cond_appartenenza_p2;
            bool cond_appartenenza_p3;
            int a;
            int b;
            int c;
            cout << "Inserisci il coefficente a della circonferenza: " << endl;
            cin >> a;
            cout << "Inserisci il coefficente b della circonferenza: " << endl;
            cin >> b;
            cout << "Inserisci il coefficente c della circonferenza: " << endl;
            cin >> c;
            cout << "Inserisci le coordinate del primo punto x y: " << endl;
            cin >> punto1.x >> punto1.y;
            cout << "Inserisci le coordinate del secondo punto x y: " << endl;
            cin >> punto2.x >> punto2.y;
            cout << "Inserisci le coordinate del terzo punto x y: " << endl;
            cin >> punto3.x >> punto3.y;
            cond_appartenenza_p1 = (pow(punto1.x,2)+(pow(punto1.y, 2)+(a*punto1.x)+(b*punto1.y)+c)) == 0;
            cond_appartenenza_p2 = (pow(punto2.x,2)+(pow(punto2.y, 2)+(a*punto2.x)+(b*punto2.y)+c)) == 0;
            cond_appartenenza_p3 = (pow(punto3.x,2)+(pow(punto3.y, 2)+(a*punto3.x)+(b*punto3.y)+c)) == 0;
            if (cond_appartenenza_p1){
                cout << "Il primo punto sta sulla circonferenza " << endl;
            }
            if (cond_appartenenza_p2){
                cout << "Il secondo punto sta sulla circonferenza " << endl;
            }
            if (cond_appartenenza_p3){
                cout << "Il terzo punto sta sulla circonferenza " << endl;
            }
            break;

        case 5:
            recLine retta;
            float distanza_punto_retta;
            cout << "Inserisci il coefficente angolare della retta: " << endl;
            cin >> retta.m;
            cout << "Inserisci il coefficente q della retta: " << endl;
            cin >> retta.q;
            retta.m = retta.m*-1;
            retta.q = retta.q*-1;
            cout << "Inserisci le coordinate del primo punto x y: " << endl;
            cin >> punto1.x >> punto1.y;
            distanza_punto_retta = (abs((punto1.x*retta.m)+(punto1.y)+(retta.q)/sqrt(pow(retta.m, 2)+1)));  // prendendo in riferimento che il programma non lavori con le frazioni!

            cout << "Distanza: " << distanza_punto_retta << endl;
            break;
        default:
            cout << "NESSUN CASO PREVISTO!" << endl;
            break;
    }

    return 0;
}