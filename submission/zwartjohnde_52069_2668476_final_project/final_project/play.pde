class playSymbol {
  float xPos;
  float yPos;

  playSymbol() {
  }
  void display(float xPos, float yPos) {
    //displays start symbol
    pushMatrix();
    translate(xPos, yPos);
    fill(255);
    triangle(-20, 220, -20, 170, 30, 195);
    popMatrix();
  }
}
