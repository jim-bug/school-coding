#include <stdio.h>

int main()
{
    int nums;
    int nums_1;
    int sottr;
    printf("Numero:    ");
    scanf("%i",&nums);
    printf("Numero:    ");
    scanf("%i",&nums_1);
    if (nums > nums)
    {
        sottr = nums - nums_1;
    }
    else
    {
        sottr = nums_1 - nums;
    }
    int vet[sottr];
    for(int i = 0;i < sottr;i++)
    {
        if (nums > nums_1)
        {
            nums --;
            if (nums == nums_1)
            {
                break;
            }
            else
            {
                vet[i] = nums;
            }
        }
        else
        {
            nums_1 --;
            if (nums == nums_1)
            {
                break;
            }
            else
            {
                vet[i] = nums_1;
            }
        }
        printf("Numero in ordine descrescente: %i\n",vet[i]);
    }
    return 0;
}





