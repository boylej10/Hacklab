PShape obj;


void setup(){
  size(800,600,P3D);
  background(0);
  
  
  obj = loadShape("sanicdoesntknow.obj");
  obj.scale(50);

}

void draw(){
  background(0);
  lights();
  
  directionalLight(126,6,126,0,0,-1);
  ambientLight(255,255,255);
  translate(width/2, height/2);
  
  rotateX(frameCount*0.3);
  rotateY(frameCount*0.1);
  
  shape(obj);
  
  
  
}

void keyPressed(){
  
  
}