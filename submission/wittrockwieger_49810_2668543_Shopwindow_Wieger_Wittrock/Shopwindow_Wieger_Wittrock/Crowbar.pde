/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Crowbar { //this class is about the crowbar that can smash the window, it is called in the Window class.

  float crowbarX; //the crowbar class is located in the window class since it can break the window, and I want the crowbar to be dropped
  //when the window is broken (that is decided in the window class also)
  float crowbarY;
  float angle;

  Crowbar() { //constructor
    crowbarX = -100; //offscreen, so you dont see the crowbar when you start
    crowbarY = 100;
    angle = 45;
  }

  void display() {
    if (crowbarY < height) { //we dont draw the image anymore when it is offscreen after you break the window, because this is better for the program
      PImage crowbar = loadImage("crowbar.png");  //we use an image for the crowbar
      pushMatrix();
      translate(crowbarX, crowbarY);//use pop and push matrix and translate so we can rotate the crowbar better
      rotate(radians(angle));
      image(crowbar, -10, -10, 80, 80);
      popMatrix();
    }
  }

  void moveCrowbar(float mouseXParameter, float mouseYParameter) { //we use parameters for mouseX and mouseY, 
    //this methods is eventually called in mouseMoved in the main tab
    crowbarX = mouseXParameter;
    crowbarY = mouseYParameter;
  }
  void rotateBack() {
    angle = 45; //when the mouse is released the angel is 45 again (start value), but when you press the mouse it rotates
  }
  void rotateForward() {
    angle = 0;
  }
}
