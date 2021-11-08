class door {
  float doorX;
  float doorY;
  float doorWidth;
  float doorHeight; //Lines 2 to 5 let the program know these variables are floats
  color doorColor;
  color windowColor;
  color doorKnobColor; //Lines 6 to 8 let the pogram know what variables are colors
  PImage human; //This lets the program know human is an image
  int humanWidth;
  int humanHeight; //lines 10 to 11 set the two variables of the size of the image as integers 
  door(float initX, float initY) {
    doorX = initX;
    doorY = initY;
    humanWidth = 190;
    humanHeight = 260;
    human = loadImage("human.png");
    human.resize(humanWidth, humanHeight);
    doorWidth = 200;
    doorHeight = 430;
    doorColor = color(155, 103, 60);
    windowColor = color(101, 225, 255);
    doorKnobColor = color(255, 255, 0);
  }
  void display(boolean isOpen, boolean isClicked) {
    rectMode(CENTER);
    // if the door is open and the mouse is clicked and if the door is open and then draws the necessary things
    if (isOpen == true && isClicked == true) {
      fill(doorColor);
      rect(doorX - 110, doorY, 20, doorHeight);
      image(human, doorX-90, doorY-180);
    } else {
      fill(doorColor);
      rect(doorX, doorY, doorWidth, doorHeight);
      fill(windowColor);
      rect(doorX, doorY-80, doorWidth-50, doorHeight-200);
      fill(doorKnobColor);
      ellipse(doorX+88, doorY, 15, 15);
    }
    rectMode(CORNER);
  }
  boolean isOver(float refX, float refY) {
    //checks if the mouse is over the door
    if (dist(refX, refY, doorX, doorY)<=108 || dist(refX, refY, doorX, doorY+95)<=108 || dist(refX, refY, doorX, doorY-95)<=108) {
      return true;
    } else {
      return false;
    }
  }
}
