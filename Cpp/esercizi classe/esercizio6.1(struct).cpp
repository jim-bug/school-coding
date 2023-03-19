#include <iostream>
#define L 10
using namespace std;
struct Auto {
    string marca;
    string nome;
    string cognome;
    int anno_immatricola;
    int cilindrata;
};
int main(){
    // Esercizio pag A191 n 11
    Auto autosalone[L];
    for (int i = 0;i < L;i++){
        cout << "Inserisci la marca dell'auto n " << i << " : " << endl;
        cin >> autosalone[i].marca;
        cout << "Inserisci il nome dell'acquirente n " << i << ": "<<endl;
        cin >> autosalone[i].nome;
        cout << "Inserisci il cognome dell'acquirente n " << i << ": "<<endl;
        cin >> autosalone[i].cognome;
        cout << "Inserisci l'anno di immatricolazione dell'auto n " << i << ": "<<endl;
        cin >> autosalone[i].anno_immatricola;
        cout << "Inserisci la cilindrata della macchina n " << i << ": " << endl;
        cin >> autosalone[i].cilindrata;
    }

    for (int i = 0;i < L;i++){
        if (autosalone[i].cilindrata > 1500){
            cout << "Cognome dell'aquirente che ha una macchina con cilindrata maggiore di 1500 "  << ": " << autosalone[i].cognome << endl;
        }
    }
	
	return 0;
}
