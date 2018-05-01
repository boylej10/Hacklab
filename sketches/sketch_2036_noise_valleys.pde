int n=1500;
float [] cx=new float[n];
float [] cy=new float[n];
float theta=0;
void setup() {

  size(812, 812);
  background(10);
  for (int i=0;i<n;i++) {
    cx[i]=random(width+100);
    cy[i]=random(height);
    smooth();
  }
}

void draw() {
  theta+=0.01;
  strokeWeight(0.5);
  for (int i=1;i<n;i++) {
    stroke(random(100, 200), random(100, 200), random(100, 200), random(30, 55));
    cy[i]+=(sin(TWO_PI*noise(0.0075*cx[i], 0.0075*cy[i])));
    cx[i]+=(cos(TWO_PI*noise(0.0075*cx[i], 0.0075*cy[i])));
    point(cx[i], cy[i]);
  }

  if (frameCount>250) {
    frameCount=0;
    for (int i=0;i<n;i++) {
      cx[i]=random(width+100);
      cy[i]=random(height+100);
    }
  }
}

void keyPressed() {
  saveFrame("simple10print-###.jpg");
}