//the bullet class. they appear when pressing   CTRL, and are used to destroy the enemies

class Bullet {
  int x, y;
//bullet starts at player x and y
  Bullet(int xpos, int ypos) {
    x = xpos + gridsize/2 - 4;
    y = ypos;
  }

  void draw() {
    image(kogels,x, y,16,38); //loads the image for the bullet and downsizes it so it looks like a bullet and not a rocket
    y -= pixelsize * 2;  //moves the bullet up
  }
}
