class SpiderB {

  PImage spiderB;
  float xPos;
  float yPos;
  float originalY;
  float speedX;
  int dX;
  float speedY;
  boolean isActive;
  Witch witch;

  SpiderB( int x, int y, PImage initspiderB, Witch initWitch) {
    xPos = x;
    yPos = y;
    originalY = y;
    spiderB = initspiderB;
    speedX = 3;
    speedY = 0;
    dX = 1;
    witch = initWitch;
  }

  void display() {
    if (isActive()) {
      image(spiderB, xPos, yPos);
    }
  }

  void update() {
    //doesnt work properly yet
    if (witch.triggerExplosion) {
      yPos = yPos + 4;
    } else if (isActive()) {
      yPos = originalY;
      xPos = xPos + (speedX * dX);
    } else {
      xPos = -44;
    }
  }

  boolean isActive() {
    if (xPos > width + 45 || xPos < -45 || yPos < -30) {
      return false;
    } else {
      return true;
    }
  }
}
