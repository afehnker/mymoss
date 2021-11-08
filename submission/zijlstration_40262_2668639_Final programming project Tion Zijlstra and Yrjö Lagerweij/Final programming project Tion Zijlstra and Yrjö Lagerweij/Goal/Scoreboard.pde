class Scoreboard {
  int scorecounter = 0;
  int savecounter = 0;
  int misscounter = 0;

  void display() {
    //making the scoreboard
    fill(255);
    rect(650, 10, 120, 80);
    textSize(14);
    fill(0);
    text("score:", 660, 30);
    text(scorecounter, 715, 30);
    text("misses:", 660, 50);
    text(misscounter, 715, 50);
    text("saved:", 660, 70);
    text(savecounter, 715, 70);
  }

  void addScore() { //Used to add a number to score counter on the scoreboard
    scorecounter++;
  }
  void addMiss() {  //Used to add a number to misses counter on the scoreboard
    misscounter++;
  }

  void addSave() { //Used to add a number to saved counter on the scoreboard
    savecounter++;
  }
}
