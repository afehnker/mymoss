class Stand {
  //setup variables 
  float standX;
  float standY;
  color standColor;

  //constructor of the stand
  Stand(float initX, float initY) {
    standX = initX;
    standY = initY;
    standColor= color(20);
  }

  void display() {
    pushMatrix();
    translate(standX, standY);
    fill(standColor);
    //stand
    stroke(20);
    strokeWeight (3);
    line(0, 0, -35, 40);
    line(0, 0, 35, 40);
    line(0, 0, 0, -100);
    rect(0, -100, 100, 70);

    //musicsheet
    fill(255);
    strokeWeight (2);
    rect(20, -100, 40, -50);
    rect(-20, -100, 40, -50);
    popMatrix();
  }
}
