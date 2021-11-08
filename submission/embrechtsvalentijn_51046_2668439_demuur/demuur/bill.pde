import processing.sound.*;

int billX;
int billY;

float bX = 750;
float bY = 550;

Coin[] coin = new Coin[3];


class Bill {

  boolean overbill = false;
  boolean locked = false;
  float xOffset = 0.0;
  float yOffset = 0.0;

  boolean playSound = true;


  Bill() {
    rectMode(RADIUS);

    for (int i = 0; i < coin.length; i++) {
      coin[i] = new Coin(675, 355);
    }
  }

  void show(int billX, int billY) {
    // Check cursor position
    if (mouseX > bX - 30 & mouseX < bX + 30 &&
      mouseY > bY - 50 & mouseY < bY + 50) {
      overbill = true;
      if (!locked) {
        stroke(255);
        fill(153);
      }
    } else {
      stroke(153);
      fill(255, 0, 0);
      overbill = false;
    }
    //When bill is inserted
    if (dist(bX, bY, 750, 178) < 20) {
      //Make the coin available and play a sound
      if (playSound == true) {

        file.play();
        playSound = false;
      }
      coin[0].show();
    }
    if (dist(bX, bY, 750, 178) > 20) {
      playSound = true;
    }

    // Draw the bill
    fill(0, 255, 0);
    rect(bX, bY, 30, 50);
    rectMode(CORNER);
  }
  void clicked() {
    if (overbill) {
      locked = true;
      fill(255, 255, 255);
    } else {
      locked = false;
    }
    xOffset = mouseX-bX;
    yOffset = mouseY-bY;
    rectMode(CORNER);

    wallet.clicked();
  }


  void dragged() {
    if (locked) {
      bX = mouseX-xOffset;
      bY = mouseY-yOffset;
    }
  }
  void released() {
    locked = false;
  }
  void disappear() {
    xOffset = 0.0;
    yOffset = 0.0;
    bX = 675;
    bY = 355;
  }
}
