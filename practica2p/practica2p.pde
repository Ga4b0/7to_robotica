import processing.serial.*;

Serial puerto;
float dato = 0.0;
float dato1 = 0.0;

String valor = "";

ArrayList<Float> g1 = new ArrayList<Float>();

int max = 100;

void setup() {
  size(600, 300);
  puerto = new Serial(this, "COM5", 115200);
  puerto.bufferUntil('\n');
}

void draw() {
  background(255);
  textSize(16);
  fill(0);
  text("Valor original: " + dato1, 10, 20);

  // --- LÍNEA NEGRA (abajo) ---
  float lineaAbajo = height - 30;  // la bajo un poco más
  stroke(0); // negro
  line(0, lineaAbajo, width, lineaAbajo);

  // Mostrar valor de altura al lado derecho



  // --- LÍNEA ROJA (arriba) ---
  float lineaArriba = 80;  // un poco más abajo
  stroke(255, 0, 0); // rojo
  line(0, lineaArriba, width, lineaArriba);

  // Mostrar valor de altura al lado derecho
  fill(255, 0, 0);
  text("Y: " + nf(lineaArriba, 1, 1), width - 70, lineaArriba - 5);

  // --- GRAFICA 1: Dato original ---
  stroke(0, 255, 0);
  noFill();
  beginShape();
  for (int i = 0; i < g1.size(); i++) {
    float y = g1.get(i); 
    vertex(i * (width / float(max)), y);
  }
  endShape();
}

void serialEvent(Serial puerto) {
  valor = puerto.readStringUntil('\n');
  if (valor != null) {
    dato = float(valor);
    dato1 = map(dato, 1, 4095, height - 10, 100);

    g1.add(dato1);

    if (g1.size() > max) g1.remove(0);
  }
}
