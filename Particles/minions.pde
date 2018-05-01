PImage img;

ArrayList <Particle> minions;

void setup(){
  size(1080,720);
background(0);
  image(img,-200,-300);
  
  minions = new ArrayList<Particle>();
  
  img = loadImage("vw.jpg");
  
}

void draw(){
  
  for (Particle p: minions){
    p.update(); //run the update method
    p.display(); //display the particle
  }
  
  
}

void keyPressed(){
  saveFrame("image-###.jpg"); 
}  

void mousePressed(){
  for (int i=0; i <150; i++){
    Particle bob = new Particle (mouseX, mouseY);
    minions.add(bob);
  }
  
}