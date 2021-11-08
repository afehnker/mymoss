class Scoreboard {
  int shavingScore;
  float scaleTimer = 0;
  float scaleFactor;
  int countdown = 19; //sets the time you have to shave, count down from here.
  int countdownFrameCounter = 0;  //every time this is 60 (so 1 sec has passed), take 1 from the countdown.
  float countdownDecimal = 99;
  boolean runTheCountdown;

  Scoreboard() {
  }

  void display() {
    if (scaleTimer < 10) {
      scaleTimer += 0.004*3.1416; //Not PI, since it's difficult about multiplication. Every frame, increment scaleTimer
    } else {
      scaleTimer = 0;
    }

    scaleFactor = 0.5*abs(sin(scaleTimer)) + 1;    //makes a nice oscillation in scale factor, for that "jumping" text.

    textAlign(CENTER);
    textSize(30);
    pushMatrix();
    translate(650, 100);
    scale(scaleFactor);
    text("Score { " + shavingScore + " }", 0, 0);
    popMatrix();

    textAlign(LEFT);
    text("Time (" + countdown + "." + round(countdownDecimal), 650, 50);
    text(")", 797, 50);
  }

  void scorePlusUpdate() {
    if (runTheCountdown == true) {    
      shavingScore += 1;
    }
  }

  void scoreMinusUpdate() {
    if (runTheCountdown == true) {
      shavingScore -= 1;
    }
  }

  void runGameCountdown() {
    if (runTheCountdown == true) {
      countdownFrameCounter += 1;
      if (countdownFrameCounter == 60) {    //every 60 frames (1s), count down.
        countdownFrameCounter = 0;
        countdown -= 1;
        countdownDecimal = 99;  //reset to 99 after 60 frames. Need to divide 99 numbers over 60 steps to end up at 0.. Meaning subtract 1.65 every time and round. See just above scorePlusUpdate.
      }

      //have a decimal part that goes from 99 to 0 every 60 frames, for that "speed" effect:
      countdownDecimal -= 1.65;
    } else {
      countdown = 0;
      countdownDecimal = 0;

      textSize(60);    //if countdown is not running, game is over. Display the gameover text:
      fill(0);
      rect(300, 245, 330, 170);
      fill(240, 0, 0);
      text("GAME OVE(R)", 300, 300);
      text("R TO RESET", 300, 400);
    }

    if (countdown <= 0) {
      if (countdownDecimal <= 0) {
        runTheCountdown = false;
      }
    }
  }

  void resetScoreboard() {      //resets the scoreboard. Called in ShopFront2, to reset the scoreboard just before the game starts.
    countdown = 19;
    countdownDecimal = 99;
    countdownFrameCounter = 0;
    runTheCountdown = true;
    shavingScore = 0;
  }
}
