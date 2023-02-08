#include <stdio.h>
int main (){
int a;
int b;
int c;
int delta;
int numeratore, denominatore;
int resto, resto1;
int numeratore_1, denominatore_1;
int x, x1, x_1;
printf ("ax^2+bx+c=0 completa\nax^2+c=0 pura\nax^2+bx=0 spuria\n0x^2+0x+0=0 monomia\n");
printf ("a: b: c: \n");
scanf ("%d%d%d", &a,&b,&c);
if (a == 0 && b == 0 && c == 0){
    //monomia
    printf("Soluzione x^2 = 0");
}
else if (a == 0 && b != 0 && c != 0)
{
  // 1 grado
  printf("Equazione di 1 grado!");
}
else if (a!=0 && b!=0 && c!=0){
    //completa
    delta = pow (b, 2) - 4 * a * c;
    if (delta > 0)
    {
      x = -b - pow(delta,0.5);
      x_1 = -b + pow(delta,0.5);
      x1 = 2*a;
      numeratore = x;
      numeratore_1 = x_1;
      denominatore = x1;
      denominatore_1 = x1;
      while (denominatore!=0)
      {
        // calcolo di euclide
        resto = numeratore % denominatore;
        numeratore = denominatore;
        denominatore = resto;
        resto_1 = numeratore_1 % denominatore_1;
        numeratore_1 = denominatore_1;
        denominatore_1 = resto_1;
      }
      if (x % numeratore == 0 &&  x_1 % numeratore_1 == 0 && x1 % numeratore_1 == 0)
      {
            //controllo delle semplificazioni
            printf("Il tuo delta equivale a %d\nLe soluzioni della tua equazione sono: \nx1 = %d/%d\nx2 = %d/%d",delta,x/numeratore,x1/numeratore,x_1/numeratore,x1/numeratore);
      }
      else
      {
            printf("Il tuo delta equivale a %d\nLe soluzioni della tua equazione sono: \nx1 = %d/%d\nx2 = %d/%d",delta,x,x1,x_1,x1);
      }
    }
    else if (delta == 0)
    {
      x = -b;
      x1 = 2*a;
      numeratore = x;
      denominatore = x1;
      while (denominatore!=0)
      {
         // calcolo di euclide
        resto = numeratore % denominatore;
        numeratore = denominatore;
        denominatore = resto;
      }
      if (x % numeratore == 0 && x1 % numeratore == 0)
      {
        //controllo delle semplificazioni
        printf("Il tuo delta equivale a %d\nLe soluzioni della tua equazione sono: \nx1,2 = %d/%d",delta,x/numeratore,x1/numeratore);
      }
      else
      {
        printf("Il tuo delta equivale a %d\nLe soluzioni della tua equazione sono: \nx1 = %d/%d",delta,x,x1);
      }
    }
    else if (delta < 0)
    {
        //impossibile
      printf ("La tua equazione è impossibile!");
    }
}
else if (a!=0 && b == 0 && c!=0){
    //pura
    x = -c;
    x1 = a;
    numeratore = x;
    denominatore = x1;
    while (denominatore!=0){
        resto = numeratore % denominatore;
        numeratore = denominatore;
        denominatore = resto;
}
    if (x/numeratore<0 || x1/numeratore<0){
        printf("Soluzione impossibile");
    }
    else
    {
      if (x % numeratore == 0 && x1 % numeratore == 0)
      {
        //controllo delle semplificazioni
        printf("Soluzione di x1,2: ±√%d/%d",delta,x/numeratore,x1/numeratore);
      }
      else
      {
        printf("Soluzione di x1,2: ±√%d/%d",delta,x,x1);
      }
    }
}
else if (a!=0 && b!=0 && c==0)
{
    //spuria
    x = -b;
    x1 = a;
    numeratore = x;
    denominatore = x1;
    while (denominatore!=0)
    {
        //calcolo euclide
        resto = numeratore % denominatore;
        numeratore = denominatore;
        denominatore = resto;

}
    if (x % numeratore == 0 && x1 % numeratore == 0)
      {
        //controllo delle semplificazioni
        printf("Soluzione di x: 0\nSoluzione di x^2: %d/%d",x/numeratore,x1/numeratore);
      }
      else
      {
        printf("Soluzione di x: 0\nSoluzione di x^2: %d/%d",delta,x,x1);
      }
    
}
return 0;
}

