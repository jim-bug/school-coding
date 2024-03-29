#include <iostream> 
 #include <fstream> 
 #include <string> 
 #define MEDIAN_VALUE 21 
 #define MAX_LEN 30 
 using namespace std; 
 void order(int[], int); 
 int there_is(int, int); 
  
 struct Alunno{ 
     string nome;    // k caratteri 
     string matricola;   // 9 caratteri 
     string eta;         // 2 caratteri 
     int voto;        // 2 caratteri 
 };  // totale caratteri possibili: 13k 
  
 int main(){ 
     ifstream file("risultati.csv"); 
     ofstream file_ou("Risultato ordinati.txt"); 
     string temp;
     string data;
     char chars[MAX_LEN];
     char support; 
     int index = 0; 
     int count_div = -1; 
     int n_people = 0; 
     int i = 0;
    
     while (file >> support){ 
         if (int(support) >= 65 && int(support) <= 90){ 
             n_people ++; 
         } 
     }
    
     file.close();  // chiudendo il file reiposto l'offset all'inizio del file. 
     file.open("risultati.csv"); 
     int date[n_people];
     Alunno alunni[n_people]; 
     file.getline(chars, MEDIAN_VALUE); 
     while (true){ 
         if (int(chars[i]) == 0) { 
             file.getline(chars, MEDIAN_VALUE); 
             index++; 
             count_div = -1; 
             i = 0; 
         } 
         if (index >= n_people){ 
             break; 
         } 
         while (chars[i] != ',') { 
             if (int(chars[i]) == 0){
                 i --;
                 break; 
             } 
             temp.push_back(chars[i]); 
             i++; 
         } 
         count_div++; 
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
                 alunni[index].voto = stoi(temp); 
                 break; 
         } 
         temp.clear(); 
         i ++; 
     } 
      
     for (int i = 0;i < n_people;i++){ 
         date[i] = alunni[i].voto; 
     }
    
     order(date, n_people); 
     for (int i = 0;i < n_people;i++){ 
         for (int j = 0;j < n_people;j++){ 
             if (date[i] == alunni[j].voto){ 
                 file_ou << "Nome: " << alunni[j].nome << endl << "Matricola: " << alunni[j].matricola << endl << "Età: " << alunni[j].eta << endl << "Voto: " << alunni[j].voto << endl << endl; 
             } 
         } 
     }
    
     file.close(); 
     file_ou.close(); 
  
     return 0; 
 } 
 void order(int vet[], int l){ 
     for (int i = 0;i < l;i++){
         for (int j = i+1;j < l;j++) {
             if (vet[i] < vet[j]) {
                 int temp = vet[i];
                 vet[i] = vet[j];
                 vet[j] = temp;
             }
         }
     } 
 }