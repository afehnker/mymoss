class Curtain {
  float xPos;
  float yPos;
  float originalX;
  int dX;
  int originalDX;
  boolean slideClosed;
  boolean slideOpen;
  float speedX;
  PImage curtain;

  Curtain(int x, int y, PImage initCurtain, int leftOrRight) {
    xPos = x;
    yPos = y;
    originalX = x;
    slideClosed = false;
    slideOpen = false;
    speedX = 3;
    curtain = initCurtain;
    dX = leftOrRight;
    originalDX = leftOrRight;
  }

  void display() {
    image(curtain, xPos, yPos);
  }

  void update() {

    if (slideClosed) {
      xPos = xPos + (dX * speedX);
    }
    if (slideOpen) {
      xPos = xPos + (-1 * dX * speedX);
    }
    boundaries();
  }

  //checks if the curtains are out of bounds and corrects the location if neccesary
  void boundaries() {
    if (originalDX == 1 && xPos >= originalX) {
      xPos = originalX;
    } else if (originalDX == 1 && xPos <= originalX - 350) {
      xPos = originalX - 350;
    } else if (originalDX == -1 && xPos <= originalX) {
      xPos = originalX;
    } else if (originalDX == -1 && xPos >= originalX + 350) {
      xPos = originalX + 350;
    }
  }
}
