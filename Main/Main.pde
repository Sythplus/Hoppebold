PImage background;
Ball b = new Ball(new PVector(), new PVector(1.0f, 0.2f));

void setup(){
  size(1200,800);
  background = loadImage("../Background.JPG");
}

void draw(){
  image(background,0,0);
  b.draw();
  b.update();
  b.applyForce(new PVector(0.0f, 0.1f));
  
  if(b.pos.y > 790){
    b.bounce(new PVector(0.0f, -1.0f));
  } 
}
