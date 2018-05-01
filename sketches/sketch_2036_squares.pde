// simple drawing Year 2


float r = random(255);
float g = random(255);
float b = random(255);


float x = 0;
float y = 0;
float spacing = 50;

void setup() {
  size(800, 800);
  background(255);
}


void draw() {

  stroke(155, 145, 28, 45);
  strokeWeight(5);

  //rule one - probability 3 choices
  if (random(1) < 0.3 ) {
    fill(66, 200, 180, 30);
    rect (x, y, spacing, spacing);
  } 
  else if (random(1) >0.0 && random(1)  < 0.4){
   line(x,y, x+spacing,y+spacing);
   stroke(20, 140, 225);
  }
   else {
    // no outline, solid fill, triangle
    fill(100, 200, 155, 60);
    triangle (x, y, x+ spacing, y, x, y+ spacing);
  }

  //rule two - increase spacing
  x+=spacing;

  //rule three - move down a row
  if (x > width) {
    y += spacing;
    x = 0;
  }
}

void keyPressed() {
  saveFrame("simple10print-###.jpg");
}