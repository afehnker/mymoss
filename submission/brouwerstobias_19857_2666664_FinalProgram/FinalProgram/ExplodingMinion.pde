class ExplodingMinion {
  // Constructor
  ExplodingMinion(float x, float y) {
    this.x = x;
    this.y = y;
    this.scale = 1;
    this.img = loadImage("img/explodingminions.png"); // 507, 604
    this.width = img.width;
    this.height = img.height;
    this.explosion = loadImage("img/explosion.png");
  }
  float x;
  float y;
  float scale;
  float width;
  float height;
  PImage img;
  PImage explosion;

  boolean selected;
  boolean exploding;
  float exScale;
  float ms;

  void display() {
    if (!exploding) { // When not exploding
      pushMatrix();
      translate(x, y);
      scale(scale);
      image(img, 0, 0); // Display the game box
      popMatrix();
    } else { // When exploding
      pushMatrix();
      translate(x, y);
      rotate(exScale/5);
      scale(exScale);
      image(explosion, 0, 0); // Display explosion
      popMatrix();
      explode();
    }
  }

  boolean explode() {
    if (selected) {
      if (!exploding) { // If not exploding, initialize all variables
        boom.play();
        ms = millis();
        exScale = 0.1;
        exploding = true;
      } else {
        if (millis() - ms > 2000) { // Check the time
          exploding = false;
        } else {
          exScale += 0.2;
        }
      }
      return true;
    }
    return false;
  }

  void isSelected(float mX, float mY) { // Selection box is slightly bigger than the image, for ease of use and ease of programming
    if (!exploding) { // Shouldn't affect much but it's a failsafe
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
