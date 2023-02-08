#include <stdio.h>
int main(){
  int ore,paganetta;//,totsoldi;
  const short paga_lorda = 15;
  printf("Quante ore hai lavorato oggi?   \n");
  scanf("%i",&ore);
  //totsoldi = paga_lorda*ore;
  paganetta = (paga_lorda*ore)-(paga_lorda*ore)*27/100;//si poteva mettere totsoldi-totsoldi*27/100 ma con questo metodo abbiamo risparmiato una variabile
  printf("La paga totale della tua giornata levato il ventisettepercento è equivalente a: %d", paganetta);
  return 0;
}
