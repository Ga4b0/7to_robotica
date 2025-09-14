import processing.serial.*;

Serial puerto;
float dato = 0.0 ;
float dato1 = 0.0 ;
float dato2 = 0.0 ;

String valor= "";

ArrayList<Float> g1 = new ArrayList<Float>();
ArrayList<Float> g2 = new ArrayList<Float>();
ArrayList<Float> g3 = new ArrayList<Float>();

int max = 100;

void setup(){
  size (600,300);
  puerto = new Serial(this, "COM5", 115200);
  puerto.bufferUntil('\n');
}

void draw(){
  background(255);
  textSize(16);
  noFill();

  float zonaAltura = height / 3; // dividimos la ventana en 3 zonas

  // --- GRAFICA 1: Dato original ---
  stroke(0,255,0);
  text("Dato original", 10, 20); // encabezado arriba de la zona
  beginShape();
  for (int i = 0; i < g1.size(); i++) {
    float y = map(g1.get(i), 0, 500, zonaAltura-10, 40); 
    vertex(i * (width / float(max)), y);
  }
  endShape();

  // --- GRAFICA 2: Dato mapeado 1-50 ---
  stroke(255,0,0);
  text("Dato mapeado (1-50)", 10, zonaAltura + 20); // encabezado
  beginShape();
  for (int i = 0; i < g2.size(); i++) {
    float y = map(g2.get(i), 0, 50, zonaAltura*2-10, zonaAltura + 40);
    vertex(i * (width / float(max)), y);
  }
  endShape();

  // --- GRAFICA 3: Dato mapeado 50-100 ---
  stroke(0,0,255);
  text("Dato mapeado (50-100)", 10, zonaAltura*2 + 20); // encabezado
  beginShape();
  for (int i = 0; i < g3.size(); i++) {
    float y = map(g3.get(i), 50, 100, height-10, zonaAltura*2 + 40);
    vertex(i * (width / float(max)), y);
  }
  endShape();

  // --- Mostrar valores numéricos a la derecha ---
  fill(0,255,0);
  text("Valor original: " + dato, 400, 20);
  fill(255,0,0);
  text("Valor mapeado 1-50: " + dato1, 400, 40);
  fill(0,0,255);
  text("Valor mapeado 50-100: " + dato2, 400, 60);
}



void serialEvent(Serial puerto){
  valor = puerto.readStringUntil('\n');
  if (valor != null ){
    dato = float(valor);
    dato1 = map (dato,1,500,1,50);
    dato2 = map (dato,1,500,50,100);

    g1.add(dato);
    g2.add(dato1);
    g3.add(dato2);
    
    if (g1.size() > max) g1.remove(0);
    if (g2.size() > max) g2.remove(0);
    if (g3.size() > max) g3.remove(0);
  }
}  
