PImage background;

void setup(){
  size(1200,800);
  background = loadImage("../Background.JPG");
}

void draw(){
image(background,0,0);
}
