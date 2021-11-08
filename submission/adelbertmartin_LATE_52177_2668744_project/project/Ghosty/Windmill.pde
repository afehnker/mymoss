class Windmill {

  float xPos;
  float yPos;
  PImage wings;
  float angle;
  float speed;

  Windmill() {
    xPos = 860;
    yPos = 400;
    speed = 1;
    imageMode(CENTER);
    wings = loadImage("wings1.png");
  }

  void display() {
    image(wings, xPos, yPos, 500, 500);
  }

  void update() { //windmill spins around
    pushMatrix();
    translate(xPos, yPos);
    rotate(radians(angle));
    image(wings, 0, 0, 500, 500);
    popMatrix();
    angle = (angle + speed) % 360;
  }
}
