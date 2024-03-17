#include <stdio.h>
#include <curses.h>
#include <unistd.h>
#include <stdlib.h>

/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 17/03/2024
* Consegna: Scrivere in C un programma che faccia da cronometro al centesimo di secondo, che segni anche i tempi parziali. 
* Note: durante lo svolgimento di questo esercizio sono state visionate le doc delle libreria curses.h e unistd.h
* by jim_bug :)
*/

struct timeFormat{
    int centInt;
    int secInt;
    int minInt;
    int oreInt;
};
int state = 0;
int line = 0;
struct timeFormat time = {0, 0, 0, 0};

void printData();
void menu();

int main(){
    initscr();
    noecho();		// nasconde ciò che l'utente manda in input
    nodelay(stdscr, TRUE);      // imposto il getch come non bloccante, quindi anche se non si preme nessun tasto il programma continua l'esecuzione.
    cbreak();		// evita di premere invio per effettuare mandare l'input.
    printw("Start(s)    Stop(b)     Reset(r)     End(e)");
    while(1){
        printData();
        refresh();
    }
    // return 0;
}
void printData(){
    menu();
    if(state == 1){
        if (time.centInt == 99) {
            time.centInt = 0;
            time.secInt++;
        }
        if (time.secInt == 60) {
            time.secInt = 0;
            time.minInt++;
        }
        if (time.minInt == 60) {
            time.minInt = 0;
            time.oreInt++;
        }
        if (time.oreInt == 24) {
            time.oreInt = 0;
        }
        move(10, 30);
        printw("%02d::%02d::%02d::%02d", time.oreInt, time.minInt, time.secInt, time.centInt);
        time.centInt ++;
        refresh();
        usleep(10000);
    }

}
void menu(){
    switch(getch()){
        case 's':	// avvia il cronometro
            state = 1;
            break;
        case 'b':	// ferma il cronometro
            state = 0;
	    move(14, 20);
            printw("Tempi parziali: ");
	    move(15+line, 20);
            // int x, y;	// piccolo debug per la posizione
            // getyx(stdscr, y, x);
	    printw("%02d::%02d::%02d::%02d", time.oreInt, time.minInt, time.secInt, time.centInt);
            line ++;
	    refresh();
            break;
        case 'r':	// resetta il cronometro
            time.centInt = time.secInt = time.minInt = time.oreInt = 0;
	    /*
		Questo ciclo si sposta alla posizione 15, 20 e cancella la riga ogni volta che cancella la riga, quella di sotto viene spostata su,
                in questa maniera elimino tutti i tempi parziali della sessione del cronometro precedente.
	    */
	    for(int i = 0; i < line; i++){
		move(15, 20);
		deleteln();
                refresh();
	    }
	    line = 0;
            break;
        case 'e':
            endwin();       // chiudo la finestra ncurses
            exit(0);
            break;
    }
}
