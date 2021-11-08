/*
 The Surroundings will show all the elements of the start screen.
 The shopwindow is created with an image.
 The buttons can be clicked to navigate to a game.
 An avatar Carlos is shown and can be moved.
 The sky is displayed on top and will update its color accoriding to a counter.
 
 Illustrations made by Jacelynn Moesker and Susanne Fuentes Bongenaar
 Code written by Susanne Fuentes Bongenaar
*/

class Surroundings {
  float surroundingsX;
  float surroundingsY;
  PImage shopwindowImage;
  Sky sky1;
  Avatar carlos;

  Surroundings(float initX, float initY) {
    surroundingsX = initX;
    surroundingsY = initY;
    shopwindowImage = loadImage("shopwindow.png");
    sky1 = new Sky(initX, initY, 150);
    carlos = new Avatar(surroundingsX + 400, height - 380);
  }

  void display() {
    pushMatrix();
    imageMode(CORNER);
    translate(surroundingsX, surroundingsY);

    //display and update sky
    sky1.display();
    sky1.update();

    //display shopwindow
    image(shopwindowImage, 0, 150);

    //create the pavement
    fill(130);
    noStroke();
    rect(0, height-100, width, 100);
    popMatrix();

    //display the avatar
    carlos.display();
  }

  //move the avatar
  void moveAvatar() {
    carlos.move();
  }

  //when the left button is clicked and game 1 and 2 are not active, activate game 1 and reset the puzzle piece positions
  void selectGameButtonLeft(float newX, float newY) {
    //check if the mouse position is within the left button area, only if there is no game being displayed
    if (newX < surroundingsX + 387 && newX > surroundingsX + 97 && newY < surroundingsY + 341 && newY > 236 && !game1 && !game2) {
      game1 = true;
      puzzleGame.loadScreen.reset();
    }
  }

  //when the right button is clicked and game 1 and 2 are not active, activate game 2 and reset the bottle positions + timer
  void selectGameButtonRight(float newX, float newY) {
    //check if the mouse position is within the right button area, only if there is no game being displayed
    if (newX < surroundingsX + 758 && newX > surroundingsX + 522 && newY < surroundingsY + 341 && newY > 236 && !game1 && !game2) {
      game2 = true;
      fillTheGlass.loadScreen.reset();
      fillTheGlass.reset();
    }
  }
}
