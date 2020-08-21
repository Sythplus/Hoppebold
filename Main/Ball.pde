class Ball{
 PVector pos;
 PVector vel;
   
 Ball(PVector pos, PVector vel) {
   this.pos = pos.copy();
   this.vel = vel.copy();
 }
 
 void applyForce(PVector force){
   PVector acc = force;
   vel.add(acc);
 }
 
 void bounce(PVector normal) {
   float scale = 2.0f * vel.dot(normal);
   PVector scaledNormal = PVector.mult(normal, scale);
   vel.sub(scaledNormal);
   vel.mult(0.98f); // make the ball lose a small amount of energy when bouncing
 }
 
 void update() {
   pos.add(vel); 
 }
 
 void draw() {
   fill(0.0f);
   stroke(0.0f);
   strokeWeight(3);
   circle(pos.x, pos.y, 20);   
 }
}
