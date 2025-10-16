int valor = 50;
int valor2 = 100;
int valor3 = 200;
int valor4 = 80;

void setup(){
  size(600,400);
}

void draw(){
  background(255,255,255);
  stroke(255,0,0);
  line(45, 300, width -20, 300);
  line(45, 30, 45, 300);
  
  fill(0);
  textSize(24);
  text(valor, 60,250 -10);
  stroke(0);
  rect(50,250,50,valor);
  
  fill(220,100,23);
  text(valor2, 125,200 -10);
  stroke(200);
  rect(120,200,50,valor2);
  
  fill(80,100,20);
  text(valor3, 200,100 -10);
  stroke(250);
  rect(190,100,50,valor3);
  
  fill(180,80,130);
  text(valor4, 270,220 -10);
  stroke(250);
  rect(260,220,50,valor4);
}
