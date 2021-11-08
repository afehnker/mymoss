class Pumpkin {

  PImage pumpkin;
  int xPos;
  int yPos;
  boolean mouseIsPressed;
  int halfWidth;
  int halfHeight;

  Pumpkin(int x, int y, PImage initpumpkin) {
    xPos = x;
    yPos = y;
    pumpkin = initpumpkin;
    mouseIsPressed = false;
    halfWidth = 100;
    halfHeight = 125;
  }

  void display () {

    fill(0);
    ellipse(426, 524, 110, 80);

    if (mouseIsPressed) {
      noStroke();
      fill(255, 255, 179, 126);
      ellipse(426, 524, 200, 160);
    }
    image(pumpkin, xPos, yPos);
  }

  boolean isOver(int x, int y) {
    if (x <= xPos + halfWidth && x >= xPos - halfWidth && y <= yPos + halfHeight && y >= yPos - halfHeight) {
      return true;
    } else {
      return false;
    }
  }
}
