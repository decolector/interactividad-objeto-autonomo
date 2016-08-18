int potx = 0;
int poty = 1;
int valx = 0;
int valy = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(potx, INPUT);
  pinMode(poty, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  valx = analogRead(potx);
  valy = analogRead(poty);
  Serial.print(valx);
  Serial.print(",");
  Serial.println(valy);
  delay(100);
}
