#include <iostream>
#include <string>
#include <fstream>
#define MAX 50
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
    ifstream file_in("Nuova_collezione.txt");       // struttura file: nome, autore, anno, editore, codice

    int n_libri;
    int i = 0;
    int codice;
    int scelta;
    int scelta_collezione;
    bool scelta_ciclo = true;
    int n_libri_new = 0;
    int index = 0;
    int count_divisor = -1;
    string temp;
    string titolo;
    char support;
    char data_file_in[MAX];

    cout << "Inserisci il numero di libri: ";
    cin >> n_libri;
    Bibblioteca collezione[n_libri];
    while (scelta_ciclo != false) {
        cout << "Scegli l'operazione che vuoi eseguire accompagnato dal numero della collezione su cui si vuole operare: "
                << endl << "1) Aggiunta di un nuovo libro alla collezione. " << endl
                << "2) Ordinamento dell'elenco in base al codice del libro. " << endl
                << "3) Visualizzazione dell'elenco dei libri della collezione. " << endl
                << "4) Ricerca informazioni relative a un libro a partire dal titolo. " << endl
                << "5) Ricerca informazioni relative a un linro a partire dal codice." << endl
                << "6) Salvataggio della collezione in un file di testo. " << endl
                << "7) CAricamento della collezione da un file di testo." << endl
                << "Scegli l'operazione che vuoi eseguire: " << endl;
        cin >> scelta;
        if (scelta == 1) {
            cout << "Scegli la collezione su cui vuoi operare: " << endl;
            cin >> scelta_collezione;
        }
        switch (scelta) {
            case 1:     // aggiunta libro
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
            case 2:     // ordinamento in base al codice
                for (int i = 0; i < n_libri; i++) {
                    for (int j = i + 1; j < n_libri; j++) {
                        if (collezione[i].codice > collezione[j].codice) {
                            swap(&collezione[i].codice, &collezione[j].codice);
                            swap(&collezione[i].anno_di_pubblicazione, &collezione[j].anno_di_pubblicazione);
                            swap(&collezione[i].editore, &collezione[j].editore);
                            swap(&collezione[i].titolo, &collezione[j].titolo);
                            swap(&collezione[i].autore, &collezione[j].autore);
                        }
                    }
                }
                for (int i = 0; i < n_libri; i++) {
                    cout << "Nome libro: " << collezione[i].titolo << endl;
                    cout << "Nome autore: " << collezione[i].autore << endl;
                    cout << "Codice libro: " << collezione[i].codice << endl;
                    cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                    cout << "Editore libro: " << collezione[i].editore << endl;
                }
                break;
            case 3:     // visualizzazione elenco
                for (int i = 0; i < n_libri; i++) {
                    cout << "Nome libro: " << collezione[i].titolo << endl;
                    cout << "Nome autore: " << collezione[i].autore << endl;
                    cout << "Codice libro: " << collezione[i].codice << endl;
                    cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                    cout << "Editore libro: " << collezione[i].editore << endl;
                }
                break;
            case 4:     // ricerca in base al titolo
                cout << "Inserisci il titolo del libro: " << endl;
                cin >> titolo;
                for (int i = 0; i < n_libri; i++) {
                    if (titolo == collezione[i].titolo) {
                        cout << "Nome libro: " << collezione[i].titolo << endl;
                        cout << "Nome autore: " << collezione[i].autore << endl;
                        cout << "Codice libro: " << collezione[i].codice << endl;
                        cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                        cout << "Editore libro: " << collezione[i].editore << endl;
                        break;
                    }
                }
                break;
            case 5:     // ricerca in base al codice
                cout << "Inserisci il codice del libro: " << endl;
                cin >> codice;
                for (int i = 0; i < n_libri; i++) {
                    if (codice == collezione[i].codice) {
                        cout << "Nome libro: " << collezione[i].titolo << endl;
                        cout << "Nome autore: " << collezione[i].autore << endl;
                        cout << "Codice libro: " << collezione[i].codice << endl;
                        cout << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                        cout << "Editore libro: " << collezione[i].editore << endl;
                        break;
                    }
                }
                break;
            case 6:     // salvataggio in un file
                for (int i = 0; i < n_libri; i++) {
                    file_ou << "Nome libro: " << collezione[i].titolo << endl;
                    file_ou << "Nome autore: " << collezione[i].autore << endl;
                    file_ou << "Codice libro: " << collezione[i].codice << endl;
                    file_ou << "Anno pubblicazione libro: " << collezione[i].anno_di_pubblicazione << endl;
                    file_ou << "Editore libro: " << collezione[i].editore << endl;
                    cout << endl << endl;
                }
                break;
            case 7:     // importazione da un file
                while (file_in >> support){
                    if (int(support) >= 65 && int(support) <= 90){
                        n_libri_new ++;
                    }
                }
                Bibblioteca collezione_1[n_libri_new];
                file_in.close();
                ifstream file_in("Nuova_collezione.txt");
                file_in.getline(data_file_in, MAX);

                while (true){
                    if (int(data_file_in[i]) == 0){
                        index ++;
                        i = 0;
                        count_divisor = -1;
                        file_in.getline(data_file_in, MAX);
                    }
                    if (index >= n_libri_new){
                        break;
                    }

                    while (data_file_in[i] != ','){
                        if (int(data_file_in[i]) == 0){
                            i --;       // dato che i sarà la posizione del terminatore della riga, decrementadolo potrò attraverso l'incremento di riga 180, posso cambiare riga.
                            break;
                        }
                        temp.push_back(data_file_in[i]);
                        i ++;
                    }
                    count_divisor ++;
                    switch (count_divisor) {
                        case 0:
                            collezione_1[index].titolo = temp;
                            break;
                        case 1:
                            collezione_1[index].autore = temp;
                            break;
                        case 2:
                            collezione_1[index].anno_di_pubblicazione = stoi(temp);
                            break;
                        case 3:
                            collezione_1[index].codice = stoi(temp);
                            break;
                        case 4:
                            collezione_1[index].editore = temp;
                            break;
                    }
                    temp.clear();
                    i ++;
                }
                for (int i = 0; i < n_libri_new; i++) {
                    cout << "Nome libro: " << collezione_1[i].titolo << endl;
                    cout << "Nome autore: " << collezione_1[i].autore << endl;
                    cout << "Codice libro: " << collezione_1[i].codice << endl;
                    cout << "Anno pubblicazione libro: " << collezione_1[i].anno_di_pubblicazione << endl;
                    cout << "Editore libro: " << collezione_1[i].editore << endl;
                    cout << endl << endl;
                }
                break;
        }
        cout << "Vuoi continuare: " << endl;
        cin >> scelta_ciclo;

    }
    file_in.close();
    file_ou.close();
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
