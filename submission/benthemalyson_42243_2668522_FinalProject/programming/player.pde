class Player extends SpaceShip {
  boolean canShoot = true;
  int shootdelay = 0;

  //draws the player
  Player() {
    x = width/32/2;
    y = height - (10 * 4);
    sprite    = new String[5];
    //designing the player. turns 1s to white squares, and leaves 0s blank
    sprite[0] = "0010100";
    sprite[1] = "0110110";
    sprite[2] = "1111111";
    sprite[3] = "1111111";
    sprite[4] = "0111110";
  }

  //moves the player
  void updateObj() {
    if (keyPressed && keyCode == LEFT) {
      x -= 5;
    }
    if (keyPressed && keyCode == RIGHT) {
      x += 5;
    }
    //shoots the bullets
    if (keyPressed && keyCode == CONTROL && canShoot) {
      bullets.add(new Bullet(x, y));
      canShoot = false;
      shootdelay = 0;
    }
    //makes sure that bullets cant be fired in rapid succession
    shootdelay++;
    if (shootdelay >= 20) {
      canShoot = true;
    }

    //loops the player so they cant go off screen
    if (x>1925) {
      x=-5;
    }
    if (x<-5) {
      x=1925;
    }
  }
  //finds the location
  float locationX() {
    return x;
  }

  float locationY() {
    return y;
  }
}
