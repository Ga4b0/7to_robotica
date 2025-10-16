#define btn 2
#define bu 4
bool bandera = false;

void setup() {
  pinMode(btn,INPUT);
  pinMode(bu,OUTPUT);
  Serial.begin(115200);
}

void loop() {
  int estado = digitalRead(btn);
  delay(500);
  if (estado == 1){
    bandera = !bandera;
    if (bandera== true){
      tone(bu,2000);
      Serial.println("sonido");
    }
    
  }else{
      noTone(bu);
    
  }
  
}