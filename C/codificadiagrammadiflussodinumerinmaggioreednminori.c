#include <stdio.h>
int main(){
int n, max, min;
short cond;
printf("Inserisci il primo numero:   \n");
scanf("%d",&n);
max = n;
min = n;
//for(;;){} oppure do{}while(1);
while(1) {
  printf("Numero:  \n");
  scanf("%d",&n);
  if (n>max) {
      max = n;
      printf("Maggiore:  %d\n",max);
      //printf("Minore:  %d\n",min);
  }
  else{
     min = n;
     //printf("Maggiore:  %d\n",max);
     printf("Minore:  %d\n",min);
  }
  printf("Vuoi continuare?   S=1/N=0\n");
  scanf("%hd",&cond);
  if (cond == 1){
    continue;
  }
  else{
    break;
  }
}
return 0;
}
