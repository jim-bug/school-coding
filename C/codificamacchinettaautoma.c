#include <stdio.h>
int main(){
float imp;
float somma;
int i;
imp = 0;
somma = 0;
i = 0;
printf("Questa macchinetta non dà resto, una merendina costa 1.00 euro, la macchinetta accetta solo monete da 0.10, 0.20, 0.50, 1.00\n");
while (i<10){
        printf("-%d inserisci importo:   ",i);
        scanf("%f",&imp);
        somma+=imp;
    if (somma>=1){
        printf("Merendina\n");
        break;
    }
    i++;

}
printf("Totale importo inserito %f la macchina non da resto stare attenti a ciò",somma);
return 0;
}
