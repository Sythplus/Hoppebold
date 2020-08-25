PImage background;
ArrayList<Ball> balls = new ArrayList();
ArrayList<Joint>joints= new ArrayList();
ArrayList<WallPiece> walls = new ArrayList();
//Ball b = new Ball(new PVector(), new PVector(10, 0.2));
//WallPiece wall = new WallPiece(new Joint(new PVector(0, 600)), new Joint(new PVector(1200, 200)));
void setup() {

  size(1200, 800);
  background = loadImage("../Background.JPG");

  joints.add(new Joint(new PVector(0, 0))); 
  joints.add(new Joint(new PVector(1200, 0))); 
  joints.add(new Joint(new PVector(1200, 700)));
  joints.add(new Joint(new PVector(900, 700)));
  joints.add(new Joint(new PVector(600, 400)));
  joints.add(new Joint(new PVector(400, 500)));
  joints.add(new Joint(new PVector(0, 600))); 
  for (int i = 0; i < joints.size(); i++) {
    walls.add(new WallPiece(joints.get((i+1) % joints.size()), joints.get(i)));
  }
}

void draw() {
  image(background, 0, 0);
  for (WallPiece w : walls) {
    w.draw();
  }
  for (int i = 0; i< balls.size(); i++) {
    Ball b = balls.get(i);
    b.draw();
    b.update();
    b.applyForce(new PVector(0.0f, 0.3f));
    for (WallPiece w : walls) {
      w.checkCollision(b);
    }
    for (int j = 0; j< i; j++) {
      b.checkCollision(balls.get(j));
    }
  }
}

void keyPressed(KeyEvent e) {
  if(e.getKey() == ' '){
    balls.add(new Ball(new PVector(random(1200), random(200)), new PVector(random(10), random(2))));
  }
  
  if(e.getKey() == 'r'){
    balls.clear();
  }
    
}
