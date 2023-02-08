#include <stdio.h>
int main (){
int somma,n,a;
float media;
somma = 0;
n = 0;
// Media infinita di numeri
do{
    printf("Numero:   \n");
    scanf("%d", &a);
    somma+=a;
    n++;
    media=(float)somma/n;
    printf("Media:   %.1f\n",media);
    //printf("Media:   %.2f\n",media);
}
while (1);
return 0;
}

