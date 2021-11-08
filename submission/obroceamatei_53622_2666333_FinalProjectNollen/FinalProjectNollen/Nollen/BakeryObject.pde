class BakeryObject {
  //variable declaration
  float x, y;
  boolean result, show;
  int showCounter;
  int withinCase;

  BakeryObject(float initX, float initY) {
    //variable initialization inside the constructor
    x = initX;
    y = initY;
    result = false;
    showCounter = 0;
    withinCase = 0;
  }

  void display() {
    //bread drawing
    pushMatrix();
    translate(x, y);
    strokeWeight(1);
    fill(196, 144, 53);
    rotate (PI/3);
    ellipse (0, 0, 25, 50);
    fill (0);
    rotate (PI/2.5);
    ellipse (10, 2, 3, 13);
    ellipse (-1, 0, 3, 13);
    ellipse (-11, -2, 3, 13);
    popMatrix();
  }

  void update(float platterX, float platterY) {
    //The bread remains stuck to one of the platter while moving
    x = platterX;
    y = platterY;
  }

  void updateResult() {
    //Creates a result, as an outcome of chosing an option
    textSize(80);
    if (showCounter < 60) { // displays the result of time for a limited amount of time
      if (show == true && withinCase == 1)
      {
        showCounter++;
        if (showCounter > 20) { //adds a delay before displaying the result
          fill(0, 255, 10);
          text("Congratulations!!", 420, 400);
        }
      } else if (show == true && withinCase == 2) { 
        showCounter++;
        if (showCounter > 20) {
          fill(255, 0, 10);
          text("Try Again :(", 500, 400);
        }
      }
    } else {
      //ends the displaying after the previously-mentioned amount of time
      showCounter = 0;
      show = false;
    }
  }

  void showResult() {
    //triggers the display of the result when called and when the condition are met
    if (show == false) {
      show = true;
    }
  }

  void isWithin(float mX, float mY) {
    //checks whether the mouse is over either the correct or the wrong platters
    if (mX <= x + 150 && mX >= x - 150 && mY <= y + 100 && mY >= y - 100) {
      withinCase = 1; //called when the correct platter is chosen
    } else if (mY <= y + 100 && mY >= y - 100 && mX > 100 && mX < 1350) {
      withinCase = 2; //called when the wrong platters are chosen
    } else withinCase = 0; //display nothing, as nothing is being chosen (clicked)
  }
}
