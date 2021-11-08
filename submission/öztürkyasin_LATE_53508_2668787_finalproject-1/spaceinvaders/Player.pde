class Player extends SpaceShip { //defines class player
  boolean canShoot = true; //states that the player can make the spaceship shoot
  int shootdelay = 0; //makes sure there is no delay when you try to shoot for the first time and initialises shoot delay

  Player() {
    x = width/gridsize/2;
    y = height - (30 * pixelsize);
 //sets position of Player
  }

  void updateObj() {
//spaceship will be at mouseX   
    x = mouseX;
//the shooting function
    if (keyPressed && keyCode == CONTROL && canShoot) {  //check to see if the ship can shoot
      bullets.add(new Bullet(x, y));
      canShoot = false;
      shootdelay = 0;  //putting delaycounter back to 0
    }

    shootdelay++;  //increase delaycounter every frame

    if (shootdelay >= 20) {  //adding the actual delay to the shooting
      canShoot = true;
    }
  }
}
