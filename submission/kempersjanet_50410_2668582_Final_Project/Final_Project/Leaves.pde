class Leaves

{
  float leaveX;
  float leaveY;
  color leaveColor;

  float speedY;

  boolean leavesFalling;

  Leaves(float initX, float initY) {
    leaveX = initX;
    leaveY = initY;

    speedY = -1;

    leaveColor = color(56, 210, 84);

    leavesFalling = true;
  }

  void display() {
    if (leavesFalling) {
      pushMatrix();
      translate(leaveX, leaveY);
      rectMode(CENTER);
      noStroke();
      fill(leaveColor);
      ellipse(0, 0, 50, 75);
      rect(0, -40, 5, 10);
      popMatrix();
    }
  }

  //make the leaves falling && falling again after reaching the bottom of the screen

  void update() {
    leaveY = leaveY - speedY;
    if (leaveX < -25 || leaveX > width + 5 || leaveY < -5 || leaveY > height+25) { 
      leavesFalling = false;
      if (leaveY > height) {
        leavesFalling = true;
        leaveY = 10;
      }
    }
  }

  //making the acorns able to collect points
  void collecting(float newX, float newY) {
    if (pow(newX - leaveX, 2) + pow(newY - leaveY, 2) <= pow(25, 2)) {
      score.counterLeaves();
    }
  }

  //making the clicked acorns falling again from top
  void reset(float newX, float newY) {
    if (pow(newX - leaveX, 2) + pow(newY - leaveY, 2) <= pow(25, 2)) {
      leavesFalling = true;
      leaveY = 10;
      for (int i = 0; i<leaves.length; i++) {
        leaves[i].display();
      }
    }
  }
}
