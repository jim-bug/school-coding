#include <iostream>
using namespace std;
struct Classe{
    string nome;
    string cognome;
    string sesso;
    int anno_nascita;
    struct Voti{
        int mate_voto;
        int ing_voto;
        int ita_voto;
    }voti;
};
float maxi(int, int, int);
void piu_facile(Classe[], int);
int main(){
	// Esercizio pag A191 n 14
    int numero_studenti;
    cout << "Inserisci il numero degli studenti: " << endl;
    cin >> numero_studenti;
    Classe classe[numero_studenti];

    for (int i = 0;i < numero_studenti;i++){
        cout << "Inserisci il nome " << i << ": " << endl;
        cin >> classe[i].nome;
        cout << "Inserisci il cognome " << i << ": " << endl;
        cin >> classe[i].cognome;
        cout << "Inserisci il sesso " << i << ": " << endl;
        cin >> classe[i].sesso;
        cout << "Inserisci il voto di matematica " << i << ": " << endl;
        cin >> classe[i].voti.mate_voto;
        cout << "Inserisci il voto di italiano " << i << ": " << endl;
        cin >> classe[i].voti.ita_voto;
        cout << "Inserisci il voto di inglese " << i << ": " << endl;
        cin >> classe[i].voti.ing_voto;
    }

    piu_facile(classe, numero_studenti);

	return 0;
}
float maxi(int a, int b, int c){
    if (a > b){
        if (a > c){
            return a;
        }
        else{return c;}
    }
    else{
        if (b > c){
            return b;
        }
        else{return c;}
    }
}
void piu_facile(Classe classe_aux[], int num){
    float media_mate = 0;
    float media_ing = 0;
    float media_ita = 0;
    float materia;
    for (int i = 0;i < num;i++){
        media_mate += classe_aux[i].voti.mate_voto;
        media_ing += classe_aux[i].voti.ing_voto;
        media_ita += classe_aux[i].voti.ita_voto;
    }

    media_mate = media_mate / 3;
    media_ita = media_ita / 3;
    media_ing = media_ing / 3;

    materia = maxi(media_mate, media_ita, media_ing);
    if (materia == media_mate){
        cout << "Matematica" << endl;
    }
    else if (materia == media_ing){
        cout << "Inglese" << endl;
    }
    else{
        cout << "Italiano" << endl;
    }
}