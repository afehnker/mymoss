/*
 The PreGame is a class that displays a counting up counter with a percentage sign.
 It is part of the Fill the Glass and Puzzle game.
 
 Code written by Susanne Fuentes Bongenaar
*/

class PreGame {
  int counter;
  int counterTime;
  int counterSteps;
  int waitingTime;

  PreGame() {
    counter = 0;
    counterTime = 0;
    counterSteps = 35;
    waitingTime = 130;
  }

  void display() {
    background(0);

    //create loading counter with percentage sign, with a constrained value of 100
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(constrain(counter, 0, 100)+"%", width/2, height/2);

    //update the counter
    updateCounter();
  }

  //update the counter once the page is displayed, until it reaches 100
  void updateCounter() {
    //check if the counter should be updated and is under the value 100
    if (millis() > counterTime && counter < waitingTime) {
      counter = counter + 1;
      counterTime = counterTime + counterSteps;
    }
  }

  //reset the counter values, making sure the loading time will be the same every time
  void reset() {
    counter = 0;
    //make sure the value distance between counterTime and millis(); is the same each time the loading screen gets called
    counterTime = millis();
  }
}
