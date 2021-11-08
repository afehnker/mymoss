/* 
The class is used during the game of the Ninja. 
 During the game, three throwing stars are passing the screen. 
 The user has to avoid them by jumping. 
 If they collide, the throwing star gets reset and stars at a random y position. 
 */

class ThrowingStar {
  //position
  float xPosThrowingStar;
  float yPosThrowingStar;
  
  //speed for movement
  int speed;
  
  //if throwing star is on the screen
  boolean exist;

  //constructor
  ThrowingStar(float newX, float newY) {
    xPosThrowingStar = newX; 
    yPosThrowingStar = newY;
    speed = 0;
    exist = false;
  }

  void display() { 
    chooseForDisplay();
    if (!exist) {
      xPosThrowingStar = 0;
    }
    pushMatrix();
    translate(xPosThrowingStar, yPosThrowingStar); // middle of star
    rotate(millis() * -0.005);
    fill(211, 175, 55);
    triangle(0, 0, 20, 0, 10, -20);
    triangle(0, 0, -10, 20, 10, 20);
    triangle(20, 0, 10, 20, 30, 20);
    popMatrix();
  }

  void movement() {
    exist = true;
    //makes sure that the throwing star moves and won't at the same point
    if (speed==0) {
      speed = int(random(-5, 5));
    }
    //moves the throwing star
    xPosThrowingStar = xPosThrowingStar + speed;
    if (xPosThrowingStar>width) {
      //Throwing star leaves the screen on the right side and gets displayed on the left side
      xPosThrowingStar = 0;
      speed = int(random(1, 5));
    } else if (xPosThrowingStar<0) {
      //Throwing star leaves the screen on the left side and gets displayed on the right side
      xPosThrowingStar = width;
      speed = int(random(-5, -1));
    }
  }

  //used if the throwing star and the Ninja collides to reset the position
  void chooseForDisplay() {
    if (xPosThrowingStar >=width || !exist)
    {
      reset();
    } else {
      movement();
    }
  }

  //sets all variables to the start postion
  void reset() {
    yPosThrowingStar = random(600, 800);
    xPosThrowingStar= 0;
    movement();
  }

  void setExist(boolean newValue) {
    exist = newValue;
  }
}
