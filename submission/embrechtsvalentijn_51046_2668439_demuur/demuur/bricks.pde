class Bricks {

  void show(int x, int y) {

    //Design of the bricks
    fill(248, 213, 63);
    noStroke();
    rect(x, y, 50, 10, 4);
    rect(x + 55, y, 50, 10, 4);
    //rect(x + 73, y + 14, 50, 10, 4);
    rect(x + 18, y + 14, 50, 10, 4);
    rect(x - 37, y + 14, 50, 10, 4);
    rect(x, y + 28, 50, 10, 4);
    rect(x + 55, y + 28, 50, 10, 4);
    rect(x - 55, y + 28, 50, 10, 4);
  }
}
