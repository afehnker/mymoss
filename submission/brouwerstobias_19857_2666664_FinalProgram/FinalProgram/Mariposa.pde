class Mariposa {
  Mariposa(float x, float y) {
    this.x = x;
    this.y = y;
    this.scale = 1;
    this.img = loadImage("img/mariposas.png"); // 536, 329;
    this.width = img.width;
    this.height = img.height;
    this.butterfly = loadImage("img/butterfly.png");
    this.butterflyX = x;
    this.butterflyY = y;
    this.selected = false;
  }
  float x;
  float y;
  float scale;
  PImage img;
  float width;
  float height;
  PImage butterfly;
  float butterflyScale;

  boolean selected;
  boolean flying;
  float butterflyX;
  float butterflyY;
  float ms;

  void display(float mX, float mY) {
    if (!flying) {
      pushMatrix();
      translate(x, y);
      scale(scale);
      image(img, 0, 0); // Display the game box
      popMatrix();
    } else {
      pushMatrix();
      translate(x, y);
      scale(scale);
      image(img, 0, 0);
      popMatrix();
      fly();
      calcButterfly(mX, mY);
    }
  }

  void fly() {
    if (selected) {
      if (!flying) {
        peaceful.play();
        ms = millis();
        butterflyScale = 1;
        flying = true;
      } else {
        float modScale = 125;
        float diff = millis() - ms;
        float floordiff = floor(diff/modScale);
        if ((floordiff%2)==0) { // If it's an even cycle, go up in scale
          butterflyScale = 0.8 + 0.4 * (diff - floordiff * modScale)/modScale;
        } else { // Otherwise in odd cycles, go down.
          butterflyScale = 0.8 + 0.4 * -((diff - floordiff * modScale)/modScale);
          // This math was mostly trial and error
        }
      }
      if (millis() - ms > 6000) {
        flying = false;
      }
    }
  }

  // calcButterfly and butterfly functions based on code "Follow 1" by Keith Peters

  void calcButterfly(float mX, float mY) {
    float dx = mX - butterflyX;
    float dy = mY - butterflyY;
    float angle1 = atan2(dy, dx);
    // Use the arctangent to aim at the mouse
    butterflyX = mX - (cos(angle1) * butterfly.height);
    butterflyY = mY - (sin(angle1) * butterfly.height);
    // Calculate the new
    butterfly(butterflyX, butterflyY, angle1);
  }

  void butterfly(float x, float y, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a - degrees(90));
    scale(butterflyScale, 1);
    scale(0.5);
    image(butterfly, 0, 0);
    popMatrix();
  }

  void isSelected(float mX, float mY) { // Selection box is slightly bigger than the image, for ease of use and ease of programming
    if (!flying) { // Shouldn't affect much but it's a failsafe
      if ((mX > x - width && mX < x + width) && (mY > y - height && mY < y + height)) {
        scale = 1.2; // Become bigger
        selected = true;
      } else {
        scale = 1; // Go normal size
        selected = false;
      }
    }
  }
}
