#include <stdio.h>
#include <curses.h>
#include <unistd.h>


void splitDigit(int num, char[], int);

struct timeFormat{
    int centInt;
    int secInt;
    int minInt;
    int oreInt;
};

int main(){
     initscr();
     noecho();
     cbreak();
    struct timeFormat tm;
    tm.secInt = 0;
    tm.minInt = 0;
    tm.oreInt = 0;
    tm.centInt = 0;
    while(1){
        if(tm.centInt == 99){
            tm.centInt = 0;
            tm.secInt ++;
        }
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
        move(10, 30);
        printw("%02d::%02d::%02d::%02d", tm.oreInt, tm.minInt, tm.secInt, tm.centInt);
        tm.centInt ++;
        usleep(10000);
        refresh();
    }
    endwin();
}
