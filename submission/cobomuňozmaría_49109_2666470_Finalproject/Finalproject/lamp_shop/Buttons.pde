class Buttons {
  float x;
  float y;

  color c;

  Buttons(float buttonX, float buttonY, color ledColor) {
    x = buttonX;
    y = buttonY;
    c = ledColor;
  }

  void display() {
    fill(c);
    ellipse(x, y, 20, 20);
  }
}
