PImage background;

void setup(){
  size(1200,800);
  background = loadImage("../Background.JPG");
  
  Ball b = new Ball(new PVector(0, 0), new PVector(0, 0));
  b.applyForce(new PVector(1.0f, 1.0f));
  
  
}

void draw(){
  image(background,0,0);
}
