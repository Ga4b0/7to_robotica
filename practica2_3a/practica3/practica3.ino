
//#include "BluetoothSerial.h"
//BluetoothSerial conexion;
//#include <DHT.h>
#define pin 32
//#define DHTTYPE DHT11
//DHT dht(pin,DHTTYPE);
//String cad ="";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  //dht.begin();
  //conexion.begin("ESPGabo");
}

void loop() {
  delay(10);  // Espera entre lecturas (mínimo 2 segundos para DHT11)
  int h = analogRead(pin);
  float valor= map(h,1,4100,1,100);
  
  Serial.println(valor);
  delay(50);

}
