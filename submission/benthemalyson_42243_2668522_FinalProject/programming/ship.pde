class Ship {

  void display() {

    image(Ship, shipX, shipY);
  }

  void update() {

    //starts the ship moving diagonally
    if (key == ' ') {
      if (shipX > 1200) {
        shipY = shipY + 3;
        shipX = shipX -3;
      } else if (shipX <= 1200) {
        shipX = 1730;
        shipY = 200;
      }
    }
  }
}
