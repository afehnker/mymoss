class StartScreen {
  //variable and objects declarations
  Snow[] snowflakes = new Snow[300];
  boolean isDisplayed;

  StartScreen () {
    //variable and objects initialization
    isDisplayed = true;
    /* for (int i = 0; i < snowflakes.length; i++) { //create new snowflakes
     snowflakes[i] = new Snow();
     }*/ //commented out because we were not sure whether to add the effect or not
  }
  void display() {
    //displays the startscreen when toggled
    if (isDisplayed) {
      background(0);
      fill(201, 13, 0);
      rect(500, 100, 500, 170);
      fill(255, 200, 0);
      noStroke();
      rect(520, 120, 460, 10);
      textSize(100);
      text("NOLLEN", 550, 230); 
      textSize(97);
      fill(255);
      text("NOLLEN", 555, 230); 
      fill(205);
      textSize(50);
      text("Welcome to the platter game!", 385, 400);
      textSize(30);
      text("You have to guess where the loaf is!", 490, 480);
      text("- press spacebar to start -", 558, 800);
      /*for (int i = 0; i < snowflakes.length; i++) {
       snowflakes[i].dropdown(); // snowflakes speed and position
       snowflakes[i].display(); // display snowflakes
       }*/
    }
  }

  boolean isOver(float mX, float mY) {
    //checks wether the mouse is over the second button
    if (mX <= 1350 && mX >= 1150 && mY <= 950 && mY >= 850) {
      return true;
    }
    return false;
  }

  void backToStart(float mX, float mY) {
    //returns to start screen
    if (isDisplayed == false && isOver(mX, mY)) {
      isDisplayed = true;
    }
  }

  void play() {
    //hides the start screen
    if (isDisplayed == true) {
      isDisplayed = false;
    }
  }
}
