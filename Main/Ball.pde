class Ball{
 PVector pos;
 PVector vel;
 
 Ball(PVector pos, PVector vel) {
   this.pos = pos.copy();
   this.vel = vel.copy();
 }
 
 void applyForce(PVector force){
   PVector acc = force.copy();
   vel.add(acc);
 }
 
 void bounce(PVector normal) {
   PVector newVel = vel.copy();
   float scale = 2 * vel.dot(normal);
   PVector scaledNormal = PVector.mult(normal, scale);
   newVel.sub(scaledNormal);
   vel = newVel;
 }
 
 void update() {
   pos.add(vel); 
 }
 
 void draw() {
   fill(0.2f);
   stroke(0.0f);
   strokeWeight(3);
   circle(pos.x, pos.y, 20);   
 }
 
}
