class Lid {
  //variable declaration
  float x, y, dy, ddy;
  boolean open, rotate, isWithin;
  int openCounter;

  Lid(float initX, float initY) {
    //variable initialization inside the constructor
    x = initX;
    y = initY;
    dy = 0;
    ddy = 1;
    open = false;
    rotate = false;
  }

  void display() {
    //the incredibly artistic sketch of a lid, resulted from the colaboration of Matei Obrocea and Soham H. Nanwani
    pushMatrix();
    translate(x, y);
    strokeWeight(3);
    fill(200);
    arc(0, 205, 200, 200, PI, 2*PI, OPEN);
    arc(0, 50, 550, 332, 1.2, PI-1.2, OPEN);
    fill(145, 60, 10);
    
    //lid handle
    triangle(-20, 95, 20, 95, 0, 115);
    popMatrix();
  }

  void updatePosition(float initX, float initY) { 
    //method which updates the lids position either by rotating or opening and closing them
    
    //opening part
    if (open == true) {
      openCounter++;
      if (y > 480) {
        ddy = 0.2; // adds acceleration when opened, for a smooth opening
      } else {
        ddy = -0.05; //adds deceleration when the lead reaches a threshold, for a smooth closing
      }
      dy += ddy ;
      y -= dy;
      
      //stops the lids when they reach the original position
      if (openCounter > 120 && correctYPos()) {
        open = false;
        openCounter = 0;
      }
    } else if (rotate == true) {
      
      //rotating part - follows the platters they are attached to
      x = initX;
      y = initY;
    }
  }

  void open(int z) {
    //triggers the opening of a certain lid
    if (isWithin(mouseX, mouseY, z)) {
      if (open == false) {
        open = true;
      }
    }
  }
  
  void rotate_() {
    //triggers the rotation of the lids
    if (rotate == false) {
      rotate = true;
    }
  }

  boolean correctYPos() {
    //checks if the lids have returned to the initial position
    if (y >= height/2 - 5  && y <= height/2 + 7) {
      return true;
    }
    return false;
  }
  
  void openAll() {
    //triggers the opening of all lids simultaneously
    if (open == false) {
      open = true;
    }
  }

  boolean isWithin (float mX, float mY, int i_) {
    //checks whether the mouse is over the correct lid (that certain lid)
    if (mX <= lids[i_].x + 125 && mX >= lids[i_].x - 125 && mY <= lids[i_].y + 300 && mY >= lids[i_].y + 100) {
      return true;
    }
    return false;
  }
}
