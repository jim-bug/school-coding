#include <Wire.h>
#include "RTClib.h"
/*
* Autore: Ignazio Leonardo Calogero Sperandeo
* Data: 03/04/2024
*/
RTC_DS1307 rtc;
char orario[10];

void setup() {
  Serial.begin(9600);
  if(!rtc.begin()){
    Serial.println("ERRORE!");
    while(1);
  }
  else{
    if(!rtc.isrunning()){   // se il chip non ha dati
        rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));   // DATE e TIME sono della costanti che indicano il tempo e la data di compilazione del sorgente 
      // rtc.adjust(DateTime(2024, 4, 3, 12, 0, 12));
    }
  }
}

void loop() {
  DateTime now = rtc.now();
  Serial.print("Anno: ");
  Serial.print(now.year(), DEC);
  Serial.print("  Mese: ");
  Serial.print(now.month(), DEC);
  Serial.print("  Giorno: ");
  Serial.print(now.day(), DEC);
  snprintf(orario, sizeof(orario) ,"%02d:%02d:%02d", now.hour(), now.minute(), now.second());
  Serial.println("\nORARIO: ");
  Serial.print(orario);
  Serial.println("\n##########################");
  delay(1000);
}
