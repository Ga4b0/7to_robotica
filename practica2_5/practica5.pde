import processing.net.*;

ArrayList<Float> gra = new ArrayList<Float>();
Client cliente;
String valor = "0", dato = "";

float base = 300;   // altura base del gráfico
float espacio = 20; // separación entre puntos

void setup() {
  size(600, 400);
  try {
    cliente = new Client(this, "192.168.16.184", 12345);
    println("Conectado a la ESP32");
  } catch (Exception e) {
    println("Error 404");
  }
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(valor, width/2 - 40, 50);
  
  // Lectura de datos
  if (cliente.available() > 0) {
    String mens = cliente.readStringUntil('\n');
    if (mens != null) {
      dato = mens.trim();
      valor = dato;
      gra.add(float(dato));
      if (gra.size() > 20) {
        gra.remove(0);
      }
    }
  }

  // Dibujar los puntos
  float x = 50;
  stroke(0);
  fill(0, 200, 255);
  
  for (int i = 0; i < gra.size(); i++) {
    float y = gra.get(i);
    float puntoY = base - y;  // Invertir eje Y para que crezca hacia arriba
    
    ellipse(x, puntoY, 10, 10); // Dibuja el punto
    fill(0);
    textSize(14);
    text(int(y), x - 10, puntoY - 10); // Valor encima del punto
    
    x += espacio;
    fill(0, 200, 255);
  }

  // Dibujar eje base
  stroke(0);
  line(40, base, width - 40, base);
}
