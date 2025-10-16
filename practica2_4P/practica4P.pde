//192.168.16.184
//import java.net.*;
//import java.io.*;
import processing.net.*;
ArrayList<Float> gra = new ArrayList<Float>();

Client cliente;
//BufferedReader leer;
String dato = "";
int r = 255;
int g = 255;
int b = 255;



void setup(){
  size(600,400);
  try{
    cliente = new Client(this,"192.168.16.184",8888);
    println("conectado a la ESP32");
  
 }catch(Exception e){
    println("Error 404");
    //leer = new BufferedReader(new InputStreamReader(socket.getInputStream()));
  }
}

void draw(){
  int base = 300;
  int x = 100;
  int ancho = 50;
  int espacio = 50;;
  background(r,g,b);
  textSize(12);
  fill(0,0,0);
  text("grafica Bonita: ",20 ,15);
  if (cliente.available()>0){
    String mens = cliente.readStringUntil('\n');
    if (mens != null){
      dato = mens.trim();
      gra.add(float(dato));
      if (gra.size()>20){
        gra.remove(0);
      }
      //String []d=dato.split("-");
      /*r = int(d[0]);
      g = int(d[1]);
      b = int(d[2]);

      println(d[0]);
      println(d[1]);
      println(d[2]);*/
      //dato= "";

    }  
  }else{
    println("error al leer");
  }
  /*
  noFill();
  beginShape();
  for (int i = 0; i < gra.size(); i++) {
    float y = gra.get(i); 
    vertex(i * (width / float(20)), y);
  }
  endShape();*/
  
  for (int i = 0; i < gra.size(); i++) {
    float y = gra.get(i); 
    stroke(255);
    fill(10,255,80);
    rect(x, base-y,ancho,y);
    x+= espacio;
    fill(0);
    textSize(24);
    text(int(y), x+ancho/2 -75 ,base- y - 10);

  }
}
