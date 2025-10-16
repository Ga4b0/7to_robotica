import processing.serial.*;

String dato="";

Serial puerto;


ArrayList<Float> datos = new ArrayList<Float>();
void setup(){
  size(600,400);
  puerto = new Serial(this,"COM5",115200);
  puerto.bufferUntil('\n');// limpiar buffer
  
}

void draw(){
  background(255);
  // lineas de referencia
  int ancho = 50;
  int espacio = 50;
  int base = 300;
  int x = 70;
  stroke(255,0,0);
  line(45,300,width -20, 300);
  line(45,30,45, 300);
  
  //grafico  
  for(int i=0;i<datos.size();i++){
    float altura = datos.get(i);
    if(altura >100){
      stroke(255,0,0);
      fill(200,0,0);
    }
    else{
      stroke(random(255));
      fill(random(255),random(255),random(255));
    }
    //texto
    stroke(0);
    textSize(24);
    text(altura, x+ancho/2 -25 ,base- altura - 10);
    //rect(x, base-altura,ancho,altura);
    float y = 300 - altura*2;
    strokeWeight(10);  
    point(x,y);
    x += ancho+espacio;
  }
  
 
}


void serialEvent(Serial puerto){ //escuchador 
  dato = puerto.readStringUntil('\n');
  if (dato != null){
    dato = trim(dato);
    println(dato);
    datos.add(float(dato));
    if(datos.size()> 5){
      datos.remove(0);
    }
    
  }
  
}
