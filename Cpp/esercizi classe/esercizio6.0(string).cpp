#include<iostream>
#include<string>
using namespace std;
bool there_is(string, string);
bool is_true(string);
int main(){
    // esercizio pag A180 n 51
    string s1="Ciao";
    string s2="iaa";
    cout<<there_is(s1, s2)<<endl;

    return 0;
}
bool is_true(string test){
    int counter = 0;
    for (int i = 0;i < test.size();i++){
        if (test[i] == test[i+1]){
        counter ++;
    }
    }
    if (counter == test.size()-1){return true;}
    else {return false;}
}

bool there_is(string s1, string s2){
    if (s2.size() > s1.size()){return false;}
    bool controll = is_true(s2);
    string control;
    for (int i = 0;i < s1.size();i++){
    for (int j = 0;j < s2.size();j++){
         if (controll){
            if (s1[i] == s2[j]){
            control.push_back(s1[i]);
            i ++;
        }
        }
        else{
                if (s1[i]==s2[j]){
                    control.push_back(s1[i]);
                }
        }
    }
}
if(control==s2){return true;}
else{return false;}
}