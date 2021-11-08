class Box {
  float boxX;
  float boxY;
  float boxWidth;
  float boxHeight;
  float originalBoxX;
  float originalBoxY; //Lines 2 to 7 introduce the variables necessary later in the code
  color boxColor;
  Box(float initX, float initY, float initWidth, float initHeight) {
    boxX = initX;
    boxY = initY;
    originalBoxX = initX;
    originalBoxY = initY;
    boxWidth = initWidth;
    boxHeight = initHeight;
    boxColor = color(201, 134, 0);
  }
  void display() {
    //draws the box
    rectMode(CENTER);
    fill(boxColor);
    rect(boxX, boxY, boxWidth, boxHeight);
    rectMode(CORNER);
    fill(120);
  }

  void update(float locX, float locY) {
    // checks if the mouse is over the box and if it is the location of the box is the same as the mouse and also the color to be dependent on the mouse location
    if (dist(locX, locY, boxX, boxY)<=32  ) {
      boxX = locX;
      boxY = locY;
      boxColor = color(locX, locY, locX/locY);
    }
  }
  void change() {
    //changes the box color to a random one
    boxColor = color(random(1, 255), random(1, 255), random(1, 255));
  }
  void rngLocation(float leftWindowX, float leftWindowY, float rightWindowX, float rightWindowY, float refX, float refY) {
    // if the mouse is over the box it changes the location to a random one inside the window
    if (dist(refX, refY, boxX, boxY)<=32) {
      boxX = random(leftWindowX+boxWidth, rightWindowX-boxWidth);
      boxY = random(leftWindowY*1.5+boxHeight, rightWindowY-boxHeight);
    }
  }
  void resetBox() {
    // resets the location
    boxX = originalBoxX;
    boxY = originalBoxY;
  }
}
