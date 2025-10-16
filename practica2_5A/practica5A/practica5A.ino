#include<WiFi.h>

const char* ssid = "informatica7";
const char* password = "Info_@@7";
WiFiServer server(12345);
WiFiClient cliente;

#define btn 2
#define bu 4
bool bandera = false;

void setup() {
  pinMode(btn,INPUT);
  pinMode(bu,OUTPUT);
  Serial.begin(115200);
  WiFi.begin(ssid,password);
  while(WiFi.status() != WL_CONNECTED){
    delay(1000);
  }
  Serial.println(WiFi.localIP());
  server.begin();


}

void loop() {
  int estado = digitalRead(btn);
  int g = random(1,255);
  delay(100);
  if (estado == 1 || bandera == true){
    Serial.println("btn clic");
    if (estado == 1){   
      Serial.println("Cambia bandera"); 
      bandera = !bandera;
      Serial.print("Bandera: ");
      Serial.println(bandera);
      delay(500);
      }
    if (bandera== true){
      tone(bu,2000);
      Serial.println("sonido");
      delay(1000);
      noTone(bu);
      if (!cliente || !cliente.connected()){
        cliente =server.available();
      }
      cliente.println(g);
    }
    
  }else{
    bandera = false;
    noTone(bu);
    
  }
  
}