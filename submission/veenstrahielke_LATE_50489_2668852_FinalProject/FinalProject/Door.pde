/*=================
 The door code is written and designed by Hielke.
 
 =================
 This is the door class
 You can try to open it, the checking function will trigger and if it locked, it will tell you that.
 You need the key in order to open the door.
 You can try to open it even if it's locked by holding the mouse to see what's inside.
 
 =================*/

class Door {

  PImage door;
  float doorX = shopX + 885;
  float doorY = shopY + 235;
  float movestep = 1;
  float doorWidth = 230;
  float doorHeight = 472;

  boolean checking = false;
  boolean doorVisible = true;

  Door() {
    door = loadImage("shop-door.png");
  }

  void display() {
    if (doorVisible) {
      image(door, doorX, doorY);
      textSize(50);
      if (checking && !isBroken) {
        text ("Door is locked!!", width - 500, 50);
      }
    }
  }

  void open() {
    if (isLocked && checking) {
      doorX += random(-4, 4);
      doorY += random(-0.5, 0.5);
    } else if (!isLocked && checking) {
      doorVisible = false; // door opened
    }
  }

  void checking(float pointerX, float pointerY) {
    if (pointerX >= doorX && pointerX <= doorX+doorWidth &&
      pointerY >= doorY && pointerY <= doorY+doorHeight) {
      checking = true;   // to check if door is being checked or not.
    }
  }
  void reset() {
    doorX = shopX + 885;
    doorY = shopY + 235;
    checking = false;
  }
}
