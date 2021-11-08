class Platter {
  //variable declaration
  float x, y;
  int clockwiseCounter;
  int moveCounter, rPos;
  boolean clockwise, isMoving, isOpen, promptDialogue;

  Platter(float initX, float initY) {
    //variable initialization inside the constructor
    x = initX;
    y = initY;
    clockwiseCounter = int(random(125, 250));//initialized randomly so that the platters will not move simultanously
    moveCounter = 0;
    clockwise = false;
    isOpen = false;
    promptDialogue = false;
  }

  void display() {
    //masterpiece of a sketch, resembling a platter
    pushMatrix();
    translate(x, y);
    stroke(0);
    fill(210);
    strokeWeight(3);
    quad(-120, 200, 120, 200, 50, 250, -50, 250);
    quad(-50, 200, 50, 200, -30, 220, 30, 220);
    fill(255);
    arc(0, 0, 480, 480, 1, PI-1, OPEN);
    arc(0, 404, 480, 480, PI+1, 2*PI-1, OPEN);
    popMatrix();
  }

  void move(float xCenter, float yCenter) {
    //rotates the platters either clockwise or counterclockwise, during certain intervals of time
    if (isMoving) {
      if (clockwise) {
        x -= 0.1 * (y - yCenter);
        y += 0.1 * (x - xCenter);
      } else {
        x += 0.1 * (y - yCenter);
        y -= 0.1 * (x - xCenter);
      }
    }
  }

  void update(float initX) {
    //updates the counter which tells whether the platters move either clockwise or counterclockwise and the regular counter
    if (isMoving) {
      moveCounter++;
      clockwiseCounter++;
      if (clockwiseCounter % 250 < 125) {
        clockwise = true;
      } else {
        clockwise = false;
      }
    }
    //the regular counter prevents the platters from stopping immediatly after moving
    if (moveCounter > 60 && (correctYPos() && correctXPos(initX))) {//stops the platters when they reach the initial location
      isMoving = false;
      moveCounter = 0;
      promptDialogue = true;  //hides the dialogue while the platters rotate
    }
  }

  void startRotating(float mX, float mY) {
    //triggers the rotation of the platters   
    if (isOver(mX, mY)) {
      promptDialogue = false;  
      if (isMoving == false) {
        isMoving = true;
      }
    }
  }

  boolean isOver(float mX, float mY) {
    //checks wether the mouse is over the rotate button
    if (mX <= 350 && mX >= 150 && mY <= 950 && mY >= 850) {
      return true;
    }
    return false;
  }

  boolean correctYPos() {
    //checks for the initial yPosition
    if (int(y) >= height/2 - 5  && int(y) <= height/2 + 5) {
      return true;
    }
    return false;
  }

  boolean correctXPos(float initX) {
    //checks for the initial xPosition
    if (int(x) >= initX - 5  && int(x) <= initX + 5) {
      return true;
    }
    return false;
  }

  void prompt() {
    //displays the prompt dialogue
    if (promptDialogue == true) {
      textSize(70);
      text ("Choose a platter!", 450, 930);
    }
  }
}
