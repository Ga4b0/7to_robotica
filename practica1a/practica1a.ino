void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  float dato = random(1,500)*1.0;
  //float dato1 = random(dato, 1,500,1,50);
  //float dato2 = random(dato, 1,500, 50,100);
  //Serial.println("dato: ");
  Serial.println(dato);
  /*Serial.println("dato1: ");
  Serial.println(dato1);
  Serial.println("dato2: ");
  Serial.println(dato2);*/
  delay(500);
}
