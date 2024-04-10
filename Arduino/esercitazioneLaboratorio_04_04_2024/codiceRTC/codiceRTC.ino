#include <Wire.h>
#include "RTClib.h"
#include "TM1637.h"
/*
* Autori:
* Alessandro Cangiamila
* Davide D'Alessandro
* Francesco Di Giovanni
* Sebastian Gherasim
* Ignazio Leonardo Calogero Sperandeo
* Data: 03/04/2024
* Consegna: Progettare un circuito con Arduino, che permette all'utente di mediante la pressione di un pulsante, di visualizzare le ore e i minuti in un display a 7 segmenti. Con una seconda pressione
* il sistema deve permettere di visualizzare sul display a 7 segmenti i minuti e i secondi.
*/

#define STR_LENGTH 4
#define CLK 3
#define DIO 2
#define MAX_DIGIT 4
#define PIN_SWITCH 13

TM1637 tm1637(CLK, DIO);
RTC_DS3231 rtc;

int stateSwitch;
int count = 1;    // impostandolo a 1, visualizzerò per prima ore-minuti
int displayNum;
void setup() 
{
  Serial.begin(9600);
  pinMode(PIN_SWITCH, INPUT);
  if(!rtc.begin()){		// eventuali errori di cablaggio del modulo, metto in attesa.
    Serial.println("ERRORE!");
    while(1);
  }
  // lo faccio partire da 05/05/2024 ore: 11:24:00
  rtc.adjust(DateTime(2024, 5, 5, 11, 24, 0));   // DATE e TIME sono della costanti che indicano il tempo e la data di compilazione del sorgente 
  tm1637.init();
  tm1637.set(BRIGHTEST);
  tm1637.point(true);  		// accendi i : presenti sul modulo.
}

void loop()
{
  DateTime date = rtc.now();   // ottengo la data e ora corrente.
  stateSwitch = digitalRead(PIN_SWITCH);	// leggo lo state del pin 13
  if(stateSwitch)   // se clicco il pulsante, dato che count è già a 1, visualizzerò minuti-secondi
  {
    count ++;
  }
  switch (count)
  {
    case 1:
      displayNum = date.hour()*100 + date.minute();
      break;
    case 2:
      displayNum = date.minute()*100 + date.second();
      break;
    default:
      count = 1;
      break;
  }
  display(displayNum);
  Serial.println(count);  // piccolo debug con il monitor seriale.
  delay(50);
}

void display(int num)
{
    int digit[4] = {0, 0, 0, 0};
    for (int i = MAX_DIGIT-1; i>=0;i--)
    {
        digit[i] = num%10;    // ricavo la cifra del numero.
        num /= 10;  
    }  
    for(int i = 0;i < MAX_DIGIT;i++)
    {
      tm1637.display(i, digit[i]);  // mando sul segmento i-esimo la i-esima cifra del numero, sarà visualizzata in ordine in quanto il range va da 0-3.
    }
}