int coinX;
int coinY;
int coinD;


float cX = 675;
float cY = 355;

class Coin {

  int coinSize = 15;
  boolean overCoin = false;
  boolean coinStuck = false;
  float xOffset = 0.0;
  float yOffset = 0.0;

  Coin(int cX, int xY) {
    rectMode(RADIUS);
  }

  void show() {

    //See if the cursur is above the box
    fill(#d4af37);

    if (mouseX > cX - coinSize & mouseX < cX + coinSize &&
      mouseY > cY - coinSize & mouseY < cY + coinSize) {
      overCoin = true;
      if (!coinStuck) {
        stroke(255);
        fill(#d4af37);
      }
    } else {
      stroke(153);
      fill(#d4af37);
      overCoin = false;
    }

    // Draw the coin
    ellipse(cX, cY, coinSize, coinSize);
    rectMode(CORNER);
  }
  void clicked() {

    //If cursor is above the coin then make it moveable
    if (overCoin) {
      coinStuck = true;
      fill(#d4af37);
    } else {
      coinStuck = false;
    }
    xOffset = mouseX-cX;
    yOffset = mouseY-cY;
    rectMode(CORNER);
  }

  void dragged() {
    if (coinStuck) {
      cX = mouseX-xOffset;
      cY = mouseY-yOffset;
    }
  }
  void released() {
    coinStuck = false;
  }
  void disappear() {
    xOffset = 0.0;
    yOffset = 0.0;
    cX = 675;
    cY = 355;
  }
}
