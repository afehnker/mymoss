class Bullet {
  int x, y;
  //constructor
  Bullet(int xpos, int ypos) {
    x = xpos + 32/2 - 4;
    y = ypos;
  }
  //showing the bullet
  void display() {
    fill(255);
    rect(x, y, 4, 4);
    y -= 4 * 2;
  }
}
