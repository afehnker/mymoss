//this class makes the quarter note
class Quarter {
  float quarterX;
  float quarterY;
  float xSpeed;
  float ySpeed;

  //constructor of the quarter notes
  Quarter(float initX, float initY) {
    quarterX = initX;
    quarterY = initY;
  }

  void display() {
    pushMatrix();
    translate(quarterX, quarterY);
    fill(0); //black
    //quarter note appearance
    ellipse(0, 0, 10, -6);
    line(5, -3, 5, -10);
    popMatrix();
  }

  //the quarternote moves (when music is played)
  void move() {
    quarterX += xSpeed;
    quarterY += ySpeed;

    //the quarter notes tremble
    xSpeed = random (-1, 1);
    ySpeed = random (-1, 1);

    // if the notes get to far away from the instruments, the change direction
    if (quarterX < 10 && xSpeed<0) {
      xSpeed = -xSpeed;
    }
    if (quarterX > width -10 && xSpeed>0) {
      xSpeed = -xSpeed;
    }
    if (quarterY< 10 && ySpeed<0) {
      ySpeed = -ySpeed;
    }  
    if (quarterY> height - 10 && ySpeed > 0) {
      ySpeed = -ySpeed;
    }
  }
}
