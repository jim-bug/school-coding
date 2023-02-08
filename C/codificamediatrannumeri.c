#include <stdio.h>
int main(){
int ite,somma=0,numero,i=0;
float media;
printf("Con quanti numeri vuoi fare la media\n");
scanf("%d",&ite);
while (i<ite){
  printf("Numero:  \n");
  scanf("%d",&numero);
  somma+=numero;
  i++;
}
media = (float) somma/ite;
printf("La media è %f",media);
return 0;
}
