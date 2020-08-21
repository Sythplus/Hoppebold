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
 
}
