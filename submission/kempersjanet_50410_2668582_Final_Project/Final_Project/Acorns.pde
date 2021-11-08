class Acorns

{
  Score score;
  float acornX;
  float acornY;
  color acornColor;
  color capColor;

  float speedY;

  boolean acornsFalling;

  Acorns(float initX, float initY) {
    acornX = initX;
    acornY = initY;

    speedY = -1;

    acornColor = color(170, 92, 58);
    capColor = color(126, 72, 49);

    acornsFalling = true;

    score = new Score(acornX, acornY);
  }

  void display() {
    if (acornsFalling) {
      pushMatrix();
      translate(acornX, acornY);
      rectMode(CENTER);
      noStroke();
      fill(acornColor);
      ellipse(0, 0, 50, 75);

      fill(capColor);
      ellipse(0, -27, 50, 25);
      rect(0, -40, 5, 10);
      popMatrix();
    }
  }

  //make the acorns falling && falling again after reaching the bottom of the screen
  void update() {
    acornY = acornY - speedY;
    if (acornX < -25 || acornX > width + 5 || acornY < -5 || acornY > height+25) { 
      acornsFalling = false;
      if (acornY > height) {
        acornsFalling = true;
        acornY = 10;
      }
    }
  }

  //making the acorns able to collect points
  void collecting(float newX, float newY) {
    if (pow(newX - acornX, 2) + pow(newY - acornY, 2) <= pow(25, 2)) {
      acornsFalling = false;
      score.updateScore();
    }
  }

  //making the clicked acorns falling again from top
  void reset(float newX, float newY) {
    if (pow(newX - acornX, 2) + pow(newY - acornY, 2) <= pow(25, 2)) {
      acornsFalling = true;
      acornY = 10;
      for (int i = 0; i<acorns.length; i++) {
        acorns[i].display();
      }
    }
  }
}
