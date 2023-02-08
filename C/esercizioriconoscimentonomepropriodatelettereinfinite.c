#include <stdio.h>
#include <string.h>
int main()
{
char lettera;
char scelta[2];
int index = 0;
int size;
int conta = 0;
printf("Inserisci la lunghezza del tuo nome:    ");
scanf("%i",&size);
char nome[size];
for(int i = 0;i<size;i++)
{
    printf("Lettera %i del tuo nome:  ",i);
    scanf(" %c",&nome[i]);
}
for(;;){
    printf("Lettera: ");
    scanf(" %c",&lettera);
    if (lettera == nome[index])
    {
        index++;
    } 
    else
    {
        index = 0;
    }
    if (index == size)
    {
        conta++;
        index = 0;
        printf("Nome trovato!\n");
    }
    printf("Vuoi continuare:    [si/no]");
    scanf("%s",scelta);
    if (strcmp(scelta,"si") == 0)
    {
        continue;
    }
    else if (strcmp(scelta,"no") == 0)
    {
        break;
    }
}

printf("Numero contato %d volta/e\n", conta);    
return 0;
}


