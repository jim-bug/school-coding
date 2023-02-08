#include <stdio.h>
int main(){
  short postiplatea,costi1,costi2,incasso;
  const short posticinema = 550, postigalleria = 250;
  postiplatea = posticinema-postigalleria;
  costi1 = 8;
  costi2 = costi1+2;
  incasso = (postiplatea*costi1) + (postigalleria*costi2);
  printf("Incasso del giorno:   %hd", incasso);
  return 0;
}
