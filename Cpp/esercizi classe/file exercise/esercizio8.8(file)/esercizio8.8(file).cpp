#include <iostream>
#include <fstream>
#include <ctime>
#include <cstdlib>
#define L 10
#define L1 3
using namespace std;
int main(){
    // pag A248 n 27:
    srand(time(0));
    ofstream file_ou("navi.txt");
    ifstream file_hit("colpi.txt");
    int mat[L][L];
    int r;
    int c;
    int colpi = 0;
    int navi_aff = 0;
    int vet[L1];
    int end = 9;
    int start = 0;
    int dati[L1] = {1, 2, 3};
    int coord_const_rows;
    int coord_const_columns;

    for (int i = 0;i < L1;i++){     // azzero il vettore del controllo delle navi affondate.
        vet[i] = 0;
    }

    for (int i = 0;i < L;i++){      // azzero la matrice
        for (int j = 0;j < L;j++){
            mat[i][j] = 0;
        }
    }

    for (int i = 0;i < L1;i++){
        r = (rand()%(end+1-start)+start);
        c = (rand()%(end+1-start)+start);
        if (mat[r][c] >= 1 and mat[r][c] <= 3){
            while (mat[r][c] >= 1 and mat[r][c] <= 3){
                r = (rand()%(end+1-start)+start);
                c = (rand()%(end+1-start)+start);
            }
        }
        coord_const_rows = r;
        coord_const_columns = c;
        for (int j = 0;j < dati[i];j++){
            mat[coord_const_rows][coord_const_columns+j] = dati[i];
        }
    }
    /*
     * faccio un ciclo che si itera per 3 volte(numero delle navi), dentro a questo ciclo dichiaro un altro ciclo che si itera per dati[i] volte, dove dati è un vettore contente le strutture delle navi quindi 1, 2, 3
     * in questa maniera dato che ogni barca occupa il valore stesso di posizioni con questo ciclo assegno le posizioni, però prima di assegnare il valore alla matrice verifico se l'elemento mat[r][c] è compreso tra 1 e 3 se lo è significa che già ha un valore assegnato,
     * quindi avvio un ciclo finchè la combinazione r c contiene un numero che non sia compreso tra 1 e 3.
     * */

    for (int i = 0;i < L;i++){
        for (int j = 0;j < L;j++){
            file_ou << mat[i][j] << " ";        // scrivo la matrice nel file.
        }
        file_ou << endl;
    }

    while(file_hit >> r){
        file_hit >> c;
        if (mat[r][c] >= 1 and mat[r][c] <= 3){     // verifico se ho colpito un pezzo di nave
            colpi ++;       // incremento i colpi effettuati
            vet[mat[r][c]-1] ++;    // incremento il contatore delle navi
        }
    }

    for (int i = 0;i < L1;i++){
        if (vet[i] == i+1){
            navi_aff ++;
        }
    }
    cout << "Colpi: " << colpi << endl << "Navi affondate: " << navi_aff << endl;
    file_ou.close();
    file_hit.close();
    return 0;
}