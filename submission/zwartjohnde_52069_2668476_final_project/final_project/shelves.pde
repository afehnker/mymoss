class shelves {
  float xPos;
  float yPos;
  shelves(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void display() {
    fill(184, 118, 39);
    rect(xPos, yPos, 550, 20);
    fill(0);
    pushMatrix();
    translate(xPos, yPos);
    quad(0, 0, 550, 0, 530, -30, 20, -30);
    popMatrix();
  }
}
