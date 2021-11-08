//Pink Floyd San Tropez
class pinkFloyd {
  PImage pinkFloydWhole;
  PImage pinkFloydDisc;

  float angleRotate;

  int posX;
  int posY;
  int sizeX;
  int sizeY;
  int sizeDiscX;
  int sizeDiscY;

  boolean keyPress;

  pinkFloyd() {
    keyPress= false;
    angleRotate = 0.0;
    pinkFloydWhole = loadImage("pinkFloyd.jpg");
    pinkFloydDisc = loadImage("pinkFloydEye.png");
  }

  void display(int posX, int posY, int sizeX, int sizeY, int sizeDiscX, int sizeDiscY) {
    line(posX, 0, posX, 27);

    image(pinkFloydWhole, posX, posY, sizeX, sizeY);

    //rotate the inside disc if key is pressed
    if (keyPress) {
      pushMatrix();
      translate(posX, posY - 70);
      rotate(radians(angleRotate));
      image(pinkFloydDisc, 0, 0, sizeDiscX, sizeDiscY);
      popMatrix();
      angleRotate += 1.5;
    }
  }

  void keyPress() {
    keyPress= true;
  }  
  void keyRelease() {
    keyPress=false;
  }
}
