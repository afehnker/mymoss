//this class makes the double eighth note
class Deighth {
  float deighthX;
  float deighthY;
  float xSpeed;
  float ySpeed;

  //constructor of the dubble eighth notes
  Deighth(float initX, float initY) {
    deighthX = initX;
    deighthY = initY;
    xSpeed = random(-1, 1);
    ySpeed = random(-1, 1);
  }

  void display() {
    if (notesPlaying == true) {
      pushMatrix();
      translate(deighthX, deighthY);
      fill(0); //black
      //dubble eighth note appearance
      ellipse(0, 0, 10, -6);
      line(5, -3, 5, -10);
      line(5, -10, 17, -10);
      ellipse(12, 0, 10, -6);
      line(17, -3, 17, -10);
      popMatrix();
    }
  }

  //the double eighth note moves
  void move() {
    deighthX += xSpeed;
    deighthY += ySpeed;

    // if the notes get to far away from the instruments, the change direction
    if (deighthX < 100 && xSpeed<0) {
      xSpeed = -xSpeed;
    }
    if (deighthX > width -100 && xSpeed>0) {
      xSpeed = -xSpeed;
    }
    if (deighthY< 100 && ySpeed<0) {
      ySpeed = -ySpeed;
    }  
    if (deighthY> height - 100 && ySpeed>0) {
      ySpeed = -ySpeed;
    }
  }
}
