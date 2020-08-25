class Joint{
  PVector pos;
  Joint(PVector pos){
    this.pos = pos.copy();  
  }
  
  PVector getPos(){
    return pos.copy();
  }
  
  void setPos(PVector pos) {
    this.pos = pos;
  }
  
}
