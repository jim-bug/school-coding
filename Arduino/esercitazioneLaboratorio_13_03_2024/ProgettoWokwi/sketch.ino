#include "TM1637.h"

#define CLK 6
#define DIO 7
#define MAX_DIGIT 4

TM1637 tm1637(CLK, DIO);
int valore;
int digit[MAX_DIGIT];

void setup() {
  tm1637.init();
  tm1637.set(BRIGHTEST);     //BRIGHT_TYPICAL = 2,BRIGHT_DARKEST = 0,BRIGHTEST = 7;
  Serial.begin(9600);
  Serial.println("Inserisci un numero a 4 cifre: ");
}

void display(int num) {
  for(int i = MAX_DIGIT-1; i>=0;i--){
    digit[i] = num%10;
    num /= 10;
  }
  for(int i = 0; i < MAX_DIGIT; i++){
    tm1637.display(i, digit[i]);
  }
}

void loop() {
  
  if (Serial.available() > 0) {
    valore = Serial.parseInt();
      if(valore > 9999){
        valore = 0;
    }
    Serial.println(valore);

    while(Serial.available() > 0){  // pulisco il buffer
      Serial.read();
    }
    Serial.println("Inserisci un numero a 4 cifre: ");  // non influsisce sulla lettura del numero, in quanto .parseInt() identifica solo interi.
  }
  display(valore);
  // tm1637.displayNum(valore);
  delay(1000);
}
