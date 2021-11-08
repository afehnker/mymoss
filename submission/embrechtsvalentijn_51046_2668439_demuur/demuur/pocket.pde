boolean open = false;
boolean foodVisible = true;

class Pocket {
  PImage frikandel;
  PImage kroket;
  PImage door;
  PImage onedot;
  PImage zero;

  int x;
  int y;

  int foodType;
  void show(int x, int y, int foodType) {


    rectMode(CORNER);

    //check if coin is inserted when drawing
    if (dist(cX, cY, x + 105, y + 30) < 20) {
      open();
    }

    //Main cabinet with the food
    frikandel = loadImage("frikandel.png");
    kroket = loadImage("kroket.png");
    door = loadImage("pocket_door.png");
    onedot = loadImage("onedot.png");
    zero = loadImage("zero.png");

    int pocketHeight = 55;
    rect(x, y, 90, pocketHeight);

    //Open the door when it should be opened
    if (open == false) {
      image(door, x, y, 90, pocketHeight);
    } else {
      image(door, x, y + (pocketHeight / 10 * 9), 90, pocketHeight / 10);
      open = false;
    }

    if (foodVisible == true) {
      if (foodType == 1) {
        image(frikandel, x + 13, y + (pocketHeight / 3), 58, 20);
      } else if (foodType == 2) {
        image(kroket, x + 10, y + (pocketHeight / 4 ), 65, 25);
      }
    }

    //Side with coin insert and screen
    rect(x + 90, y, 30, pocketHeight);
    //Prices
    image(onedot, x + 90, y, 10, 16);
    image(zero, x + 100, y, 10, 16);
    image(zero, x + 110, y, 10, 16);
    stroke(2);
    //Coin slot
    ellipse(x + 105, y + 30, 19, 19);
    rect(x + 103, y + 23, 3, 13, 5);
    foodVisible = true;
  }
  void open() {
    open = true;
    delay(1500);
    for (int i = 0; i < coin.length; i++) {
      coin[i].disappear();
    }
  }
}
