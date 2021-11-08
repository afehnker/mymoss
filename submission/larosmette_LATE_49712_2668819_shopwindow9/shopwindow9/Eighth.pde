//this class makes the eighth note
class Eighth {
  float eighthX;
  float eighthY;
  float xSpeed;
  float ySpeed;

  //constructor of the eighth notes
  Eighth(float initX, float initY) {
    eighthX = initX;
    eighthY = initY;
    xSpeed = random(-3, 3);
    ySpeed = random(-3, 3);
  }

  void display() {
    pushMatrix();
    translate(eighthX, eighthY);
    fill(0); //black
    //eighth note appearance
    ellipse(0, 0, 10, -6);
    line(5, -3, 5, -10);
    line(5, -10, 8, -10);
    popMatrix();
  }

  //the eighth note moves
  void move() {
    eighthX += xSpeed;
    eighthY += ySpeed;

    // if the notes get to far away from the instruments, the change direction
    if (eighthX < 100 && xSpeed<0) {
      xSpeed = -xSpeed;
    }
    if (eighthX > width -100 && xSpeed>0) {
      xSpeed = -xSpeed;
    }
    if (eighthY< 100 && ySpeed<0) {
      ySpeed = -ySpeed;
    }  
    if (eighthY> height - 100 && ySpeed>0) {
      ySpeed = -ySpeed;
    }
  }
}
