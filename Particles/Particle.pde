//class structor
class Particle {
  
  //tracking position of individual particles
  float x;
  float y;
  float r, g, b;
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  color c;
  
  //constructor function
  Particle(float px, float py){
    x= px;
    y= py;
    
    r= random(255);
    g= random(255);
    b= random(255);
    
    
    acc= new PVector(0, 0);
    vel= new PVector(cos(x), sin(y));
    loc= new PVector(x, y);
    
    c = img.get(int(loc.x), int(loc.y));
   
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    //x= x+random(-1,1);
    //y= y+random(-1,1);
    
    vel.add(acc);
    
    PVector r = PVector.random2D();
    r.mult(0.75);
    vel.add(r);
    
    loc.add(vel);
    acc.mult(0);
    

    
  }
  
  void display(){
     //fill(r,g,b);
     
     //color c = img.get(int(loc.x), int(loc.y));
     fill(c);
     
     stroke(b/2, g/2, r/2);
     ellipse(loc.x,loc.y,5,5);
  }
  
}  