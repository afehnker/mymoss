class Front {
  int xPos;
  int yPos;
  PImage img;

  Front(int x, int y, PImage initImg) {
    xPos = x;
    yPos = y;
    img = initImg;
  }

  void display() {
    image(img, xPos, yPos);
  }
}
