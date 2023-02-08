#include <stdio.h>

int main()
{
int val;
int val1;
int size;
printf("Numero:   ");
scanf("%i",&val);
printf("Numero:   ");
scanf("%i",&val1);
if (val>val1){
    size = val - val1;
}
else
{
    size = val1 - val;
}

for(int i = 0;i < size;i++)
{
    if (val1>val)
    {
        val1 --;
        if(val1 == val)
        {
            break;
        }
        else
        {
            printf("Numero in ordine decrescente: %i\n",val1);
        }
        
    }
    else
    {
        val --;
        if(val1 == val)
        {
            break;
        }
        else
        {
            printf("Numero in ordine decrescente: %i\n",val);
        }
    }
}
return 0;
}



