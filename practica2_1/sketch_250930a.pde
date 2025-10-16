import processing.serial.*;

Serial puerto;
String dato="";
String t="",h="",tf="";
int tope =30;
ArrayList<Float> temperatura = new ArrayList<Float>(); 
ArrayList<Float> humedad = new ArrayList<Float>();
ArrayList<Float> temperaturaF = new ArrayList<Float>(); 



void setup(){
  size(800,600);
 // print(puerto.list());
  puerto = new Serial(this,"COM10",115200);
  puerto.bufferUntil('\n');// limpiar buffer
}

void draw(){
  background(255,255,255);
  for(int x=0; x< humedad.size(); x = x++){
  fill(0);
  textSize(20);
  text("Humedad ",10,15);
  text(humedad.get(x),50,x*35);
  text("Temperatura ",50,15);
  text(temperatura.get(x),50,x*35);
  text("Temperatura F ",150,15);  
  text(temperaturaF.get(x),50,x*35);

  }
  /*
  fill(0);
  textSize(20);
  text("Humedad "+h+"%",10,15);
  text("Temperatura "+t,10,50);
  text("Temperatura F "+tf,10,90);
*/
  //text(h,30,10);

  stroke(0);
  line(410,550, 780,550);
  line(410,550, 780,550);
  
  if(temperatura.size() > 1){
    stroke(0,255,0);
    noFill();
    beginShape();
    for(int i = 0;i <temperatura.size() ;i++){
      
      text("Temperatura ",430,190);
      text(temperatura.get(i),430,225);
      
      float t = temperatura.get(i);
      float y = map(t,0,50,550,100);
      float x1 = map(i,0,tope,430,770);
      vertex(x1,y);
  }
   endShape(); 
  }

}
void serialEvent(Serial puerto){ //escuchador 
  dato = puerto.readStringUntil('\n');
  if (dato != null){
    dato = trim(dato);
    println(dato);
    String []val = dato.split("-");
    h=val[0];
    t=val[1];
    tf=val[2];
    humedad.add(float(h));
    temperatura.add(float(t));
    temperaturaF.add(float(tf));
    
    if(humedad.size()> tope){
      humedad.remove(0);
      temperatura.remove(0);
      temperaturaF.remove(0);

    }

    
  }
}
