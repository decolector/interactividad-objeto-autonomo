/*
  Analog Input
 Demonstrates analog input by reading an analog sensor on analog pin 0 and
 turning on and off a light emitting diode(LED)  connected to digital pin 13.
 The amount of time the LED will be on and off depends on
 the value obtained by analogRead().

 The circuit:
 * Potentiometer attached to analog input 0
 * center pin of the potentiometer to the analog pin
 * one side pin (either one) to ground
 * the other side pin to +5V
 * LED anode (long leg) attached to digital output 13
 * LED cathode (short leg) attached to ground

 * Note: because most Arduinos have a built-in LED attached
 to pin 13 on the board, the LED is optional.


 Created by David Cuartielles
 modified 30 Aug 2011
 By Tom Igoe

 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/AnalogInput

 */

int sensorPin = A0;    // select the input pin for the potentiometer
int outPin = 3;      // select the pin for the LED
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  // declare the ledPin as an OUTPUT:
  pinMode(outPin, OUTPUT);
  Serial.begin(9600);
}

 void loop() {
 while (Serial.available()) { // If data is available to read,
  val = Serial.read(); // read it and store it in val
  }
  analogWrite(outPin, val);
  delay(100); // Wait 100 milliseconds for next reading
 }

/*
 
 void loop() {
 while (Serial.available()) { // If data is available to read,
  val = Serial.read(); // read it and store it in val
  }
  float freq = map(sensorValue, 0, 1023, 20, 10000);
  tone(outPin, freq);
  //Serial.println(sensorValue/4);
  //delay(10);
 }
*/

