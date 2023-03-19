#include <iostream>
#define L 2
using namespace std;

struct Squadra{
    string nome;
    string colore_maglia;
    int punteggio_corrente;
    struct Allenatore{
        string nome;
        string cognome;
        int numero_trofei;
    };
    Allenatore allenatore;
};
int main(){
	// Esercizio pag A191 n 12

    Squadra fantacalcio[L];

    for (int i = 0;i < L;i++){
        cout << "Inserisci il nome della squadra " << i << endl;
        cin >> fantacalcio[i].nome;
        cout << "Inserisci il colore della maglia della squadra " << i << endl;
        cin >> fantacalcio[i].colore_maglia;
        cout << "Inserisci il punteggio corrente " << i << endl;
        cin >> fantacalcio[i].punteggio_corrente;
        cout << "Inserisci il nome dell'allenatore della squadra " << i << endl;
        cin >> fantacalcio[i].allenatore.nome;
        cout << "Inserisci il cognome dell'allenatore della squadra " << i << endl;
        cin >> fantacalcio[i].allenatore.cognome;
        cout << "Inserisci il numero di trofei vinti dell'allenatore della squadra " << i << endl;
        cin >> fantacalcio[i].allenatore.numero_trofei;
    }
    for (int i = 0;i < L;i++){
        if (fantacalcio[i].punteggio_corrente > 30 and fantacalcio[i].allenatore.numero_trofei > 1){
            cout << "Il cognome dell'allenatore è " << fantacalcio[i].allenatore.cognome;
        }
    }

	return 0;
}
/* body of function */