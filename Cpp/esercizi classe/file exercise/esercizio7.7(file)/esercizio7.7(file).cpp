#include <iostream>
#include <fstream>

using namespace std;
int main(){
    ifstream file;
    ofstream file_1;
    char supp;  // carattere di supporto
    char rimp;  // carattere sostiuitivo
    char sost;  // carattere da sostituire
    cout << "Inserisci il carattere da sostituire: " << endl;
    cin >> sost;
    cout << "Inserisci il carattere sostituitivo: " << endl;
    cin >> rimp;
    file.open("input.txt");
    file_1.open("output.txt");
    while (not file.eof()){
        file >> supp;
        if (supp == sost){
            file_1 << rimp;
        }
        else{
            file_1 << supp;
        }
    }
    file.close();
    file_1.close();
    return 0;
}