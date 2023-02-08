#include <iostream>
using namespace std;
void control(int*, int*, int*);
int main(){
    // https://ticoprof.wordpress.com/2020/09/24/esercizi-con-le-funzioni-in-cpp/ es 15
    int im;
    int im1;
    int im2;
    cout << "Inserisci i 3 importi: ";
    cin >> im >> im1 >> im2;
    control(&im, &im1, &im2);
    cout << "Conti: " << im << " " << im1 << " " << im2 << endl;
    return 0;
}
void control(int *a, int *b, int *c){
    if (*b < 0){
        *a = *a + *b;  // metto + perchè se b è negativo e mettessi - succederebbe questo: *a = *a - (-*b) quindi si sommeranno
        *b = 0;
    }
    if (*c < 0){
        *a = *a + *c;
        *c = 0;
    }
}