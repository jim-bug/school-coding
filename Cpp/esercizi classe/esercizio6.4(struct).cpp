#include <iostream>
#include <string>
using namespace std;
struct Bibblioteca{
    int codice;
    string titolo;
    string autore;
    int anno_di_pubblicazione;
    string editore;
};
int main(){
    int n_libri;
    int scelta;
    cout << "Inserisci il numero di libri: ";
    cin >> n_libri;
    Bibblioteca collezione[n_libri];
    cout << "Scegli cosa vuoi fare: " << endl << "1) aggiungi un nuovo libro " << endl << "2) Visualizza elenco " << endl << "3) Visualizzazione libri col codice " << endl << "4) Visualizzazione a partire dal libro " << endl;
    cout << "Scegli: " << endl;
    cin >> scelta;
    for (int i = 0; i < n_libri;i++) {
        cout << "Scegli cosa vuoi fare: " << endl << "1) aggiungi un nuovo libro " << endl << "2) Visualizza elenco " << endl << "3) Visualizzazione libri col codice " << endl << "4) Visualizzazione a partire dal libro " << endl;
        cout << "Scegli: " << endl;
        cin >> scelta;
        switch (scelta) {
            case 1:
                cout << "Inserisci il codice del libro " << i << ": " << endl;
                cin >> collezione[i].codice;
                cout << "Inserisci il nome del libro " << i << ": " << endl;
                cin >> collezione[i].titolo;
                cout << "Inserisci l'editore del libro " << i << ": " << endl;
                cin >> collezione[i].editore;
                cout << "Inserisci l'autore del libro " << i << ": "  << endl;
                cin >> collezione[i].autore;
                cout << "Inserisci l'anno di pubblicazione del libro " << i << ": " << endl;
                cin >> collezione[i].anno_di_pubblicazione;
                break;
            case 2:
                for (int i = 0;i < n_libri;i++){
                    cout << "Nome libro " << i << ": " << collezione[i].titolo << endl;
                    cout << "Autore libro" << i << ": " << collezione[i].autore << endl;
                    cout << "Editore libro " << i << ": " << collezione[i].editore << endl;
                    cout << "Codice libro libro " << i << ": " << collezione[i].codice << endl;
                    cout << "Anno di pubblicazione libro  " << i << ": " << collezione[i].anno_di_pubblicazione << endl;
                }
                break;
            case 3:
                int codice;
                cout << "Inserisci il codice del libro che si vuole realizzare: " << endl;
                cin >> codice;
                for (int i = 0;i < n_libri;i++){
                    if (codice == collezione[i].codice){
                        cout << "Nome libro " << i << ": " << collezione[i].titolo << endl;
                        cout << "Autore libro" << i << ": " << collezione[i].autore << endl;
                        cout << "Editore libro " << i << ": " << collezione[i].editore << endl;
                        cout << "Codice libro libro " << i << ": " << collezione[i].codice << endl;
                        cout << "Anno di pubblicazione libro  " << i << ": " << collezione[i].anno_di_pubblicazione << endl;
                        break;
                    }
                }
                break;
            case 4:
                string titolo;
                cout << "Inserisci il titolo del libro che si vuole cercare: " << endl;
                cin >> titolo;
                for (int i = 0;i < n_libri;i++){
                    if (titolo.compare(collezione[i].titolo) == 0){
                        cout << "Nome libro " << i << ": " << collezione[i].titolo << endl;
                        cout << "Autore libro" << i << ": " << collezione[i].autore << endl;
                        cout << "Editore libro " << i << ": " << collezione[i].editore << endl;
                        cout << "Codice libro libro " << i << ": " << collezione[i].codice << endl;
                        cout << "Anno di pubblicazione libro  " << i << ": " << collezione[i].anno_di_pubblicazione << endl;
                        break;
                    }
                }
                break;
        }
    }
    return 0;
}
