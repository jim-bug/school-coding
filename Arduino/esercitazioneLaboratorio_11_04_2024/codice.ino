#include <Wire.h>
#include "RTClib.h"
#include "TM1637.h"
/*
* Autore: Ignazio Leonardo Calogero Sperandeo.
* Data: 11/04/2024
* Consegna: Visualizzare su un display 4 digit a 7 segmenti l'orario in formato ore e minuti e mediante l'ausilio di due pulsanti incrementare ore o minuti.
*/


#define BUTTON_SWITCH_HOUR 13
#define BUTTON_SWITCH_MINUTE 10
#define CLK 3
#define DIO 2
#define MAX_DIGIT 4
TM1637 tm1637(CLK, DIO);
RTC_DS1307 time;
DateTime tm;
int displayNum;
int hour;
int minute;


void setup() {
  Serial.begin(9600);
  tm1637.init();
  tm1637.set(BRIGHTEST);
  tm1637.point(true);
  pinMode(BUTTON_SWITCH_HOUR, INPUT);
  pinMode(BUTTON_SWITCH_MINUTE, INPUT);
  if(!time.begin()){
    Serial.println("ERRORE NEL CABLAGGIO DEL MODULO RTC.");
    while(1);
  }
  time.adjust(DateTime(2024, 04, 10, 22, 10, 0));
  tm = time.now();
  hour = tm.hour();
  minute = tm.minute();
}

void display(int num){
  int digit[MAX_DIGIT] = {0, 0, 0, 0};
  for(int i = MAX_DIGIT-1; i >= 0; i--){
    digit[i] = num%10;
    num /= 10;
    // tm1637.display((MAX_DIGIT-1)-i, digit[(MAX_DIGIT-1)-i]);
  }
  for(int i = 0; i < MAX_DIGIT; i++){
    tm1637.display(i, digit[i]);
  }
}
void setTime(){
  int stateHour = digitalRead(BUTTON_SWITCH_HOUR);
  int stateMinute = digitalRead(BUTTON_SWITCH_MINUTE);
  
  if(stateHour){
    hour ++;
    if(hour >= 24){
      hour = 0;
    }
  }
  if(stateMinute){
    minute ++;
    if(minute > 60){
      minute = 0;
    }
  }
  if(stateHour || stateMinute){
    /*
    Solo se modifico l'orario, faccio partire l'orario dell'RTC dal l'orario presente nel setup,
    ma con ore o minuti modificati.
    */
      time.adjust(DateTime(2024, 4, 10, hour, minute, 0));
  }

}
void loop() {
  setTime();
  tm = time.now();    // istanzio un nuovo oggetto DateTime in modo tale da poter rappresentare l'orario corrente modificato o non
  displayNum = (tm.hour()*100) + tm.minute();
  display(displayNum);
  delay(50);
}
