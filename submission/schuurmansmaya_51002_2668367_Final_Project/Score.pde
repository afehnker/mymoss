class Score {
  float scorex;
  float scorey;
  int point = 0;

  Score(float x, float y) {
    scorex = x;
    scorey = y;
  }

  void display() {
    textSize(33);
    fill(255, 255, 255);
    text("Score:  " + point, scorex, scorey);
  }
}
