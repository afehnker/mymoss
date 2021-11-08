class Ghost {

  float ghostX;
  float ghostY;
  PImage ghost;
  boolean movingRight;
  boolean movingLeft;

  Ghost() {
    ghost = loadImage("ghost1.png");
    ghostX = width/2;
    ghostY = height-300;
  }
  void display() {
    image(ghost, ghostX, ghostY, 200, 250);
  }

  void moveRight() {
    movingLeft = false;
    movingRight = true;
    ghostX += 9;
    if (ghostX >= 999) { //ghost wont go offscreen
      ghostX = 999;
      movingRight = false;
    }
  }

  void moveLeft() {
    movingRight = false;    
    movingLeft = true;
    ghostX -= 9;
    if (ghostX <= 1) { //ghost wont go offscreen
      ghostX = 1;
      movingLeft = false;
    }
  }
}
