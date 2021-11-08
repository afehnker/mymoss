class Eyes {
  float eyeX;
  float eyeY;
  float delay;
  float eyeSize;
  float counter;

  boolean isOpen;

  color pupilColor;
  color eyeColor;

  Eyes(float initX, float initY) {
    eyeX = initX;
    eyeY = initY;
    eyeColor = color(255, 223, 94);
    isOpen = true;
    counter = 0;
    delay = (random(10, 60));
    ellipseMode(CENTER);
    eyeSize = random(50, 100);
    pupilColor = 0;
  }

  void display() {
    if (isOpen) {
      //Draws open eyes
      noStroke();
      fill(eyeColor);
      ellipse(eyeX, eyeY, eyeSize, eyeSize/2.5); //left eye
      ellipse(eyeX+(eyeSize*1.5), eyeY, eyeSize, eyeSize/2.5); //right eye
      pupilColor = color(0);
    } else {
      //Draws closed eyes
      fill(0, 50, 100);
      ellipse(eyeX, eyeY, eyeSize+2, eyeSize/2.5+2); //left eye
      ellipse(eyeX+(eyeSize*1.5), eyeY, eyeSize+2, eyeSize/2.5+2); //right eye
      pupilColor= color(0, 50, 100);
    }
  }  

  void movePupil(float inputX) {
    //makes pupils move, based on mouse position
    if (inputX < eyeX) {
      fill(pupilColor);
      ellipse(eyeX-20, eyeY, eyeSize/3.33, eyeSize/3.33);
      ellipse(eyeX+(eyeSize*1.5)-20, eyeY, eyeSize/3.33, eyeSize/3.33);
    } else if (inputX > eyeX+(eyeSize*1.5)) {
      fill(pupilColor);
      ellipse(eyeX+20, eyeY, eyeSize/3.33, eyeSize/3.33);
      ellipse(eyeX+(eyeSize*1.5)+20, eyeY, eyeSize/3.33, eyeSize/3.33);
    } else if (inputX > eyeX && inputX < eyeX+(eyeSize*1.5)) {
      fill(pupilColor);
      ellipse(eyeX, eyeY, eyeSize/3.33, eyeSize/3.33);
      ellipse(eyeX+(eyeSize*1.5), eyeY, eyeSize/3.33, eyeSize/3.33);
    }
  }

  void update() {
    //makes the eyes close or open randomly
    counter ++;
    if (counter > random(100, 400)) {
      isOpen = true;
    } 
    if (counter > random(400, 700)) {
      counter = 0;
      isOpen= false;
    }
  }
}
