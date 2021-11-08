class Witch {
  float xPos;
  float yPos;
  float armRotation;
  float xPosPotion;
  float yPosPotion;
  float xPosPot;
  float yPosPot;
  float originalPotionX;
  float originalPotionY;
  float explosionScale;
  boolean triggerExplosion;
  boolean selectPotion;

  boolean changeDirection;

  int halfWidth;
  int halfHeight;

  PImage witch;
  PImage arm;
  PImage potion;
  PImage pot;
  PImage explosion;

  Witch(int x, int y, PImage initWitch, PImage initArm, PImage initPotion, PImage initPot, PImage initExplosion) {
    xPos = x;
    yPos = y;
    witch = initWitch;
    arm = initArm;
    potion = initPotion;
    xPosPotion = xPos + 170;
    yPosPotion = yPos + 80;
    xPosPot = xPos + 330;
    yPosPot = yPos + 120;
    originalPotionX = xPosPotion;
    originalPotionY = yPosPotion;
    pot = initPot;
    halfWidth = 50;
    halfHeight = 60;
    armRotation = 0;
    explosion = initExplosion;
    explosionScale = 0.1;
  }

  void display() {
    image(potion, xPosPotion, yPosPotion);
    image(witch, xPos, yPos);
    pushMatrix();
    translate(xPos + 80, yPos + 80);
    rotate(radians(armRotation));
    image(arm, 20, 0);
    popMatrix();
    image(pot, xPosPot, yPosPot);
    if (triggerExplosion) {
      pushMatrix();
      translate(xPosPot, yPosPot - 100);
      scale(explosionScale);
      image(explosion, 0, -120);
      popMatrix();
    }
  }

  void update() {
    checkExplosion();
    if (!selectPotion) {//if the potion isn't selected put it back in the witch her hand
      xPosPotion = originalPotionX;
      yPosPotion = originalPotionY;
      armRotation = 0;
    }
    if (selectPotion) {
      checkDirection();//checks if the arm should move up or down
      if (!changeDirection) {
        armRotation += 1;//moves the arm up/ down accordingly as if the witch is reaching for the potion
      } else if (changeDirection) {
        armRotation -= 1;
      }
    }
    if (triggerExplosion) {
      for (int i = 0; i < 5; i++) {
        explosionScale += 0.02;
      }
    }
    if (!triggerExplosion) {
      explosionScale = 0.1;
    }
  }

  void checkDirection() {
    if (armRotation <= 0) {
      changeDirection = false;
    } else if (armRotation >= 30) {
      changeDirection = true;
    }
  }

  boolean isOverPotion(int x, int y) {
    if (x <= xPosPotion + halfWidth && x >= xPosPotion - halfWidth && y <= yPosPotion + halfHeight && y >= yPosPotion - halfHeight) {
      return true;
    } else {
      return false;
    }
  }

  void movePotion(int x, int y) {
    xPosPotion = x;
    yPosPotion = y;
  }


  void checkExplosion() {
    if (xPosPotion <= xPosPot + 110 && xPosPotion >= xPosPot - 110 && yPosPotion <= yPosPot + 75 && yPosPotion >= yPosPot - 75 && !selectPotion) {
      triggerExplosion = true;
    }
    if (explosionScale >= 3) {//the explosion ends when the explosion gets too big
      triggerExplosion = false;
    }
  }
}
