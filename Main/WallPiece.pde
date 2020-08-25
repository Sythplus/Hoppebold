class WallPiece {
  Joint j1, j2;
  PVector normal;


  WallPiece(Joint j1, Joint j2) {
    this.j1 = j1;
    this.j2 = j2;
    PVector v = PVector.sub(j1.getPos(), j2.getPos());
    normal = new PVector(-v.y, v.x);
    normal.normalize();
  }
  void checkCollision(Ball b) {

    if (b.getVel().dot(normal)< 0) {
      PVector bborder = b.getPos().sub(PVector.mult(normal, b.getRadius()));
      PVector j2b = PVector.sub(bborder, j1.getPos());
      if (normal.dot(j2b)< 0) {
        if (PVector.sub(j1.getPos(), j2.getPos()).dot(j2b)> 0){
          b.bounce(normal);
      }
    }
  }
}
void draw() {
  line(j1.getPos().x, j1.getPos().y, j2.getPos().x, j2.getPos().y);
}
}
