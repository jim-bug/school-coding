#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;
// funzione stoi()

string extract(int, int, string);
struct Alunno{
    string nome;
    string n_matricola;
    string eta;
    string voto;
};
int main(){
    string supps;
    int people = 0;
    vector <int> positins;
    int i = 0;
    int count_v;
    int start;
    char supp;
    int index = 0;
    ifstream file("risultati.csv");
    while (file >> supp){       // estraggo i dati dal file e conto quanti alunni ci sono.
        supps.push_back(supp);
        if (i > 0 && int(supps[i]) >= 65 && int(supps[i]) <= 90){
            people ++;
        }
        i ++;
    }
    Alunno alunni[people];
    for (int i = 0;i < supps.size();i++){
        if (i > 0 && int(supps[i]) >= 65 && int(supps[i]) <= 90){
            index ++;
            count_v = 0;
        }
        else{
            if (supps[i] == ','){
                count_v ++;
                switch (count_v){
                    case 0:
                        alunni[index].nome = extract(start, i, supps);
                        break;
                    case 1:
                        alunni[index].eta = extract(start, i, supps);
                        break;
                    case 2:
                        alunni[index].n_matricola = extract(start, i, supps);
                        break;
                    case 3:
                        alunni[index].voto = extract(start, i, supps);
                        break;
                    default:
                        cout << "Ricontrolla il contatore count_v" << endl;
                        break;
                }
            }
        }
    }




    return 0;
}
string extract(int start, int end, string test){
    string result;
    for (int i = start;i < end;i ++){
        result.push_back(test[i]);
    }
    return result;
}