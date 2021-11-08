/*
 The Bottle game is a game containing bottles and glasses.
 Before the game starts, a loading screen is showed.
 The game is played within a timeframe, the counter runs down to 0.
 The goal is to fill all the glasses by taking a bottle and clicking on the glass.
 Four clicks are needed to fill a bottle and the bottle will dissapear after a glass is filled.
 After all the glasses are filled within the timeframe, you will be congratulated.
 If you do not manage to fill the glasses in time, a fail message will be showed.
 
 Illustrations made by Jacelynn Moesker
 Code written by Jacelynn Moesker and Susanne Fuentes Bongenaar
*/

class BottleGame {
  boolean gameStart;
  boolean done;
  int time;
  int interval;
  int startTime;
  int currentTime;
  int[] colums = {0, 1, 2, 3, 4, 0, 1, 2, 3, 4};
  int[] rows = {0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
  PreGame loadScreen;
  Glass[] glasses1 = new Glass[10];
  Bottle[] bottles1 = new Bottle[10];

  BottleGame() {
    gameStart = false;
    time = 0;
    interval = 20;
    startTime = millis();
    currentTime = 0;
    loadScreen = new PreGame();
    for (int i = 0; i<glasses1.length; i++) {
      glasses1[i] = new Glass(colums[i]*width/8 + 240, rows[i]*height/4 +200);
    }
    for (int i = 0; i<bottles1.length; i++) {
      bottles1[i] = new Bottle(i*80+100, loadImage("bottle.png"));
    }
  }

  void display() {
    if (!gameStart) {
      loadScreen.display();
      leavePreGame();
    } else if (gameStart) {
      done = true;
      background(#FF7F7F);
      
      //draw exit button
      fill(0);
      rect(20, 20, 40, 40);
      
      //draw the cross
      stroke(255,0,0);
      strokeWeight(4);
      line(30,30,50,50);
      line(30,50,50,30);
      
      update();
      filledBottles();
      timer();
    }
  }

  // ---------------------------------------------------------------------------------- screen setup
  //deactive the current game and reinitialize the main screen
  void leaveBottleGame() {
    game2 = false;
    gameStart = false;
  }

  //when the button is clicked, run the deactivation of the current game
  void selectLeaveButton(float newX, float newY) {
    //check if the mouse position is within the correct button area
    if (newX < 60 && newX > 20 && newY < 60 && newY > 20) {
      leaveBottleGame();
    }
  }

  //leave the loading screen and start the game, a short time after 100% has been reached
  void leavePreGame() {
    if (loadScreen.counter == loadScreen.waitingTime) {
      gameStart = true;
    }
  }

  //reset important values of the loadscreen
  void resetLoadScreenValues() {
    loadScreen.reset();
  }

  void reset() {
    currentTime = 0;
    startTime = millis();
    for (int i = 0; i<glasses1.length; i++) {
      glasses1[i] = new Glass(colums[i]*width/8 + 240, rows[i]*height/4 +200);
    }
    for (int i = 0; i<bottles1.length; i++) {
      bottles1[i] = new Bottle(i*80+100, loadImage("bottle.png"));
    }
  }

  // ---------------------------------------------------------------------------------- game play

  // display the glasses and bottles in the game and check if the bottles are filled
  void update() {
    for (int i = 0; i<glasses1.length; i++) {
      glasses1[i].display();
      bottles1[i].display();
      allFilled();
    }
  }

  //display the timer if the puzzle is not done and display sorry message if the time is up
  void timer() {
    if (!done) {
      currentTime = millis() - startTime;
      time = interval-int(currentTime/1000);
      if (time > -1) {
        fill(0);
        textSize(30);
        textAlign(CENTER);
        text("Remaining time: " + time, width/2, 48);
      } else {
        background(#FF7F7F);
        fill(0);
        textSize(30);
        textAlign(CENTER);
        text("Oh no time is up, better luck next time!", width/2, height/2);
        text("Press -e- to exit the game", width/2, height/2 + 50);
      }
    }
  }

  //congratulations message
  void filledBottles() {
    if (done) {   
      fill(255);
      textSize(30);
      textAlign(CENTER);
      text("Congrats, you filled all the bottles in time!", width/2, height-200);
      text("Click on the top left button to leave the game.", width/2, height-150);
    }
  }

  //select the bottles
  void selectBottles(float newX, float newY) {
    for (int i = bottles1.length; i > 0; i--) {
      if (bottles1[i-1].select(newX, newY)) {
        break;
      }
    }
  }

  //deselect the bottles
  void deselectBottles() {
    for (int i = 0; i < bottles1.length; i++) {
      bottles1[i].deselect(glasses1);
    }
  }

  //move the bottles
  void moveBottles(float newX, float newY) {
    for (int i = 0; i < bottles1.length; i++) {
      bottles1[i].move(newX, newY);
    }
  }

  //check if all glasses are filled
  void allFilled() {
    for (int i = 0; i <glasses1.length; i++) {
      if (glasses1[i].fillCounter <= 3) {
        done = false;
      }
    }
  }
}
