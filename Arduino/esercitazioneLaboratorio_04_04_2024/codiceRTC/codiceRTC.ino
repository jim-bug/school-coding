#include <Wire.h>
#include "RTClib.h"
#include "TM1637.h"
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 03/04/2024
*/
#define TIME_LENGTH 10
#define N_MONTH 12 
#define N_DAY 7
#define STR_LENGTH 4
#define CLK 3
#define DIO 2
#define MAX_DIGIT 4
#define PIN_SWITCH 13

TM1637 tm1637(CLK, DIO);
RTC_DS3231 rtc;

char orario[TIME_LENGTH];
char mesi[N_MONTH][STR_LENGTH] = {"GEN", "FEB", "MAR", "APR", "MAG", "GIU", "LUG", "AGO", "SET", "OTT", "NOV", "DIC"};
char dayWeek[N_DAY][STR_LENGTH] = {"dom", "lun", "mar", "mer", "gio", "ven", "sab"};
int stateSwitch;
int count = 0;
int num;
void setup() 
{
  Serial.begin(9600);
  pinMode(13, INPUT);
  if(!rtc.begin()){
    Serial.println("ERRORE!");
    while(1);
  }
  rtc.adjust(DateTime(2024, 5, 5, 11, 24, 0));   // DATE e TIME sono della costanti che indicano il tempo e la data di compilazione del sorgente 
  tm1637.init();
  tm1637.set(BRIGHTEST);
  tm1637.point(true);  
}

void loop() {
  DateTime date = rtc.now();   // ottengo la data e ora corrente.
  stateSwitch = digitalRead(13);
  if(stateSwitch){
      count ++;
  }
  switch (count){
    case 1:
      num = date.hour()*100 + date.minute();
      break;
    case 2:
      num = date.minute()*100 + date.second();
      break;
    default:
      count = 0;
      break;
  }
  display(num);
  delay(200);
  /*
  Serial.print("Anno: ");
  Serial.print(now.year(), DEC);
  Serial.print("  Mese: ");
  Serial.print(mesi[now.month() -1]);
  Serial.print("  Giorno: ");
  Serial.print(dayWeek[now.dayOfTheWeek()]);
  snprintf(orario, sizeof(orario) ,"%02d:%02d:%02d", now.hour(), now.minute(), now.second()); // assegno a orario quella stringa formattata.
  Serial.println("\nORARIO: ");
  Serial.print(orario);
  Serial.println("\n##########################");
  */
  Serial.println(num);

  // delay(1000);
}

void display(int num){
    int digit[4] = {0, 0, 0, 0};
    for (int i = MAX_DIGIT-1; i>=0;i--){
        digit[i] = num%10;
        num /= 10;  
    }  
    for(int i = 0;i < MAX_DIGIT;i++){
      tm1637.display(i, digit[i]);  
    }
}
