int pot = 0;
int val = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(pot, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(pot);

  Serial.println(val);
  delay(100);
}
