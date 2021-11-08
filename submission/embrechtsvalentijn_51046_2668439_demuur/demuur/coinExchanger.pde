class Exchanger {

  void show(int x, int y) {

    //Draw the coin exchanger unix
    rectMode(CORNER);
    fill(157, 78, 32);

    rect(x, y, 150, 300);
    textSize(35);
    fill(0);
    text("MUNTEN", x + 10, y + 50);
    fill(255);
    stroke(4);
    rect(x + 90, y + 75, 40, 20);
    fill(0);
    rect(x + 95, y + 85, 30, 3);
    fill(100);
    rect(x+10, y+ 240, 70, 30);
  }
}
