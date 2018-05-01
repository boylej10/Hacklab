//L293D
//Motor A
const int motorPin1  = 5;  // Pin 14 of L293
const int motorPin2  = 6;  // Pin 10 of L293
//Motor B
const int motorPin3  = 10; // Pin  7 of L293
const int motorPin4  = 9;  // Pin  2 of L293
//Photocell
const int LIGHT_PIN = A0;
const int LED_PIN = 13;
//Read Photocell
const float VCC = 4.98;
const float R_DIV = 4660.0;
//Resistance Threshold
const float DARK_THRESHOLD = 12000.0;

String readString; 

void setup() {
    //Set pins as outputs
    pinMode(motorPin1, OUTPUT);
    pinMode(motorPin2, OUTPUT);
    pinMode(motorPin3, OUTPUT);
    pinMode(motorPin4, OUTPUT);
    pinMode(13, OUTPUT);

    pinMode(LIGHT_PIN, INPUT);
    pinMode(LED_PIN, OUTPUT);

    

    Serial.begin(9600); //Serial read rate

}

void loop() {

  int lightADC = analogRead(LIGHT_PIN);
  if (lightADC > 0){
    float lightV = lightADC * VCC / 1023.0;
    float lightR = R_DIV * (VCC / lightV - 1.0);
    Serial.println("Voltage: " + String(lightV) + " V");
    Serial.println("Resistance: " + String(lightR) + " ohms");

    if (lightR >= DARK_THRESHOLD){
        //while (!Serial.available()) {}

        //while (Serial.available()){
          if (Serial.available() >1){
            char c = Serial.read();
            Serial.flush();
            digitalWrite(13, HIGH);
            delay(200);
            digitalWrite(13, LOW);
        
            digitalWrite(motorPin1, HIGH);
            digitalWrite(motorPin2, LOW);
            digitalWrite(motorPin3, LOW);
            digitalWrite(motorPin4, HIGH);
            delay(500); 
            
            //And this code will stop motors
            digitalWrite(motorPin1, LOW);
            digitalWrite(motorPin2, LOW);
            digitalWrite(motorPin3, LOW);
            digitalWrite(motorPin4, LOW);

            delay(1000);

          
          }
        }







      
//      digitalWrite(motorPin1, LOW);
//      digitalWrite(motorPin2, HIGH);
//      digitalWrite(motorPin3, LOW);
//      digitalWrite(motorPin4, HIGH);
//      
//      delay(1500); 
//            
//      //And this code will stop motors
//      digitalWrite(motorPin1, LOW);
//      digitalWrite(motorPin2, LOW);
//      digitalWrite(motorPin3, LOW);
//      digitalWrite(motorPin4, LOW);
//
//      delay(5000);
      
      //readString = c;
    }
    else{
      Serial.flush();
      digitalWrite(motorPin1, LOW);
      digitalWrite(motorPin2, LOW);
      digitalWrite(motorPin3, LOW);
      digitalWrite(motorPin4, LOW);
            }
      

    //Serial.println();
    delay(500);
  }
  

