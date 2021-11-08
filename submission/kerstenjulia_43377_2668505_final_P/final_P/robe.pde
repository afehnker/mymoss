class Robe {

  //attributes
  float robeX;
  float robeY;
  PImage img;

  Robe(float initX, float initY) {
    robeX= initX;
    robeY= initY;
    img =loadImage("hanger.png");
  }
  void display(){
    image(img, 100, 500, 400, 400);
  }
}
