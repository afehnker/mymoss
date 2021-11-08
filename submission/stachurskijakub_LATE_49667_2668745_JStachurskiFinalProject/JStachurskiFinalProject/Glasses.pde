/*
  Glasses
  The things you put on and off your head or the shelf
  Made by: Jakub Stachurski

*/


//PImage glassesMask; In the main class
//PImage glassesIconBase;

class Glasses {
  static final int iconSize = 80; 
  static final int sizeX = 200, sizeY = 100;
  boolean isPicked, isOn;
  int originX, originY;
  color effectColor;
  PImage icon;
  PImage onRack;
  Glasses(int x, int y, color c) {
    originX = x;
    originY = y;
    isPicked = false;
    isOn = false;
    //Makes icon a particular color
    icon = createImage(iconSize, iconSize, RGB);
    icon.loadPixels();
    for (int i = 0; i < icon.pixels.length; i++) {
      icon.pixels[i] = c;
    }
    icon.mask(glassesIconBase);
    //Makes the glasses on the rack a particular color
    onRack = createImage(sizeX, sizeY, RGB);
    onRack.loadPixels();
    for (int i = 0; i < onRack.pixels.length; i++) {
      onRack.pixels[i] = c;
    }
    onRack.mask(glassesMask);
    effectColor = c;
  }
  void display() {
    if (isPicked && isOn) { //When the glasses are on
      noStroke();
      fill(color(red(effectColor), green(effectColor), blue(effectColor), 100));
      rect(0, 0, width, height);
    } else if (isPicked) { //When you got the glasses on you
      image(icon, 200, height - 200);
    } else {
      image(onRack, originX, originY); //When the glasses are on the rack
    }
  }

  boolean checkIfWithin(int x, int y) {
    return (!isPicked && x > originX && x < originX + sizeX && y > originY && y < originY + sizeY);
  }
  void setIsOn(boolean bool) {
    isOn = bool;
  }
  void setIsPicked(boolean bool) {
    isPicked = bool;
  }
}
