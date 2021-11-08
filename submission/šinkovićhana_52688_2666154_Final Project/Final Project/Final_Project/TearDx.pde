//Right tear
class TearDx {
  PImage tearsDx;
  float tearX;
  float tearY;
  int sizeX;
  int sizeY;
  float speedY;

  TearDx() {
    tearsDx = loadImage("tears dx.png");
    tearX = random(width/2 + 20, width/2 + 10);
    tearY = random(870, 875);
    sizeX=385;
    sizeY=300;
    speedY = random(8, 20);
  }

  void display() {
    image(tearsDx, tearX, tearY, sizeX, sizeY);
  }

  void falling() {
    tearY = tearY + speedY;

    //reset the position of the tears when they reach the boundry
    if (tearY > 1025) {
      tearY = random(870, 875);
    }
  }
}
