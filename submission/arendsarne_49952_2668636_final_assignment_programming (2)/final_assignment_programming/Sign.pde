class Sign {

  float signX;
  float signY;
  boolean doorIsOpen;
  color textColor;

  Sign() {
    signX = width/2;
    signY = height;

    doorIsOpen = false;
    textColor = color(0);
  }

  void display () {
    fill(textColor);
    textSize(100);
    text("suitsupply", signX, signY-730);
  }

  void update() {
    if (doorIsOpen) {
      textColor = color(255, 255, 0);
    } else if (!doorIsOpen) {
      textColor = color(0);
    }
  }

  void doorOpen() {
    doorIsOpen = true;
  }
  void doorClosed() {
    doorIsOpen = false;
  }
}
