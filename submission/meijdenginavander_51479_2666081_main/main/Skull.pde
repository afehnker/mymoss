class Skull {
  int xPos;
  int yPos;
  float rotation;
  int dRotation;
  int speedRotation;
  PImage skullImg;
  int halfHeight;
  int halfWidth;
  boolean skullSelected;
  boolean updating;


  Skull(int x, int y, PImage initSkullImg) {
    halfHeight = 110;
    halfWidth = 40;
    xPos = x;
    yPos =  y;
    skullImg = initSkullImg;
  }

  void display() {
    pushMatrix();
    translate(xPos, yPos);
    rotate(rotation);
    image(skullImg, 0, 0);
    popMatrix();
  }

  void update() {

    if (!skullSelected) {
      rotation = rotation % (2 * PI);//you can always divide by 2PI to get the same angle in radians, no neet to get big floats so we take the modulo
    }
    if (rotation > -0.05 && rotation < 0.05) {
      rotation = 0;
      updating = false;
    } else if (!skullSelected && rotation > 0 || !skullSelected && rotation < -PI) {//falls back
      rotation -= radians(2);//naar rechts slepen  + atan2(yPos, xPos) * 45 / 0.5*PI
      updating = true;
    } else if (!skullSelected && rotation < 0 && rotation > -PI) {
      rotation += radians(2);//naar links slepen
      updating = true;
    }
  }

  void rotateFacing(int x, int y) {
    rotation = atan2((y - yPos), (x - xPos)) + radians(-90); //formula for angle found on https://stackoverflow.com/questions/41855261/calculate-the-angle-between-a-line-and-x-axis
  }

  boolean isOver(int x, int y) {
    if (x <= xPos + halfWidth && x >= xPos - halfWidth && y <= yPos + 2 * halfHeight && y >= yPos + halfHeight) {
      return true;
    } else {
      return false;
    }
  }
}
