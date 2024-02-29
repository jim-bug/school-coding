#include <stdio.h>
#include <unistd.h>
int main() {
    pid_t pid;
    int a = 5;
    scanf("%d", &a);
    pid = fork();
    if(pid == 0){
        printf("%d", a);
    }
    else{
        printf("%d", a);
    }
    return 0;
}
