PImage background;
ArrayList<Ball> balls = new ArrayList();
ArrayList<Joint>joints= new ArrayList();
ArrayList<WallPiece> walls = new ArrayList();

Joint grabbed;

//Ball b = new Ball(new PVector(), new PVector(10, 0.2));
//WallPiece wall = new WallPiece(new Joint(new PVector(0, 600)), new Joint(new PVector(1200, 200)));
void setup() {

  size(1200, 800);
  background = loadImage("../Background.JPG");

  joints.add(new Joint(new PVector(0, 0))); 
  joints.add(new Joint(new PVector(600, 0))); 
  joints.add(new Joint(new PVector(1200, 000)));
  joints.add(new Joint(new PVector(1200, 400)));
  joints.add(new Joint(new PVector(1200, 800)));
  joints.add(new Joint(new PVector(600, 800)));
  joints.add(new Joint(new PVector(0, 800)));
  joints.add(new Joint(new PVector(0, 400)));
  
  
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
  if (e.getKey() == ' ') {
    balls.add(new Ball(new PVector(random(1200), random(200)), new PVector(random(10), random(2))));
  }

  if (e.getKey() == 'r') {
    balls.clear();
  }
}

void mousePressed(MouseEvent e) {
  if (grabbed == null) {

    float closest = 1000000.0;

    for (Joint j : joints) {
      float dist = dist(j.getPos().x, j.getPos().y, e.getX(), e.getY());
      if (dist < closest) {
        grabbed = j;
        closest = dist;
      }
    }
  } else {
    grabbed = null;
  }
}

void mouseMoved(MouseEvent e) {

  if (grabbed !=  null) {
    grabbed.setPos(new PVector(e.getX(), e.getY()));

    for (WallPiece w : walls) {
      w.recalcNormal();
    }
  }
}
