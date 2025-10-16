#define pin 34
String cad ="";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  delay(1000);  // Espera entre lecturas (mínimo 2 segundos para DHT11)
  int h = analogRead(pin);
  int h_mapeo = map(h,0,4095,1,280);
  Serial.println(h_mapeo);
  delay(500);
}