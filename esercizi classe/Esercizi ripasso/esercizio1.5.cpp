#include <iostream>
using namespace std;
int control(int, int);
int main(){
	int x = 10;
    int y = 20;
    int r = control(x, y);
    int r1 = control(y, x);
    if(r == r1){
        cout << "Ritorno uguale" << endl;
    }
	return 0;
}
int control(int n, int m){
    int nu;
    if (n >= 0 && m >= 0) {
        nu = m + n;
        while (nu % m != 0) {
            if (nu % 2 == 0) {
                nu = nu + 2;
            } else {
                nu ++;
            }
        }
        return nu;
    }
    else{
        return 0;
    }
}