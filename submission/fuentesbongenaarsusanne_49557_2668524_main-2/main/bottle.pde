/*
 The Bottle is part of the Fill the Glass game and is created with an image.
 A Bottle can be selected and change position.
 
 Code written by Jacelynn Moesker and Susanne Fuentes Bongenaar
*/

class Bottle {
  boolean isSelected;
  boolean isVisible;
  float bottleX;
  float bottleY;
  PImage bottleImage;
  

  Bottle(float initX, PImage initImage) {
    isSelected = false;
    isVisible = true;
    bottleX = initX;
    bottleY = height-200;
    bottleImage = initImage;
    
  }

  void display() {
    if (isVisible) {
      pushMatrix();
      translate(bottleX, bottleY);
      imageMode(CENTER);
      image(bottleImage, 0, 0, 75, 150);
      popMatrix();
    }
  }

  //return true when the correct piece is selected
  boolean select(float newX, float newY) {
    if (newX < bottleX + 38 && newX > bottleX - 38 && newY < bottleY + 75 && newY > bottleY -75) {
      isSelected = true;
      return true;
    } else {
      return false;
    }
  }

  void deselect(Glass[] glasses) {
    if (isSelected) {
      for (int i = 0; i < glasses.length; i++) {
        if (dist(bottleX, bottleY, glasses[i].glassX, glasses[i].glassY)<50) {
          glasses[i].fillUp();
          if (glasses[i].isFull()) {
            isVisible = false;
          }
        }
      }
    }
    isSelected = false;
  }

  void move(float newX, float newY) {
    if (isSelected) {
      bottleX = newX;
      bottleY = newY;
    }
  }
}
