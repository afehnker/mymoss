class pauseSymbol {
  float xPos;
  float yPos;
  pauseSymbol(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void display() {
    //displays pause symbol
    pushMatrix();
    fill(255);
    translate (xPos, yPos);
    rect(-20, 175, 15, 40);
    rect(5, 175, 15, 40);
    popMatrix();
  }
}
