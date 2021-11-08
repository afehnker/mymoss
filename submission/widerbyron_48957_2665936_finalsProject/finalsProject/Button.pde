/*
  Button class 
 Used by the LeftSymbol class to check which point of the star was clicked and returns a true when it knows it was clicked. 
 Author: Byron
 */

class Button {

  float buttonX;
  float buttonY;
  float buttonSize;

  Button(float xPos, float yPos, float size) {
    buttonX = xPos;
    buttonY = yPos;
    buttonSize = size;
  }


  void display() {
    pushMatrix();
    translate(buttonX, buttonY);
    noStroke();
    noFill();
    ellipse(0, 0, buttonSize, buttonSize);

    popMatrix();
  }

  boolean isPressed(float relMouseX, float relMouseY, int arrayPos) {

    //Calculates the position of the current button based on position in the array. 
    //because we know that every button is 60*i rotated by the star, we can calculate the position with the formula for rotating a vector, 
    //because the inital angle of the vector was 0 we can simply use 60*index position to get the angle and add it into the formula. 
    float rotatedX = buttonX * cos(radians(60*arrayPos)) - buttonY * sin(radians(60*arrayPos));
    float rotatedY = buttonX * sin(radians(60*arrayPos)) + buttonY * cos(radians(60*arrayPos));

    //from there we take the radius of the button, and see if the translated mouse position is in the range of the button.
    if (relMouseX < (rotatedX + buttonSize/2) && relMouseX > (rotatedX - buttonSize/2) && relMouseY < (rotatedY + buttonSize/2) && relMouseY > (rotatedY - buttonSize/2)) {
      println("BUTTON " + arrayPos + " WAS PRESSED AND SAYS: THIS IS TRUE" );
      return true;
    } else {
      return false;
    }
  }
}
