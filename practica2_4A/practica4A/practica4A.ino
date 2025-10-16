
#include <WiFi.h>

const char* ssid = "Mega-2.4G-57AE";
const char* password = "RT2tXTARhB";

WiFiServer serve(8888);
WiFiClient client;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  WiFi.begin(ssid,password);
  while(WiFi.status() != WL_CONNECTED){
    delay(1000);
    Serial.println("Conectandose....");
  }
  Serial.println("Cliente conectado");
  Serial.println(WiFi.localIP());
  //Es importante ingresar la linea de comando serve.begin() esto para iniciar el servidor y realizar peticiones
  serve.begin();
}

void loop() {
  // int r = random(0,255);
  int r = random(0,100);
  int g = random(0,255);
  int b = random(0,255);
  String colores = String(r) + "-" + String(g) + "-" + String(b);
  
  //Nota cuando el esp32 envia la informacion este se desconecta de WiFiClient
  //Por tal razon es necesario volver a inicializarlo con WiFiServer.available();
  if(!client || !client.connected()){
    //Vuelve a conectar
    client = serve.available();
  }
  client.println(r);
  Serial.println(r);
  delay(500);
}