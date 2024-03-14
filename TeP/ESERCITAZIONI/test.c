#include <stdio.h>
#include <curses.h>
#include <unistd.h>


void splitDigit(int num, char[]);

struct timeFormat{
    char secondi[2];
    char minuti[2];
    char ore[2];
    int secInt;
    int minInt;
    int oreInt;
};

int main(){
    // initscr();
    // noecho();
    // cbreak();
    // getch();
    struct timeFormat tm;
    tm.secInt = 0;
    tm.minInt = 0;
    tm.oreInt = 0;
    int i = 0;
    while(i < 5){
        printf("5");
        if(tm.secInt == 60){
            tm.secInt = 0;
            tm.minInt ++;
        }
        if(tm.minInt == 60){
            tm.minInt = 0;
            tm.oreInt ++;
        }
        if(tm.oreInt == 23){
            tm.oreInt = 0;
        }
        splitDigit(tm.oreInt, tm.ore);
        splitDigit(tm.minInt, tm.minuti);
        splitDigit(tm.secInt, tm.secondi);
        // move(10, 30);
        printf("%s::%s::%s\n", tm.ore, tm.minuti, tm.secondi);
        tm.secInt ++;
        //sleep(1);
        i++;
    }
}
void splitDigit(int num, char digit[]){
    for(int i = 1; i >= 0;i --){
        digit[i] = (num%10) + 48;
        num /= 10;
    }
}