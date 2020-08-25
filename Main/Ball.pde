class Ball {
float radius = 20.0f; 
  
  PVector pos;
  PVector vel;
  

  Ball(PVector pos, PVector vel) {
    this.pos = pos.copy();
    this.vel = vel.copy();
  }

  void applyForce(PVector force) {
    PVector acc = force;
    vel.add(acc);
  }

  void bounce(PVector normal) {
    float scale = 2.0f * vel.dot(normal);
    PVector scaledNormal = PVector.mult(normal, scale);
    vel.sub(scaledNormal);
    vel.mult(0.98f); // make the ball lose a small amount of energy when bouncing
  }
  void bounce(Ball other) {
  //  PVector normal = PVector.sub(this.pos, other.pos);
  //  normal.normalize();
  //  PVector tangent = new PVector(-normal.y, normal.x);
  //  PMatrix2D normalspace = new PMatrix2D(normal.x, tangent.x, 0, normal.y, tangent.y, 0);
  //  PVector vnormal = new PVector();
  //  normalspace.mult(this.vel,vnormal);
  //    PVector v2normal = new PVector();
  //  normalspace.mult(other.vel,v2normal);
    PVector temp = this.vel.copy();
    this.vel = other.vel.copy();
    other.vel = temp;
  }
  void update() {
    pos.add(vel);
  }

  void draw() {
    fill(0.0f);
    stroke(0.0f);
    strokeWeight(3);
    circle(pos.x, pos.y, radius*2);
  }
  void checkCollision(Ball other){
    if( PVector.sub(this.pos,other.pos).mag() < other.radius + this.radius){
    this.bounce(other);
    }
  }
float getRadius(){
return radius;
}
PVector getVel() {
    return vel.copy();
  }
  PVector getPos() {
    return pos.copy();
  }
}
