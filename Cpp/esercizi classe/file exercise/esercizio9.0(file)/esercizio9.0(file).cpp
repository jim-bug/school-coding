#include <iostream>
#include <string>
#include <fstream>

using namespace std;

struct Bibblioteca{
    int codice;
    string titolo;
    string autore;
    int anno_di_pubblicazione;
    string editore;
};
void swap(int*, int*);
void swap(string*, string*);
int main(){
    ofstream file_ou("Collezione.txt");
    int n_libri;
    string titolo;
    int codice;
    int scelta;
    int scelta_collezione;
    cout << "Inserisci il numero di libri: ";
    cin >> n_libri;
    Bibblioteca collezione[n_libri];
    cout << "Scegli l'operazione che vuoi eseguire accompagnato dal numero della collezione su cui si vuole operare: " << endl << "1) Aggiunta di un nuovo libro alla collezione. " << endl << "2) Ordinamento dell'elenco in base al codice del libro. " << endl << "3) Visualizzazione dell'elenco dei libri della collezione. " << endl << "4) Ricerca informazioni relative a un libro a partire dal titolo. " << endl << "5) Ricerca informazioni relative a un linro a partire dal codice." << endl << "6) Salvataggio della collezione in un file di testo. " << endl << "7) CAricamento della collezione da un file di testo." << endl << "Scegli l'operazione che vuoi eseguire: " << endl;
    cin >> scelta;
    if (scelta != 3){
        cout << "Scegli la collezione su cui vuoi operare: " << endl;
        cin >> scelta_collezione;
    }
    switch (scelta) {
        case 1:
            cout << "Inserisci il nome del libro: " << endl;
            cin >> collezione[scelta_collezione].titolo;
            cout << "Inserisci il nome dell'autore: " << endl;
            cin >> collezione[scelta_collezione].autore;
            cout << "Inserisci l'anno di pubblicazione del libro: " << endl;
            cin >> collezione[scelta_collezione].anno_di_pubblicazione;
            cout << "Inserisci il codice del libro: " << endl;
            cin >> collezione[scelta_collezione].codice;
            cout << "Inserisci il nome dell'editore del libro: " << endl;
            cin >> collezione[scelta_collezione].editore;
            break;
        case 2:
            for (int i = 0;i < n_libri;i++){
                for (int j = i+1;j < n_libri;j++){
                    if (collezione[i].codice > collezione[j].codice){
                        swap(&collezione[i].codice, &collezione[j].codice);
                        swap(&collezione[i].anno_di_pubblicazione, &collezione[j].anno_di_pubblicazione);
                        swap(&collezione[i].editore, &collezione[j].editore);
                        swap(&collezione[i].titolo, &collezione[j].titolo);
                        swap(&collezione[i].autore, &collezione[j].autore);
                    }
                }
            }
            for (int i = 0; i < n_libri;i++){
                cout << "Nome libro: " << collezione[i].titolo << endl;
                cout << "Nome autore: " << collezione[i].autore << endl;
                cout << "Codice libro: " << collezione[i].codice << endl;
                cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                cout << "Editore libro: " << collezione[i].editore << endl;
            }
            break;
        case 3:
            for (int i = 0; i < n_libri;i++){
                cout << "Nome libro: " << collezione[i].titolo << endl;
                cout << "Nome autore: " << collezione[i].autore << endl;
                cout << "Codice libro: " << collezione[i].codice << endl;
                cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                cout << "Editore libro: " << collezione[i].editore << endl;
            }
            break;
        case 4:
            cout << "Inserisci il titolo del libro: " << endl;
            cin >> titolo;
            for (int i = 0;i < n_libri;i++){
                if (titolo == collezione[i].titolo){
                    cout << "Nome libro: " << collezione[i].titolo << endl;
                    cout << "Nome autore: " << collezione[i].autore << endl;
                    cout << "Codice libro: " << collezione[i].codice << endl;
                    cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                    cout << "Editore libro: " << collezione[i].editore << endl;
                    break;
                }
            }
            break;
        case 5:
            cout << "Inserisci il codice del libro: " << endl;
            cin >> codice;
            for (int i = 0;i < n_libri;i++){
                if (codice == collezione[i].codice){
                    cout << "Nome libro: " << collezione[i].titolo << endl;
                    cout << "Nome autore: " << collezione[i].autore << endl;
                    cout << "Codice libro: " << collezione[i].codice << endl;
                    cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                    cout << "Editore libro: " << collezione[i].editore << endl;
                    break;
                }
            }
            break;
        case 6:
            for (int i = 0; i < n_libri;i++){
                file_ou << "Nome libro: " << collezione[i].titolo << endl;
                file_ou << "Nome autore: " << collezione[i].autore << endl;
                file_ou << "Codice libro: " << collezione[i].codice << endl;
                file_ou << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                file_ou << "Editore libro: " << collezione[i].editore << endl;
                cout << endl << endl;
            }
            break;
        case 7:
            break;
    }
    file_ou.close()
    return 0;
}
void swap(int *a, int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}
void swap(string *a, string *b){
    string temp = *a;
    *a = *b;
    *b = temp;
}