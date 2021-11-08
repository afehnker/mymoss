class Enemy extends SpaceShip {
  //amount of lives the enemy has
  int life = 1;
  //
  Enemy(int xPos, int yPos) {
    x = xPos;
    y = yPos;
    sprite    = new String[5];
    //designing the enemy. turns 1s to white squares, and leaves 0s blank
    sprite[0] = "1011101";
    sprite[1] = "0101010";
    sprite[2] = "1111111";
    sprite[3] = "0101010";
    sprite[4] = "1000001";
  }
  //moves the enemies around the screen
  void updateObj() {
    if (frameCount%30 == 0) {
      x += direction * 32;
    }

    if (incy == true) {
      y += 32 / 2;
    }
  }
  //checks to see if they are hit by bullet and removes dead ones
  boolean alive() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);

      if (bullet.x > x && bullet.x < x + 7 * 4 + 5 && bullet.y > y && bullet.y < y + 5 * 4) {
        bullets.remove(i);

        life--;
        nextColor = color(255, 0, 0);

        if (life == 0) {
          score += 50;
          return false;
        }

        break;
      }
    }

    return true;
  }
  //moves them to the edge of the screen if the outer ones are dead
  boolean outside() {
    return x + (direction*32) < 0 || x + (direction*32) > width - 32;
  }
  //gets the location
  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
