class Score
{

  float scoreX;
  float scoreY;

  int counter;

  Score(float initX, float initY) {
    scoreX = initX;
    scoreY = initY;

    counter = 0;
  }

  void display() {
    String displayCounter = "score = "+counter;
    textAlign(CENTER);
    textSize(32);
    fill(255);
    text(displayCounter, scoreX, scoreY);
  }

//update counter for collecting acorns
  void counterAcorns() {
    counter = counter + 5;
  }

//update counter for collecting leaves
  void counterLeaves() {
    counter = counter + 1;
  }

//for some reason the acorns one didn't work, so I had to do it another way
  void updateScore() {
    score.counterAcorns();
  }

//counter when game ends
  void scoreReset() {
    counter = 0;
  }
}
