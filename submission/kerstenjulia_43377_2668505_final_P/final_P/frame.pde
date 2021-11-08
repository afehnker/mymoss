class Frame {

  //attributes
  float frameX;
  float frameY;
  PImage img;

  Frame(float initX, float initY) {
    frameX= initX;
    frameY= initY;
    img =loadImage("frame.png");
  }

  void display() {
    image(img, 410, 480,610, 390);
  }
}
