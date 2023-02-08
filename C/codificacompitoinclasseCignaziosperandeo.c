#include <stdio.h>
int main (){
int a, conto, conto1, i;
conto = 0;
i = 0;
conto1 = 0;
for(i;i<10;i++){
    printf("Numero:   \n");
    scanf("%d",&a);
    if (a==0) {
        conto++;
} 
    else{
        conto1++;
}
}
printf("I zero sono:   %d\nI numeri diversi da 0 inseriti sono:  %d",conto,conto1);
return 0;
}
