#include <iostream>
using namespace std;
int main(){
    // Simulare un asta in cui ci sono due compratori che si contengono l'acquisto di un
    //oggetto, a turno i due compratori dovranno fare un'offerta per l'oggetto da comprare,
    //l'asta termina quando uno dei due compratori si ritira offrendo '0', a quel punto l'altro
    //compratore si sarà aggiudicato l'asta. Stampare quale compratore si è aggiudicato
    //l'asta e con quale cifra:

    int off_c1 = 0;
    int off_c2 = 0;
    int copy_c2;
    for (;;){
        cout << "Inserisci l'offerta del compratore 1: ";
        cin >> off_c1;
        if (off_c1 == 0){
            cout << "Asta aggiudicata al compratore 2 per la cifra di " << copy_c2 << endl;
            break;
        }
        cout << "Inserisci l'offerta del compratore 2: ";
        cin >> off_c2;
        if(off_c2 == 0){
            cout << "Asta aggiudicata al compratore 2 per la cifra di " << off_c1 << endl;
            break;
        }
        copy_c2 = off_c2;
    }
    return 0;
}