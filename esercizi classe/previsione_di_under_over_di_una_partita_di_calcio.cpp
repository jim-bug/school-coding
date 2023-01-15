#include <iostream>
using namespace std;
#define PG 5 // partite giocate
#define SP 2 // stato partite
#define NS 2 // numero squadre
void print_games(int[][SP], string); // prototipo
struct Squad{
    string squad_name;
    int u5[PG][SP]{};
};

int main(){
    Squad squadre[NS];

    int sum = 0;
    int sum1 = 0;
    string state[NS] = {"fatti", "subiti"};
    float medie[NS];
    const float COND = 2.5;
    string risposta;
    int n_partita;
    int n_squadra;
    int type;

    for (int i = 0;i < NS;i++){
        cout << "Inserisci il nome della squadra " << i << endl;
        cin >> squadre[i].squad_name;
    }

    for (int i = 0;i < NS;i++) {
        for (int j = 0; j < PG; j++) {
            for (int k = 0; k < SP; k++) {
                cout << "Inserisci i goal " << state[k] << " della squadra " << squadre[i].squad_name << " nella " << "partita " << j <<endl;
                cin >> squadre[i].u5[j][k];
            }
        }
    }
    print_games(squadre[0].u5, squadre[0].squad_name);
    print_games(squadre[1].u5, squadre[1].squad_name);
    cout << "Questi sono i risultati inseriti da te, c'è qualche risultato che non torna: ";
    cin >> risposta;
    while (risposta == "si"){
        cout << "Inserisci l'indice della squadra 0: " << squadre[0].squad_name << " 1: " << squadre[1].squad_name << " :\t";
        cin >> n_squadra;
        cout << "Inserisci il numero della partita:\t";
        cin >> n_partita;
        cout << "Inserisci se devi modificare un goal fatto(0), un goal subito(1) o un risultato intero(2):\t";
        cin >> type;
        switch (type){
            case 0:
                cout << "Inserisci il goal fatto della partita " << n_partita << " e della squadra: \t" << n_squadra;
                cin >> squadre[n_squadra].u5[n_partita][type];
                break;
            case 1:
                cout << "Inserisci il goal subito della partita " << n_partita << " e della squadra:\t" << n_squadra;
                cin >> squadre[n_squadra].u5[n_partita][type];
                break;
            case 2:
                for (int i = 0;i < SP;i++){
                    cout << "Inserisci i goal " << state[i] << " della squadra " << squadre[n_squadra].squad_name << " nella " << "partita:\t" << n_partita <<endl;
                    cin >> squadre[n_squadra].u5[n_partita][i];
                }
                break;
        }
        print_games(squadre[0].u5, squadre[0].squad_name);
        print_games(squadre[1].u5, squadre[1].squad_name);
        cout << "Vuoi correggere qualche altro errore: ";
        cin >> risposta;
    }

    for (int i = 0;i < NS-1;i++) {
        for (int j = 0; j < PG; j++) {
            sum += (squadre[i].u5[j][0] + squadre[i+1].u5[j][0]);
            sum1 += (squadre[i].u5[j][1] + squadre[i+1].u5[j][1]);
        }
    }

    medie[0] = (float) sum / PG; // media goal fatti dalle due squadre
    medie[1] = (float) sum1 / PG; // media goal subiti delle due squadre

    if (medie[0] >= COND && medie[1] >= COND)
    {
        cout << squadre[0].squad_name << " e " << squadre[1].squad_name << " secondo le previsioni sarà OVER." << endl;
    }
    else
    {
        cout << squadre[0].squad_name << " e " << squadre[1].squad_name << " secondo le previsioni sarà UNDER." << endl;
    }

    cout << medie[0] << " " << medie[1] << endl;

    cout << endl; // breakpoint for debug.
}

void print_games(int matrix[][2], string name){
    cout << "\t\t\t\tfatti: " << "\t\t\tsubiti:" << endl;
    for (int i = 0;i < PG;i ++){
        cout << "Partita " << i << " della squadra " << name << " : ";
        for (int j = 0;j < SP;j++){
            cout << "\t" << matrix[i][j] << "\t\t";
        }
        cout << endl;
    }
}