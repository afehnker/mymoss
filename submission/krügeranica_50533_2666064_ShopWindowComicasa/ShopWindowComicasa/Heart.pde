/* 
 The class is used during the game of the Ninja. 
 During the game, there is always one heart passing the screen. 
 The user can jump up to catch the heart. 
 If this happens, the heart won't exist anymore and will start again from the edge of the screen. 
 */
 
class Heart {
  //Position
  float xPosHeart;
  float yPosHeart;
  
  //speed for movement
  int speed;
  
  //if heart is on the screen
  boolean exist;

  //constructor
  Heart(float newX, float newY) {
    xPosHeart = newX; 
    yPosHeart = newY;
    speed = 0;
    exist = false;
  }

  void display() { 
    chooseForDisplay();
    if (!exist) {
      xPosHeart = 0;
    }
    fill(255, 0, 0);
    //half on the right
    pushMatrix();
    translate(xPosHeart, yPosHeart);
    rotate(radians(30));
    ellipse(0, 0, 20, 40);
    popMatrix();
    //half on the left
    pushMatrix();
    translate(xPosHeart-12, yPosHeart);
    rotate(radians(-30));
    ellipse(0, 0, 20, 40);
    popMatrix();
  }

  void movement() {
    exist = true;
    //makes sure that the heart moves and won't stay at the same point
    if (speed==0) {
      speed = int(random(-2, 2));
    }
    //moves the heart
    xPosHeart = xPosHeart + speed;
    if (xPosHeart>width+40) {
      //Heart leaves the screen on the right side and gets displayed on the left side
      xPosHeart = 0;
      speed = int(random(1, 2));
    } else if (xPosHeart<-40) {
      //Heart leaves the screen on the left side and gets displayed on the right side
      xPosHeart = width;
      speed = int(random(-2, -1));
    }
  }

  //used if the Heart gets caught by the Ninja to reset the position
  void chooseForDisplay() {
    if (xPosHeart >width || !exist)
    {
      reset();
    } else {
      movement();
    }
  }

  //sets all variables to the start postion
  void reset() {
    yPosHeart = height/2;
    xPosHeart = -20;
    speed = -speed;
    movement();
  }

  void setExist(boolean newValue) {
    exist = newValue;
  }
}
