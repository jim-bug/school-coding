#include <stdio.h>
int main(){
int h;
int k;
//printf("Ascensore a due piani, piggia 0 per dire no, piggia 1 per dire si, se si inserisce due volte 1 l'Ascensore scenderà\n");
printf("Inserisci 1 per salire all'inizio e 0 per voler scendere N.B. se inserisci due volte 1 l'ascensore scende.\n");
scanf("%d%d",&h,&k);
if (h==1 && k==0){
  printf("Piano 1!\n");
  printf("Scendi?\n");
  scanf("%d",&k);
  if (k==1){
    printf("Piano terra!");
  }
  else{
    printf("Piano 1");
  }
}
else if (h==0 && k==1 || h==1 && k==1 || h==0 && k==0){
  printf("Piano terra!");
}
return 0;
}
