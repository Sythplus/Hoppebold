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
    PVector j2b = PVector.sub(b.getPos(),j1.getPos());
    if(normal.dot(j2b)< 0){
     b.bounce(normal); 
    }
  }
}
