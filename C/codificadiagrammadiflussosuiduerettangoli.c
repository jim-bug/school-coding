#include <stdio.h>
int main(){
int a1,a2,b,h,b1,h1,peri,peri1;
printf("Scegli in ordine sequenziale i seguenti dati separati da un backspace: baserettangolo1 e altezzarettangolo1 e baserettangolo2 e altezzarettangolo2\n");
scanf("%d%d%d%d",&b,&h,&b1,&h1);
a1 = b*h;
a2 = b1*h1;
peri = 2*(b)+ 2*(h);
peri1 = 2*(b1)+ 2*(h1);
printf("Il perimetro del rettangolo1 è:  %d\n", peri);
printf("Il perimetro del rettangolo2 è:  %d\n", peri1);
printf("Area rettangolo1: %d\n", a1);
printf("Area rettangolo2:  %d\n",a2);
if (a1==a2){
  printf("I due rettangoli hanno superifici uguali!");
}
else if (a1>a2){
    printf("Il rettangolo1 è quello con la superfice maggiore rispetto al rettangolo2!");
}
else{
    printf("Il rettangolo2 è quello con la superfice maggiore rispetto al rettangolo1!");
}
return 0;
}
