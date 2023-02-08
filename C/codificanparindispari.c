#include <stdio.h>
int main(){
  int pari,dispari,ite,numero,i=0;
  printf("Quanti numeri vuoi confrontare:  \n");
  scanf("%d",&ite);
  while (i<ite){
    printf("Numero:  \n");
    scanf("%d",&numero);
    if (numero%2==0){
      pari++;
}
    else if (numero%2==1){
      dispari++;
}
}
printf("I numeri pari sono: %d\nI numeri dispari sono: %d",pari,dispari);
return 0;
}
