#include <iostream>
#include <fstream>
#include <string>
using namespace std;
struct Alunno{
    string nome;
    string matricola;
    string eta;
    string voto;
};
int main(){
    ifstream file("risultati.csv");
    string temp;
    char support;
    int index = 0;
    int count_div = -1;
    string data;
    int n_people = 0;
    while (file >> support){
        if (int(support) >= 65 && int(support) <= 90){
            n_people ++;
        }
        data.push_back(support);
    }
    Alunno alunni[n_people];
    for (int i = 0;i < data.size();i++){
        if (i > 0 && int(support) >= 65 && int(support) <= 90){
            index ++;
            count_div = -1;
        }
        else{
            while (data[i] != ','){
                temp.push_back(data[i]);
                i ++;
            }
            count_div ++;
            switch (count_div) {
                case 0:
                    alunni[index].nome = temp;
                    break;
                case 1:
                    alunni[index].matricola = temp;
                    break;
                case 2:
                    alunni[index].eta = temp;
                    break;
                case 3:
                    alunni[index].voto = temp;
                    break;
            }
            // count_div ++;
            temp.clear();
        }
    }

    for (int i = 0;i < n_people;i++){
        cout << alunni[i].nome << endl;
        cout << alunni[i].matricola << endl;
        cout << alunni[i].eta << endl;
        cout << alunni[i].voto << endl;
        cout << endl;
    }
    file.close();
    return 0;
}