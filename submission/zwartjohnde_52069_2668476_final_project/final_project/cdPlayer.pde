class musicSelect {
  float xPos;
  float yPos;
  float size;

  musicSelect(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void display() {
    //main cd player
    pushMatrix();
    translate(xPos, yPos);
    fill(51);
    rect(0, 0, 200, 50);
    fill(129);
    rect(10, 20, 180, 10, 10);
    line(15, 25, 180, 25);
    popMatrix();
  }
}
