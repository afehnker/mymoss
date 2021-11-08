class Coin {
  int coinPosX;
  float coinPosY;
  float velocity;
  float time;
  int addY;
  PFont win;

  Coin(int initPosX, int addY) {
    coinPosX = initPosX;
    coinPosY = coinPosY+addY;
    velocity = 0;
    time = 0;
    win = createFont("Arial", 50, true);
  }

  void display() {
    fill(#EABC21);
    stroke(0);
    ellipse(coinPosX, coinPosY, 50, 50);
    rectMode(CENTER);
    fill(#3DC44E);
    rect(width/2, height/2, 225, 120);
    rectMode(CORNER);
    textAlign(CENTER);
    fill(0);
    textFont(win, 45); 
    text("you won!!", width/2, height/2);
  }

  void update(int border) { 
    time = time + (0.0166);
    velocity += 9.81 *time;
    coinPosY += velocity*time;
    if (coinPosY >= border) {
      coinPosY = border;
      velocity = 0;
      time = 0;
    }
  }
}
