PImage background;
Ball b = new Ball(new PVector(), new PVector(10, 0.2));
WallPiece wall = new WallPiece(new Joint(new PVector(0,600)), new Joint(new PVector(1200,200)));
void setup(){
  size(1200,800);
  background = loadImage("../Background.JPG");
}

void draw(){
  image(background,0,0);
  b.draw();
  b.update();
  b.applyForce(new PVector(0.0f, 0.3f));
  wall.checkCollision(b);
 
  
  if(b.pos.y > 790){
    b.bounce(new PVector(0.0f, -1.0f));
  } 
}
