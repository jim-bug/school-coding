// #include "tm1637.h"

#define CLK 3
#define DIO 2
#define PWM_PIN 11
#define VOLT 5.0
#define MAX_DIGIT 4
//TM1637 tm1637(CLK, DIO);
float n = 1;
float duty;
float v_eff;
int state = 0;
void setup(){
//	tm1637.init();
        Serial.begin(9600);
//        tm1637.set(BRIGHTEST);
	pinMode(PWM_PIN, OUTPUT);
}
void display(int num){
	int digit[MAX_DIGIT] = {0, 0, 0, 0};
	for(int i = MAX_DIGIT-1; i >= 0; i--){
		digit[i] = num%10;
		num /= 10;
	}
//	for(int i = 0;i < MAX_DIGIT; i++){
//		tm1637.display(i, digit[i]);
//	}

}

void loop(){
	duty = n/255.0;
	v_eff = sqrt(duty)*VOLT;
	analogWrite(PWM_PIN, n);
        if(n >= 250 || state){
		if(n <= 0){
			state = 0;
		}
                else{
			n --;
		}
	}
	else{
		n ++;
	}

	Serial.println(n);
}
