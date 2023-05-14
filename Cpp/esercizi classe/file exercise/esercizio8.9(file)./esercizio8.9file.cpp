#include <iostream>
#include <fstream>
#include <string>
using namespace std;
struct Alunno{
    string nome;    //
    string matricola;   // 9 caratteri
    string eta;         // 2 caratteri
    string voto;        // 2 caratteri
};
int main(){
    ifstream file("risultati.csv");
    string temp;
    char support;
    int index = -1;
    int count_div = -1;
    string data;
    char chars[100];
    int n_people = 0;
    while (file.eof()) {
        file >> support;
        if (int(support) >= 65 && int(support) <= 90) {
            n_people++;
        }
    }
    Alunno alunni[n_people];
    int i = 0;
    file.getline(chars, 100);
    do {
        if (chars[i] == '/r'){
            file.getline(chars, 100);
            index ++;
            count_div = -1;
        }
        while (chars[i] != ','){
            temp.push_back(chars[i]);
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
        temp.clear();
    }
    while(index < n_people);
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
