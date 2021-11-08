class Games {
  boolean marioSelect, fifaSelect; 

  void display() {
    if (fifaSelect) {
      ball.display();
    } else if (marioSelect) {
      marioBros.display();
    }
  }

  void choosegame(int mX, int mY) {
    if ((mX >= 180 && mX <= 180 + mario.width) && (mY >= height - 400 && mY <= height -400 + mario.height)) {
      marioSelect = true;
    } else if ((mX >= 180 && mX <= 180 + fifa.width) && (mY >= height - 500  && mY <= height - 500 + fifa.height)) {
      fifaSelect = true;
    }
  }
}
