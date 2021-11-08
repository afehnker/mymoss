//Moving background of the Mario game.

class Background {
  //variables
  PImage Background;
  int Backgroundx;
  int Backgroundy;

  //constructors
  Background(int x, int y) {
    Backgroundx = x;
    Backgroundy = y;
    Background = loadImage("Background.jpg");
  }

  //resizes the image and displays a smooth loop with the last line of code.
  void display() {
    Background.resize(0, 800);
    image (Background, Backgroundx, Backgroundy);
    image (Background, Backgroundx + Background.width, Backgroundy);
  }

  //moving background with a loop
  void update() {
    Backgroundx = Backgroundx - 1;
    if (Backgroundx < -Background.width) {
      Backgroundx = 0; //Resets the first image so it will be repeated endlessly
    }
  }
}
