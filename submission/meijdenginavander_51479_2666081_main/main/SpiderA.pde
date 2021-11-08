class SpiderA {

  PImage spiderA;
  float xPos;
  float yPos;
  boolean mouseIsOver;
  int halfWidth;
  int halfHeight;
  float originalX;
  float originalY;

  SpiderA(int x, int y, PImage initspiderA) {
    xPos = x;
    yPos = y;
    originalX = x;
    originalY = y;
    spiderA = initspiderA;
    mouseIsOver = false;
    halfWidth = 25;
    halfHeight = 275;
  }

  void display() {
    image(spiderA, xPos, yPos);
  }

  void update() {
    if (mouseIsOver) {
      yPos -= 1;
    } else if (yPos != originalY) {
      xPos = originalX;
      yPos += 1;
    }
  }

  void isOver(int x, int y) {
    if (x <= xPos + halfWidth && x >= xPos - halfWidth && y <= yPos + halfHeight && y >= yPos - halfHeight) {
      mouseIsOver= true;
    } else {
      mouseIsOver = false;
    }
  }
}
