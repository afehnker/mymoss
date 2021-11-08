class Ghost {
  float xPos;
  float yPos;
  float originalX;
  float originalY;
  boolean isOver;
  PImage ghostImg;
  int halfWidth;
  int halfHeight;

  Ghost(int x, int y, PImage img) {
    xPos = x;
    yPos = y;
    originalX = x;
    originalY = y;
    ghostImg = img;
    isOver = false;
    halfWidth = 125;
    halfHeight = 125;
  }

  void display() {
    tint(255, 150);
    image(ghostImg, xPos, yPos);
    tint(255, 255);
  }

  void update() {
    if (isOver) {
      float i = random(-3, 3);
      float o = random(-3, 3);
      xPos = xPos + i;
      yPos = yPos + o;
    } else {
      xPos = originalX;
      yPos = originalY;
    }
  }

  void checkIfOver(int x, int y) {
    if (x <= xPos + halfWidth && x >= xPos - halfWidth && y <= yPos + halfHeight && y >= yPos - halfHeight) {
      isOver = true;
    } else {
      isOver = false;
    }
  }
}
