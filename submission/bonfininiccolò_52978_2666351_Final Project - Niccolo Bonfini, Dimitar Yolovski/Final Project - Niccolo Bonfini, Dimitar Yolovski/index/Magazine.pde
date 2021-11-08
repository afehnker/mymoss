class magazine {
  float magazineX;
  float magazineY;
  float magazineWidth;
  float magazineHeight;
  color magazineColor;
  magazine(float initX, float initY) {
    magazineX = initX;
    magazineY = initY;
    magazineWidth = 30;
    magazineHeight = 40;
    magazineColor = color(random(1, 255), random(1, 255), random(1, 255));
  }
  void display() {
    //draws the magazine
    rectMode(CENTER);
    fill(magazineColor);
    rect(magazineX, magazineY, magazineWidth, magazineHeight);
    rect(magazineX, magazineY-10, 20, 8);
    line(magazineX-6, magazineY-10, magazineX+6, magazineY-10);
    rectMode(CORNER);
    fill(120);
  }
  void update() {
// the magazine color changes to a random one
    magazineColor =  color(random(1, 255), random(1, 255), random(1, 255));
  }
}
