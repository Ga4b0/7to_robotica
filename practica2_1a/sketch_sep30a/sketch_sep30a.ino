
#include "BluetoothSerial.h"
BluetoothSerial conexion;
#include <DHT.h>
#define pin 32
#define DHTTYPE DHT11
DHT dht(pin,DHTTYPE);
String cad ="";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  dht.begin();
  conexion.begin("ESPGabo");
}

void loop() {
  delay(3000);  // Espera entre lecturas (mínimo 2 segundos para DHT11)
  
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  float tf = dht.readTemperature(true);
  
  
  Serial.print("Humedad: ");
  Serial.print(h);
  Serial.println(" %");
  
  Serial.print("Temperatura en °C: ");
  Serial.print(t);
  Serial.println(" °C");
  
  Serial.print("Temperatura en °F: ");
  Serial.print(tf);
  Serial.println(" °F");

  cad = String(h)+"-"+String(t)+"-"+String(tf);
  conexion.println(cad);

  
  delay(500);
}
